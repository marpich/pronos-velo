import { Controller } from "@hotwired/stimulus";
import "select2";

export default class extends Controller {
  static targets = ["winner", "second", "third"]

  initialize() {
    console.log(this.winnerTarget.querySelector('select'));
    this.select2Element = this.winnerTarget.querySelector('select');
    this.selectWinner();
    this.select2Element = this.secondTarget.querySelector('select');
    this.selectSecond();
    this.select2Element = this.thirdTarget.querySelector('select');
    this.selectThird();
  }

  selectWinner() {
    $(this.select2Element).select2({
      placeholder: 'Vainqueur',
    });
  }

  selectSecond() {
    $(this.select2Element).select2({
      placeholder: 'Deuxième',
    });
  }

  selectThird() {
    $(this.select2Element).select2({
      placeholder: 'Troisième',
    });
  }
}
