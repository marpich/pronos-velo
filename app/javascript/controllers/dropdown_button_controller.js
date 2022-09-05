import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["link"]

  dropdown() {
    this.linkTarget.classList.toggle("hidden")
  }

}
