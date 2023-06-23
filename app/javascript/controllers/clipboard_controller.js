import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }


  copy() {
    const text = `Connecte toi sur La Fringale et rejoins mon peloton ${this.inputTarget.value} !`;
    console.log(text);
    let tempInput = document.createElement('input');
    tempInput.setAttribute('value', text);
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand('copy');
    document.body.removeChild(tempInput);
  }
}
