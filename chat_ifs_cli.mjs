#!/usr/bin/env node
// musiccli.mjs
import fs from 'node:fs';
import {
  STEP_SEC, STEPS_PER_BAR,
  triageIndices, generateIFS, toCsoundIStatements
} from './chat_ifs.mjs';

function printHelp(){
  console.log(`
musiccli — generate/evaluate grid-locked piano rolls (16ths @ 120 BPM)

USAGE
  node musiccli.mjs [command] [options]

COMMANDS
  gen            Generate a roll via IFS-like rules and print JSON to stdout
  eval           Read a roll JSON (stdin or file) and print indices
  csound         Read a roll JSON and print Csound i-statements

COMMON OPTIONS
  --bars N           Bars (default 210)
  --voices N         Voices/tracks (default 4)
  --tonic M          MIDI tonic (default 60)
  --scale S          Scale: major | minor | csv of pitch classes (e.g. 0,2,3,5,7,8,10)
  --regs CSV         Registers per voice (default 50,60,67,72)
  --density X        Notes/bar/voice (default 1.2)
  --seed N           RNG seed for gen (default 12345)
  --in FILE          Input JSON file (for eval/csound); omit to read stdin
  --out FILE         Output path (for gen); omit to stdout
  --help             Show this help

FORMATS
  JSON roll is an array of voices: [ [note, ...], ... ]
  note = { startStep:int, durSteps:int, pitch:int, vel:int }

EXAMPLES
  # Generate, evaluate, and emit Csound:
  node musiccli.mjs gen --bars 210 --voices 4 --seed 99 > roll.json
  node musiccli.mjs eval --in roll.json
  node musiccli.mjs csound --in roll.json > score.orc.sco

  # One-liner pipe:
  node musiccli.mjs gen --seed 7 | node musiccli.mjs eval
  node musiccli.mjs gen --seed 7 | node musiccli.mjs csound > score.sco
`);
}

function parseCSVints(s, fallback){
  if (!s) return fallback;
  const arr = s.split(',').map(x=>x.trim()).filter(Boolean).map(x=>Number(x));
  if (arr.some(Number.isNaN)) return fallback;
  return arr;
}
function scalePCS(opt){
  if (!opt || opt==='major') return [0,2,4,5,7,9,11];
  if (opt==='minor') return [0,2,3,5,7,8,10];
  return parseCSVints(opt, [0,2,4,5,7,9,11]);
}
function readJSONMaybe(path){
  const text = path ? fs.readFileSync(path, 'utf8')
                    : fs.readFileSync(0, 'utf8');
  return JSON.parse(text);
}
function writeMaybe(path, text){
  if (path) fs.writeFileSync(path, text, 'utf8');
  else process.stdout.write(text);
}
function parseArgs(argv){
  const args = { _:[] };
  for (let i=0;i<argv.length;i++){
    const a = argv[i];
    if (!a.startsWith('--')) { args._.push(a); continue; }
    const key = a.slice(2);
    const val = (i+1<argv.length && !argv[i+1].startsWith('--')) ? argv[++i] : 'true';
    args[key] = val;
  }
  return args;
}

async function main(){
  const argv = process.argv.slice(2);
  if (argv.length===0 || argv.includes('--help')) { printHelp(); return; }
  const args = parseArgs(argv);
  const cmd = args._[0];
  const bars = Number(args.bars ?? 210) | 0;
  const voices = Number(args.voices ?? 4) | 0;
  const tonic = Number(args.tonic ?? 60) | 0;
  const regs = parseCSVints(args.regs ?? '', [50,60,67,72]);
  const pcs = scalePCS(args.scale);
  const density = Number(args.density ?? 1.2);
  const seed = Number(args.seed ?? 12345) | 0;

  if (cmd === 'gen'){
    const {roll, totalSteps} = generateIFS({bars, voices, tonic, pcs, regs, density, seed});
    writeMaybe(args.out, JSON.stringify(roll, null, 2));
    return;
  }

  if (cmd === 'eval'){
    const roll = readJSONMaybe(args.in);
    const totalSteps = bars * STEPS_PER_BAR; // evaluation window
    const scores = triageIndices(roll, totalSteps);
    const out = {
      grid: { stepSec: STEP_SEC, stepsPerBar: STEPS_PER_BAR, bars, totalSteps },
      scores
    };
    writeMaybe(args.out, JSON.stringify(out, null, 2) + '\n');
    return;
  }

  if (cmd === 'csound'){
    const roll = readJSONMaybe(args.in);
    const text = toCsoundIStatements(roll);
    writeMaybe(args.out, text + '\n');
    return;
  }

  printHelp();
}

main().catch(e=>{ console.error(e); process.exit(1); });
