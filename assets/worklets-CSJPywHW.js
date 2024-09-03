(function () {
  'use strict';

  // sourced from https://github.com/olvb/phaze/tree/master?tab=readme-ov-file
  const WEBAUDIO_BLOCK_SIZE = 128;

  /** Overlap-Add Node */
  class OLAProcessor extends AudioWorkletProcessor {
    constructor(options) {
      super(options);
      this.started = false;
      this.nbInputs = options.numberOfInputs;
      this.nbOutputs = options.numberOfOutputs;

      this.blockSize = options.processorOptions.blockSize;
      // TODO for now, the only support hop size is the size of a web audio block
      this.hopSize = WEBAUDIO_BLOCK_SIZE;

      this.nbOverlaps = this.blockSize / this.hopSize;

      // pre-allocate input buffers (will be reallocated if needed)
      this.inputBuffers = new Array(this.nbInputs);
      this.inputBuffersHead = new Array(this.nbInputs);
      this.inputBuffersToSend = new Array(this.nbInputs);
      // default to 1 channel per input until we know more
      for (let i = 0; i < this.nbInputs; i++) {
        this.allocateInputChannels(i, 1);
      }
      // pre-allocate input buffers (will be reallocated if needed)
      this.outputBuffers = new Array(this.nbOutputs);
      this.outputBuffersToRetrieve = new Array(this.nbOutputs);
      // default to 1 channel per output until we know more
      for (let i = 0; i < this.nbOutputs; i++) {
        this.allocateOutputChannels(i, 1);
      }
    }

    /** Handles dynamic reallocation of input/output channels buffer
       (channel numbers may lety during lifecycle) **/
    reallocateChannelsIfNeeded(inputs, outputs) {
      for (let i = 0; i < this.nbInputs; i++) {
        let nbChannels = inputs[i].length;
        if (nbChannels != this.inputBuffers[i].length) {
          this.allocateInputChannels(i, nbChannels);
        }
      }

      for (let i = 0; i < this.nbOutputs; i++) {
        let nbChannels = outputs[i].length;
        if (nbChannels != this.outputBuffers[i].length) {
          this.allocateOutputChannels(i, nbChannels);
        }
      }
    }

    allocateInputChannels(inputIndex, nbChannels) {
      // allocate input buffers

      this.inputBuffers[inputIndex] = new Array(nbChannels);
      for (let i = 0; i < nbChannels; i++) {
        this.inputBuffers[inputIndex][i] = new Float32Array(this.blockSize + WEBAUDIO_BLOCK_SIZE);
        this.inputBuffers[inputIndex][i].fill(0);
      }

      // allocate input buffers to send and head pointers to copy from
      // (cannot directly send a pointer/subarray because input may be modified)
      this.inputBuffersHead[inputIndex] = new Array(nbChannels);
      this.inputBuffersToSend[inputIndex] = new Array(nbChannels);
      for (let i = 0; i < nbChannels; i++) {
        this.inputBuffersHead[inputIndex][i] = this.inputBuffers[inputIndex][i].subarray(0, this.blockSize);
        this.inputBuffersToSend[inputIndex][i] = new Float32Array(this.blockSize);
      }
    }

    allocateOutputChannels(outputIndex, nbChannels) {
      // allocate output buffers
      this.outputBuffers[outputIndex] = new Array(nbChannels);
      for (let i = 0; i < nbChannels; i++) {
        this.outputBuffers[outputIndex][i] = new Float32Array(this.blockSize);
        this.outputBuffers[outputIndex][i].fill(0);
      }

      // allocate output buffers to retrieve
      // (cannot send a pointer/subarray because new output has to be add to exising output)
      this.outputBuffersToRetrieve[outputIndex] = new Array(nbChannels);
      for (let i = 0; i < nbChannels; i++) {
        this.outputBuffersToRetrieve[outputIndex][i] = new Float32Array(this.blockSize);
        this.outputBuffersToRetrieve[outputIndex][i].fill(0);
      }
    }

    /** Read next web audio block to input buffers **/
    readInputs(inputs) {
      // when playback is paused, we may stop receiving new samples
      if (inputs[0].length && inputs[0][0].length == 0) {
        for (let i = 0; i < this.nbInputs; i++) {
          for (let j = 0; j < this.inputBuffers[i].length; j++) {
            this.inputBuffers[i][j].fill(0, this.blockSize);
          }
        }
        return;
      }

      for (let i = 0; i < this.nbInputs; i++) {
        for (let j = 0; j < this.inputBuffers[i].length; j++) {
          let webAudioBlock = inputs[i][j];
          this.inputBuffers[i][j].set(webAudioBlock, this.blockSize);
        }
      }
    }

    /** Write next web audio block from output buffers **/
    writeOutputs(outputs) {
      for (let i = 0; i < this.nbInputs; i++) {
        for (let j = 0; j < this.inputBuffers[i].length; j++) {
          let webAudioBlock = this.outputBuffers[i][j].subarray(0, WEBAUDIO_BLOCK_SIZE);
          outputs[i][j].set(webAudioBlock);
        }
      }
    }

    /** Shift left content of input buffers to receive new web audio block **/
    shiftInputBuffers() {
      for (let i = 0; i < this.nbInputs; i++) {
        for (let j = 0; j < this.inputBuffers[i].length; j++) {
          this.inputBuffers[i][j].copyWithin(0, WEBAUDIO_BLOCK_SIZE);
        }
      }
    }

    /** Shift left content of output buffers to receive new web audio block **/
    shiftOutputBuffers() {
      for (let i = 0; i < this.nbOutputs; i++) {
        for (let j = 0; j < this.outputBuffers[i].length; j++) {
          this.outputBuffers[i][j].copyWithin(0, WEBAUDIO_BLOCK_SIZE);
          this.outputBuffers[i][j].subarray(this.blockSize - WEBAUDIO_BLOCK_SIZE).fill(0);
        }
      }
    }

    /** Copy contents of input buffers to buffer actually sent to process **/
    prepareInputBuffersToSend() {
      for (let i = 0; i < this.nbInputs; i++) {
        for (let j = 0; j < this.inputBuffers[i].length; j++) {
          this.inputBuffersToSend[i][j].set(this.inputBuffersHead[i][j]);
        }
      }
    }

    /** Add contents of output buffers just processed to output buffers **/
    handleOutputBuffersToRetrieve() {
      for (let i = 0; i < this.nbOutputs; i++) {
        for (let j = 0; j < this.outputBuffers[i].length; j++) {
          for (let k = 0; k < this.blockSize; k++) {
            this.outputBuffers[i][j][k] += this.outputBuffersToRetrieve[i][j][k] / this.nbOverlaps;
          }
        }
      }
    }

    process(inputs, outputs, params) {
      const input = inputs[0];
      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }
      this.started = hasInput;
      this.reallocateChannelsIfNeeded(inputs, outputs);

      this.readInputs(inputs);
      this.shiftInputBuffers();
      this.prepareInputBuffersToSend();
      this.processOLA(this.inputBuffersToSend, this.outputBuffersToRetrieve, params);
      this.handleOutputBuffersToRetrieve();
      this.writeOutputs(outputs);
      this.shiftOutputBuffers();

      return true;
    }

    processOLA(inputs, outputs, params) {
      console.assert(false, 'Not overriden');
    }
  }

  // sourced from https://github.com/indutny/fft.js/
  // LICENSE
  // This software is licensed under the MIT License.
  // Copyright Fedor Indutny, 2017.
  // Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  // The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software
  // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  class FFT {
    constructor(size) {
      this.size = size | 0;
      if (this.size <= 1 || (this.size & (this.size - 1)) !== 0)
        throw new Error('FFT size must be a power of two and bigger than 1');

      this._csize = size << 1;

      // NOTE: Use of `var` is intentional for old V8 versions
      var table = new Array(this.size * 2);
      for (var i = 0; i < table.length; i += 2) {
        const angle = (Math.PI * i) / this.size;
        table[i] = Math.cos(angle);
        table[i + 1] = -Math.sin(angle);
      }
      this.table = table;

      // Find size's power of two
      var power = 0;
      for (var t = 1; this.size > t; t <<= 1) power++;

      // Calculate initial step's width:
      //   * If we are full radix-4 - it is 2x smaller to give inital len=8
      //   * Otherwise it is the same as `power` to give len=4
      this._width = power % 2 === 0 ? power - 1 : power;

      // Pre-compute bit-reversal patterns
      this._bitrev = new Array(1 << this._width);
      for (var j = 0; j < this._bitrev.length; j++) {
        this._bitrev[j] = 0;
        for (var shift = 0; shift < this._width; shift += 2) {
          var revShift = this._width - shift - 2;
          this._bitrev[j] |= ((j >>> shift) & 3) << revShift;
        }
      }

      this._out = null;
      this._data = null;
      this._inv = 0;
    }
    fromComplexArray(complex, storage) {
      var res = storage || new Array(complex.length >>> 1);
      for (var i = 0; i < complex.length; i += 2) res[i >>> 1] = complex[i];
      return res;
    }
    createComplexArray() {
      const res = new Array(this._csize);
      for (var i = 0; i < res.length; i++) res[i] = 0;
      return res;
    }
    toComplexArray(input, storage) {
      var res = storage || this.createComplexArray();
      for (var i = 0; i < res.length; i += 2) {
        res[i] = input[i >>> 1];
        res[i + 1] = 0;
      }
      return res;
    }
    completeSpectrum(spectrum) {
      var size = this._csize;
      var half = size >>> 1;
      for (var i = 2; i < half; i += 2) {
        spectrum[size - i] = spectrum[i];
        spectrum[size - i + 1] = -spectrum[i + 1];
      }
    }
    transform(out, data) {
      if (out === data) throw new Error('Input and output buffers must be different');

      this._out = out;
      this._data = data;
      this._inv = 0;
      this._transform4();
      this._out = null;
      this._data = null;
    }
    realTransform(out, data) {
      if (out === data) throw new Error('Input and output buffers must be different');

      this._out = out;
      this._data = data;
      this._inv = 0;
      this._realTransform4();
      this._out = null;
      this._data = null;
    }
    inverseTransform(out, data) {
      if (out === data) throw new Error('Input and output buffers must be different');

      this._out = out;
      this._data = data;
      this._inv = 1;
      this._transform4();
      for (var i = 0; i < out.length; i++) out[i] /= this.size;
      this._out = null;
      this._data = null;
    }
    // radix-4 implementation
    //
    // NOTE: Uses of `var` are intentional for older V8 version that do not
    // support both `let compound assignments` and `const phi`
    _transform4() {
      var out = this._out;
      var size = this._csize;

      // Initial step (permute and transform)
      var width = this._width;
      var step = 1 << width;
      var len = (size / step) << 1;

      var outOff;
      var t;
      var bitrev = this._bitrev;
      if (len === 4) {
        for (outOff = 0, t = 0; outOff < size; outOff += len, t++) {
          const off = bitrev[t];
          this._singleTransform2(outOff, off, step);
        }
      } else {
        // len === 8
        for (outOff = 0, t = 0; outOff < size; outOff += len, t++) {
          const off = bitrev[t];
          this._singleTransform4(outOff, off, step);
        }
      }

      // Loop through steps in decreasing order
      var inv = this._inv ? -1 : 1;
      var table = this.table;
      for (step >>= 2; step >= 2; step >>= 2) {
        len = (size / step) << 1;
        var quarterLen = len >>> 2;

        // Loop through offsets in the data
        for (outOff = 0; outOff < size; outOff += len) {
          // Full case
          var limit = outOff + quarterLen;
          for (var i = outOff, k = 0; i < limit; i += 2, k += step) {
            const A = i;
            const B = A + quarterLen;
            const C = B + quarterLen;
            const D = C + quarterLen;

            // Original values
            const Ar = out[A];
            const Ai = out[A + 1];
            const Br = out[B];
            const Bi = out[B + 1];
            const Cr = out[C];
            const Ci = out[C + 1];
            const Dr = out[D];
            const Di = out[D + 1];

            // Middle values
            const MAr = Ar;
            const MAi = Ai;

            const tableBr = table[k];
            const tableBi = inv * table[k + 1];
            const MBr = Br * tableBr - Bi * tableBi;
            const MBi = Br * tableBi + Bi * tableBr;

            const tableCr = table[2 * k];
            const tableCi = inv * table[2 * k + 1];
            const MCr = Cr * tableCr - Ci * tableCi;
            const MCi = Cr * tableCi + Ci * tableCr;

            const tableDr = table[3 * k];
            const tableDi = inv * table[3 * k + 1];
            const MDr = Dr * tableDr - Di * tableDi;
            const MDi = Dr * tableDi + Di * tableDr;

            // Pre-Final values
            const T0r = MAr + MCr;
            const T0i = MAi + MCi;
            const T1r = MAr - MCr;
            const T1i = MAi - MCi;
            const T2r = MBr + MDr;
            const T2i = MBi + MDi;
            const T3r = inv * (MBr - MDr);
            const T3i = inv * (MBi - MDi);

            // Final values
            const FAr = T0r + T2r;
            const FAi = T0i + T2i;

            const FCr = T0r - T2r;
            const FCi = T0i - T2i;

            const FBr = T1r + T3i;
            const FBi = T1i - T3r;

            const FDr = T1r - T3i;
            const FDi = T1i + T3r;

            out[A] = FAr;
            out[A + 1] = FAi;
            out[B] = FBr;
            out[B + 1] = FBi;
            out[C] = FCr;
            out[C + 1] = FCi;
            out[D] = FDr;
            out[D + 1] = FDi;
          }
        }
      }
    }
    // radix-2 implementation
    //
    // NOTE: Only called for len=4
    _singleTransform2(outOff, off, step) {
      const out = this._out;
      const data = this._data;

      const evenR = data[off];
      const evenI = data[off + 1];
      const oddR = data[off + step];
      const oddI = data[off + step + 1];

      const leftR = evenR + oddR;
      const leftI = evenI + oddI;
      const rightR = evenR - oddR;
      const rightI = evenI - oddI;

      out[outOff] = leftR;
      out[outOff + 1] = leftI;
      out[outOff + 2] = rightR;
      out[outOff + 3] = rightI;
    }
    // radix-4
    //
    // NOTE: Only called for len=8
    _singleTransform4(outOff, off, step) {
      const out = this._out;
      const data = this._data;
      const inv = this._inv ? -1 : 1;
      const step2 = step * 2;
      const step3 = step * 3;

      // Original values
      const Ar = data[off];
      const Ai = data[off + 1];
      const Br = data[off + step];
      const Bi = data[off + step + 1];
      const Cr = data[off + step2];
      const Ci = data[off + step2 + 1];
      const Dr = data[off + step3];
      const Di = data[off + step3 + 1];

      // Pre-Final values
      const T0r = Ar + Cr;
      const T0i = Ai + Ci;
      const T1r = Ar - Cr;
      const T1i = Ai - Ci;
      const T2r = Br + Dr;
      const T2i = Bi + Di;
      const T3r = inv * (Br - Dr);
      const T3i = inv * (Bi - Di);

      // Final values
      const FAr = T0r + T2r;
      const FAi = T0i + T2i;

      const FBr = T1r + T3i;
      const FBi = T1i - T3r;

      const FCr = T0r - T2r;
      const FCi = T0i - T2i;

      const FDr = T1r - T3i;
      const FDi = T1i + T3r;

      out[outOff] = FAr;
      out[outOff + 1] = FAi;
      out[outOff + 2] = FBr;
      out[outOff + 3] = FBi;
      out[outOff + 4] = FCr;
      out[outOff + 5] = FCi;
      out[outOff + 6] = FDr;
      out[outOff + 7] = FDi;
    }
    // Real input radix-4 implementation
    _realTransform4() {
      var out = this._out;
      var size = this._csize;

      // Initial step (permute and transform)
      var width = this._width;
      var step = 1 << width;
      var len = (size / step) << 1;

      var outOff;
      var t;
      var bitrev = this._bitrev;
      if (len === 4) {
        for (outOff = 0, t = 0; outOff < size; outOff += len, t++) {
          const off = bitrev[t];
          this._singleRealTransform2(outOff, off >>> 1, step >>> 1);
        }
      } else {
        // len === 8
        for (outOff = 0, t = 0; outOff < size; outOff += len, t++) {
          const off = bitrev[t];
          this._singleRealTransform4(outOff, off >>> 1, step >>> 1);
        }
      }

      // Loop through steps in decreasing order
      var inv = this._inv ? -1 : 1;
      var table = this.table;
      for (step >>= 2; step >= 2; step >>= 2) {
        len = (size / step) << 1;
        var halfLen = len >>> 1;
        var quarterLen = halfLen >>> 1;
        var hquarterLen = quarterLen >>> 1;

        // Loop through offsets in the data
        for (outOff = 0; outOff < size; outOff += len) {
          for (var i = 0, k = 0; i <= hquarterLen; i += 2, k += step) {
            var A = outOff + i;
            var B = A + quarterLen;
            var C = B + quarterLen;
            var D = C + quarterLen;

            // Original values
            var Ar = out[A];
            var Ai = out[A + 1];
            var Br = out[B];
            var Bi = out[B + 1];
            var Cr = out[C];
            var Ci = out[C + 1];
            var Dr = out[D];
            var Di = out[D + 1];

            // Middle values
            var MAr = Ar;
            var MAi = Ai;

            var tableBr = table[k];
            var tableBi = inv * table[k + 1];
            var MBr = Br * tableBr - Bi * tableBi;
            var MBi = Br * tableBi + Bi * tableBr;

            var tableCr = table[2 * k];
            var tableCi = inv * table[2 * k + 1];
            var MCr = Cr * tableCr - Ci * tableCi;
            var MCi = Cr * tableCi + Ci * tableCr;

            var tableDr = table[3 * k];
            var tableDi = inv * table[3 * k + 1];
            var MDr = Dr * tableDr - Di * tableDi;
            var MDi = Dr * tableDi + Di * tableDr;

            // Pre-Final values
            var T0r = MAr + MCr;
            var T0i = MAi + MCi;
            var T1r = MAr - MCr;
            var T1i = MAi - MCi;
            var T2r = MBr + MDr;
            var T2i = MBi + MDi;
            var T3r = inv * (MBr - MDr);
            var T3i = inv * (MBi - MDi);

            // Final values
            var FAr = T0r + T2r;
            var FAi = T0i + T2i;

            var FBr = T1r + T3i;
            var FBi = T1i - T3r;

            out[A] = FAr;
            out[A + 1] = FAi;
            out[B] = FBr;
            out[B + 1] = FBi;

            // Output final middle point
            if (i === 0) {
              var FCr = T0r - T2r;
              var FCi = T0i - T2i;
              out[C] = FCr;
              out[C + 1] = FCi;
              continue;
            }

            // Do not overwrite ourselves
            if (i === hquarterLen) continue;

            // In the flipped case:
            // MAi = -MAi
            // MBr=-MBi, MBi=-MBr
            // MCr=-MCr
            // MDr=MDi, MDi=MDr
            var ST0r = T1r;
            var ST0i = -T1i;
            var ST1r = T0r;
            var ST1i = -T0i;
            var ST2r = -inv * T3i;
            var ST2i = -inv * T3r;
            var ST3r = -inv * T2i;
            var ST3i = -inv * T2r;

            var SFAr = ST0r + ST2r;
            var SFAi = ST0i + ST2i;

            var SFBr = ST1r + ST3i;
            var SFBi = ST1i - ST3r;

            var SA = outOff + quarterLen - i;
            var SB = outOff + halfLen - i;

            out[SA] = SFAr;
            out[SA + 1] = SFAi;
            out[SB] = SFBr;
            out[SB + 1] = SFBi;
          }
        }
      }
    }
    // radix-2 implementation
    //
    // NOTE: Only called for len=4
    _singleRealTransform2(outOff, off, step) {
      const out = this._out;
      const data = this._data;

      const evenR = data[off];
      const oddR = data[off + step];

      const leftR = evenR + oddR;
      const rightR = evenR - oddR;

      out[outOff] = leftR;
      out[outOff + 1] = 0;
      out[outOff + 2] = rightR;
      out[outOff + 3] = 0;
    }
    // radix-4
    //
    // NOTE: Only called for len=8
    _singleRealTransform4(outOff, off, step) {
      const out = this._out;
      const data = this._data;
      const inv = this._inv ? -1 : 1;
      const step2 = step * 2;
      const step3 = step * 3;

      // Original values
      const Ar = data[off];
      const Br = data[off + step];
      const Cr = data[off + step2];
      const Dr = data[off + step3];

      // Pre-Final values
      const T0r = Ar + Cr;
      const T1r = Ar - Cr;
      const T2r = Br + Dr;
      const T3r = inv * (Br - Dr);

      // Final values
      const FAr = T0r + T2r;

      const FBr = T1r;
      const FBi = -T3r;

      const FCr = T0r - T2r;

      const FDr = T1r;
      const FDi = T3r;

      out[outOff] = FAr;
      out[outOff + 1] = 0;
      out[outOff + 2] = FBr;
      out[outOff + 3] = FBi;
      out[outOff + 4] = FCr;
      out[outOff + 5] = 0;
      out[outOff + 6] = FDr;
      out[outOff + 7] = FDi;
    }
  }

  // coarse, crush, and shape processors adapted from dktr0's webdirt: https://github.com/dktr0/WebDirt/blob/5ce3d698362c54d6e1b68acc47eb2955ac62c793/dist/AudioWorklets.js
  // LICENSE GNU General Public License v3.0 see https://github.com/dktr0/WebDirt/blob/main/LICENSE
  // TOFIX: THIS FILE DOES NOT SUPPORT IMPORTS ON DEPOLYMENT


  const clamp = (num, min, max) => Math.min(Math.max(num, min), max);
  const _mod = (n, m) => ((n % m) + m) % m;

  const blockSize = 128;
  // adjust waveshape to remove frequencies above nyquist to prevent aliasing
  // referenced from https://www.kvraudio.com/forum/viewtopic.php?t=375517
  function polyBlep(phase, dt) {
    // 0 <= phase < 1
    if (phase < dt) {
      phase /= dt;
      // 2 * (phase - phase^2/2 - 0.5)
      return phase + phase - phase * phase - 1;
    }

    // -1 < phase < 0
    else if (phase > 1 - dt) {
      phase = (phase - 1) / dt;
      // 2 * (phase^2/2 + phase + 0.5)
      return phase * phase + phase + phase + 1;
    }

    // 0 otherwise
    else {
      return 0;
    }
  }

  const waveshapes = {
    tri(phase, skew = 0.5) {
      const x = 1 - skew;
      if (phase >= skew) {
        return 1 / x - phase / x;
      }
      return phase / skew;
    },
    sine(phase) {
      return Math.sin(Math.PI * 2 * phase) * 0.5 + 0.5;
    },
    ramp(phase) {
      return phase;
    },
    saw(phase) {
      return 1 - phase;
    },

    square(phase, skew = 0.5) {
      if (phase >= skew) {
        return 0;
      }
      return 1;
    },
    custom(phase, values = [0, 1]) {
      const numParts = values.length - 1;
      const currPart = Math.floor(phase * numParts);

      const partLength = 1 / numParts;
      const startVal = clamp(values[currPart], 0, 1);
      const endVal = clamp(values[currPart + 1], 0, 1);
      const y2 = endVal;
      const y1 = startVal;
      const x1 = 0;
      const x2 = partLength;
      const slope = (y2 - y1) / (x2 - x1);
      return slope * (phase - partLength * currPart) + startVal;
    },
    sawblep(phase, dt) {
      const v = 2 * phase - 1;
      return v - polyBlep(phase, dt);
    },
  };

  const waveShapeNames = Object.keys(waveshapes);
  class LFOProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [
        { name: 'time', defaultValue: 0 },
        { name: 'end', defaultValue: 0 },
        { name: 'frequency', defaultValue: 0.5 },
        { name: 'skew', defaultValue: 0.5 },
        { name: 'depth', defaultValue: 1 },
        { name: 'phaseoffset', defaultValue: 0 },
        { name: 'shape', defaultValue: 0 },
        { name: 'dcoffset', defaultValue: 0 },
      ];
    }

    constructor() {
      super();
      this.phase;
    }

    incrementPhase(dt) {
      this.phase += dt;
      if (this.phase > 1.0) {
        this.phase = this.phase - 1;
      }
    }

    process(inputs, outputs, parameters) {
      // eslint-disable-next-line no-undef
      if (currentTime >= parameters.end[0]) {
        return false;
      }

      const output = outputs[0];
      const frequency = parameters['frequency'][0];

      const time = parameters['time'][0];
      const depth = parameters['depth'][0];
      const skew = parameters['skew'][0];
      const phaseoffset = parameters['phaseoffset'][0];

      const dcoffset = parameters['dcoffset'][0];
      const shape = waveShapeNames[parameters['shape'][0]];

      const blockSize = output[0].length ?? 0;

      if (this.phase == null) {
        this.phase = _mod(time * frequency + phaseoffset, 1);
      }
      // eslint-disable-next-line no-undef
      const dt = frequency / sampleRate;
      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < output.length; i++) {
          const modval = (waveshapes[shape](this.phase, skew) + dcoffset) * depth;
          output[i][n] = modval;
        }
        this.incrementPhase(dt);
      }

      return true;
    }
  }
  registerProcessor('lfo-processor', LFOProcessor);

  class CoarseProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [{ name: 'coarse', defaultValue: 1 }];
    }

    constructor() {
      super();
      this.started = false;
    }

    process(inputs, outputs, parameters) {
      const input = inputs[0];
      const output = outputs[0];

      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }
      this.started = hasInput;

      let coarse = parameters.coarse[0] ?? 0;
      coarse = Math.max(1, coarse);
      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < input.length; i++) {
          output[i][n] = n % coarse === 0 ? input[i][n] : output[i][n - 1];
        }
      }
      return true;
    }
  }
  registerProcessor('coarse-processor', CoarseProcessor);

  class CrushProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [{ name: 'crush', defaultValue: 0 }];
    }

    constructor() {
      super();
      this.started = false;
    }

    process(inputs, outputs, parameters) {
      const input = inputs[0];
      const output = outputs[0];

      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }
      this.started = hasInput;

      let crush = parameters.crush[0] ?? 8;
      crush = Math.max(1, crush);

      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < input.length; i++) {
          const x = Math.pow(2, crush - 1);
          output[i][n] = Math.round(input[i][n] * x) / x;
        }
      }
      return true;
    }
  }
  registerProcessor('crush-processor', CrushProcessor);

  class ShapeProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [
        { name: 'shape', defaultValue: 0 },
        { name: 'postgain', defaultValue: 1 },
      ];
    }

    constructor() {
      super();
      this.started = false;
    }

    process(inputs, outputs, parameters) {
      const input = inputs[0];
      const output = outputs[0];

      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }
      this.started = hasInput;

      let shape = parameters.shape[0];
      shape = shape < 1 ? shape : 1.0 - 4e-10;
      shape = (2.0 * shape) / (1.0 - shape);
      const postgain = Math.max(0.001, Math.min(1, parameters.postgain[0]));

      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < input.length; i++) {
          output[i][n] = (((1 + shape) * input[i][n]) / (1 + shape * Math.abs(input[i][n]))) * postgain;
        }
      }
      return true;
    }
  }
  registerProcessor('shape-processor', ShapeProcessor);

  function fast_tanh(x) {
    const x2 = x * x;
    return (x * (27.0 + x2)) / (27.0 + 9.0 * x2);
  }
  const _PI = 3.14159265359;
  //adapted from https://github.com/TheBouteillacBear/webaudioworklet-wasm?tab=MIT-1-ov-file
  class LadderProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [
        { name: 'frequency', defaultValue: 500 },
        { name: 'q', defaultValue: 1 },
        { name: 'drive', defaultValue: 0.69 },
      ];
    }

    constructor() {
      super();
      this.started = false;
      this.p0 = [0, 0];
      this.p1 = [0, 0];
      this.p2 = [0, 0];
      this.p3 = [0, 0];
      this.p32 = [0, 0];
      this.p33 = [0, 0];
      this.p34 = [0, 0];
    }

    process(inputs, outputs, parameters) {
      const input = inputs[0];
      const output = outputs[0];

      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }

      this.started = hasInput;

      const resonance = parameters.q[0];
      const drive = clamp(Math.exp(parameters.drive[0]), 0.1, 2000);

      let cutoff = parameters.frequency[0];
      // eslint-disable-next-line no-undef
      cutoff = (cutoff * 2 * _PI) / sampleRate;
      cutoff = cutoff > 1 ? 1 : cutoff;

      const k = Math.min(8, resonance * 0.4);
      //               drive makeup  * resonance volume loss makeup
      let makeupgain = (1 / drive) * Math.min(1.75, 1 + k);

      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < input.length; i++) {
          const out = this.p3[i] * 0.360891 + this.p32[i] * 0.41729 + this.p33[i] * 0.177896 + this.p34[i] * 0.0439725;

          this.p34[i] = this.p33[i];
          this.p33[i] = this.p32[i];
          this.p32[i] = this.p3[i];

          this.p0[i] += (fast_tanh(input[i][n] * drive - k * out) - fast_tanh(this.p0[i])) * cutoff;
          this.p1[i] += (fast_tanh(this.p0[i]) - fast_tanh(this.p1[i])) * cutoff;
          this.p2[i] += (fast_tanh(this.p1[i]) - fast_tanh(this.p2[i])) * cutoff;
          this.p3[i] += (fast_tanh(this.p2[i]) - fast_tanh(this.p3[i])) * cutoff;

          output[i][n] = out * makeupgain;
        }
      }
      return true;
    }
  }
  registerProcessor('ladder-processor', LadderProcessor);

  class DistortProcessor extends AudioWorkletProcessor {
    static get parameterDescriptors() {
      return [
        { name: 'distort', defaultValue: 0 },
        { name: 'postgain', defaultValue: 1 },
      ];
    }

    constructor() {
      super();
      this.started = false;
    }

    process(inputs, outputs, parameters) {
      const input = inputs[0];
      const output = outputs[0];

      const hasInput = !(input[0] === undefined);
      if (this.started && !hasInput) {
        return false;
      }
      this.started = hasInput;

      const shape = Math.expm1(parameters.distort[0]);
      const postgain = Math.max(0.001, Math.min(1, parameters.postgain[0]));

      for (let n = 0; n < blockSize; n++) {
        for (let i = 0; i < input.length; i++) {
          output[i][n] = (((1 + shape) * input[i][n]) / (1 + shape * Math.abs(input[i][n]))) * postgain;
        }
      }
      return true;
    }
  }
  registerProcessor('distort-processor', DistortProcessor);

  // SUPERSAW
  function lerp(a, b, n) {
    return n * (b - a) + a;
  }

  function getUnisonDetune(unison, detune, voiceIndex) {
    if (unison < 2) {
      return 0;
    }
    return lerp(-detune * 0.5, detune * 0.5, voiceIndex / (unison - 1));
  }
  class SuperSawOscillatorProcessor extends AudioWorkletProcessor {
    constructor() {
      super();
      this.phase = [];
    }
    static get parameterDescriptors() {
      return [
        {
          name: 'begin',
          defaultValue: 0,
          max: Number.POSITIVE_INFINITY,
          min: 0,
        },

        {
          name: 'end',
          defaultValue: 0,
          max: Number.POSITIVE_INFINITY,
          min: 0,
        },

        {
          name: 'frequency',
          defaultValue: 440,
          min: Number.EPSILON,
        },

        {
          name: 'panspread',
          defaultValue: 0.4,
          min: 0,
          max: 1,
        },
        {
          name: 'freqspread',
          defaultValue: 0.2,
          min: 0,
        },
        {
          name: 'detune',
          defaultValue: 0,
          min: 0,
        },

        {
          name: 'voices',
          defaultValue: 5,
          min: 1,
        },
      ];
    }
    process(input, outputs, params) {
      // eslint-disable-next-line no-undef
      if (currentTime <= params.begin[0]) {
        return true;
      }
      // eslint-disable-next-line no-undef
      if (currentTime >= params.end[0]) {
        // this.port.postMessage({ type: 'onended' });
        return false;
      }
      let frequency = params.frequency[0];
      //apply detune in cents
      frequency = frequency * Math.pow(2, params.detune[0] / 1200);

      const output = outputs[0];
      const voices = params.voices[0];
      const freqspread = params.freqspread[0];
      const panspread = params.panspread[0] * 0.5 + 0.5;
      const gain1 = Math.sqrt(1 - panspread);
      const gain2 = Math.sqrt(panspread);

      for (let n = 0; n < voices; n++) {
        const isOdd = (n & 1) == 1;

        //applies unison "spread" detune in semitones
        const freq = frequency * Math.pow(2, getUnisonDetune(voices, freqspread, n) / 12);
        let gainL = gain1;
        let gainR = gain2;
        // invert right and left gain
        if (isOdd) {
          gainL = gain2;
          gainR = gain1;
        }
        // eslint-disable-next-line no-undef
        const dt = freq / sampleRate;

        for (let i = 0; i < output[0].length; i++) {
          this.phase[n] = this.phase[n] ?? Math.random();
          const v = waveshapes.sawblep(this.phase[n], dt);

          output[0][i] = output[0][i] + v * gainL;
          output[1][i] = output[1][i] + v * gainR;

          this.phase[n] += dt;

          if (this.phase[n] > 1.0) {
            this.phase[n] = this.phase[n] - 1;
          }
        }
      }
      return true;
    }
  }

  registerProcessor('supersaw-oscillator', SuperSawOscillatorProcessor);

  // Phase Vocoder sourced from // sourced from https://github.com/olvb/phaze/tree/master?tab=readme-ov-file
  const BUFFERED_BLOCK_SIZE = 2048;

  function genHannWindow(length) {
    let win = new Float32Array(length);
    for (var i = 0; i < length; i++) {
      win[i] = 0.5 * (1 - Math.cos((2 * Math.PI * i) / length));
    }
    return win;
  }

  class PhaseVocoderProcessor extends OLAProcessor {
    static get parameterDescriptors() {
      return [
        {
          name: 'pitchFactor',
          defaultValue: 1.0,
        },
      ];
    }

    constructor(options) {
      options.processorOptions = {
        blockSize: BUFFERED_BLOCK_SIZE,
      };
      super(options);

      this.fftSize = this.blockSize;
      this.timeCursor = 0;

      this.hannWindow = genHannWindow(this.blockSize);
      // prepare FFT and pre-allocate buffers
      this.fft = new FFT(this.fftSize);
      this.freqComplexBuffer = this.fft.createComplexArray();
      this.freqComplexBufferShifted = this.fft.createComplexArray();
      this.timeComplexBuffer = this.fft.createComplexArray();
      this.magnitudes = new Float32Array(this.fftSize / 2 + 1);
      this.peakIndexes = new Int32Array(this.magnitudes.length);
      this.nbPeaks = 0;
    }

    processOLA(inputs, outputs, parameters) {
      // no automation, take last value

      let pitchFactor = parameters.pitchFactor[parameters.pitchFactor.length - 1];

      if (pitchFactor < 0) {
        pitchFactor = pitchFactor * 0.25;
      }
      pitchFactor = Math.max(0, pitchFactor + 1);

      for (var i = 0; i < this.nbInputs; i++) {
        for (var j = 0; j < inputs[i].length; j++) {
          // big assumption here: output is symetric to input
          var input = inputs[i][j];
          var output = outputs[i][j];

          this.applyHannWindow(input);

          this.fft.realTransform(this.freqComplexBuffer, input);

          this.computeMagnitudes();
          this.findPeaks();
          this.shiftPeaks(pitchFactor);

          this.fft.completeSpectrum(this.freqComplexBufferShifted);
          this.fft.inverseTransform(this.timeComplexBuffer, this.freqComplexBufferShifted);
          this.fft.fromComplexArray(this.timeComplexBuffer, output);
          this.applyHannWindow(output);
        }
      }

      this.timeCursor += this.hopSize;
    }

    /** Apply Hann window in-place */
    applyHannWindow(input) {
      for (var i = 0; i < this.blockSize; i++) {
        input[i] = input[i] * this.hannWindow[i] * 1.62;
      }
    }

    /** Compute squared magnitudes for peak finding **/
    computeMagnitudes() {
      var i = 0,
        j = 0;
      while (i < this.magnitudes.length) {
        let real = this.freqComplexBuffer[j];
        let imag = this.freqComplexBuffer[j + 1];
        // no need to sqrt for peak finding
        this.magnitudes[i] = real ** 2 + imag ** 2;
        i += 1;
        j += 2;
      }
    }

    /** Find peaks in spectrum magnitudes **/
    findPeaks() {
      this.nbPeaks = 0;
      var i = 2;
      let end = this.magnitudes.length - 2;

      while (i < end) {
        let mag = this.magnitudes[i];

        if (this.magnitudes[i - 1] >= mag || this.magnitudes[i - 2] >= mag) {
          i++;
          continue;
        }
        if (this.magnitudes[i + 1] >= mag || this.magnitudes[i + 2] >= mag) {
          i++;
          continue;
        }

        this.peakIndexes[this.nbPeaks] = i;
        this.nbPeaks++;
        i += 2;
      }
    }

    /** Shift peaks and regions of influence by pitchFactor into new specturm */
    shiftPeaks(pitchFactor) {
      // zero-fill new spectrum
      this.freqComplexBufferShifted.fill(0);

      for (var i = 0; i < this.nbPeaks; i++) {
        let peakIndex = this.peakIndexes[i];
        let peakIndexShifted = Math.round(peakIndex * pitchFactor);

        if (peakIndexShifted > this.magnitudes.length) {
          break;
        }

        // find region of influence
        var startIndex = 0;
        var endIndex = this.fftSize;
        if (i > 0) {
          let peakIndexBefore = this.peakIndexes[i - 1];
          startIndex = peakIndex - Math.floor((peakIndex - peakIndexBefore) / 2);
        }
        if (i < this.nbPeaks - 1) {
          let peakIndexAfter = this.peakIndexes[i + 1];
          endIndex = peakIndex + Math.ceil((peakIndexAfter - peakIndex) / 2);
        }

        // shift whole region of influence around peak to shifted peak
        let startOffset = startIndex - peakIndex;
        let endOffset = endIndex - peakIndex;
        for (var j = startOffset; j < endOffset; j++) {
          let binIndex = peakIndex + j;
          let binIndexShifted = peakIndexShifted + j;

          if (binIndexShifted >= this.magnitudes.length) {
            break;
          }

          // apply phase correction
          let omegaDelta = (2 * Math.PI * (binIndexShifted - binIndex)) / this.fftSize;
          let phaseShiftReal = Math.cos(omegaDelta * this.timeCursor);
          let phaseShiftImag = Math.sin(omegaDelta * this.timeCursor);

          let indexReal = binIndex * 2;
          let indexImag = indexReal + 1;
          let valueReal = this.freqComplexBuffer[indexReal];
          let valueImag = this.freqComplexBuffer[indexImag];

          let valueShiftedReal = valueReal * phaseShiftReal - valueImag * phaseShiftImag;
          let valueShiftedImag = valueReal * phaseShiftImag + valueImag * phaseShiftReal;

          let indexShiftedReal = binIndexShifted * 2;
          let indexShiftedImag = indexShiftedReal + 1;
          this.freqComplexBufferShifted[indexShiftedReal] += valueShiftedReal;
          this.freqComplexBufferShifted[indexShiftedImag] += valueShiftedImag;
        }
      }
    }
  }

  registerProcessor('phase-vocoder-processor', PhaseVocoderProcessor);

})();
//# sourceMappingURL=worklets-CSJPywHW.js.map
