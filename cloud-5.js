/**
 * Defines custom HTML elements for the cloud-5 system.
 * Once the custom element is defined in the body of the HTML,
 * its DOM object can be obtained, and then not only DOM 
 * methods but also custom methods can be called.
 *

<cloud5-infrastructure>
<cloud5-score-generator>
<cloud5-visuals-to-notes>
<cloud5-notes-to-visuals>
<cloud5-strudel>
<cloud5-log>
<cloud5-about>
<cloud5-controls>
*/

/**
 * Creates an instance of Csound and sets up menus.
 */

class Cloud5Infrastructure extends HTMLElement {
  constructor() {
    super();
  }
}

customElements.define("cloud5-score-generator", ScoreGenerator, { extends: "p" });