import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    date: String,
    refreshInterval: { type: Number, default: 1000 },
    expiredMessage: { type: String, default: "00h : 00m : 00s" }
  }

  connect() {
    console.log(this.dateValue)
    this.endTime = new Date(this.dateValue).getTime()
    this.update()
    this.timer = setInterval(() => { this.update() }, this.refreshIntervalValue )
  }

  disconnect() {
    this.stopTimer()
  }

  stopTimer() {
    if (this.time) {
      clearInterval(this.timer)
    }
  }

  update() {
    let difference = this.timeDifference()

    if (difference < 0) {
      this.element.textContent = this.expiredMessageValue
      this.stopTimer()
      return
    } else {
      let days = Math.floor(difference / (1000 * 60 * 60 * 24))
      let hours = Math.floor((difference % (1000 * 60 * 60 * 24) )/ (1000 * 60 * 60))
      let minutes = Math.floor((difference % (1000 * 60 * 60) )/ (1000 * 60))
      let secondes = Math.floor((difference % (1000 * 60) )/ 1000)

      this.element.textContent = `${days}j ${hours}h ${minutes}m ${secondes}s`

    }
  }

  timeDifference() {
    return this.endTime - new Date().getTime()
  }
}
