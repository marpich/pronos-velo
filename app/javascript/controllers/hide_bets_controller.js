import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "betsSection" ]

  connect() {
    this.betsSectionTarget.classList.add("hidden");
  }

  hide() {
    this.betsSectionTarget.classList.toggle("hidden");
  }
}
