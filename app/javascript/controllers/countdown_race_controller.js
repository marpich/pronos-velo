import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    date: String,
    refreshInterval: { type: Number, default: 1000 },
    expiredMessage: { type: String, default: "Les pronos sont ouverts pour le Giro!" }
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

      if (days > 0) {
        this.element.textContent = `${days}J ${hours}h ${minutes}m ${secondes}s`
      } else {
        this.element.textContent = `${hours}h ${minutes}m ${secondes}s`
      }

    }
  }

  timeDifference() {
    return this.endTime - new Date().getTime()
  }
}
