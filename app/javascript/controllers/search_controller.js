import { Controller } from "@hotwired/stimulus";
import "select2";

export default class extends Controller {
  static targets = ["winner", "second", "third"];

  connect() {
    this.selectWinner();
    this.selectSecond();
    this.selectThird();
  }

  selectWinner() {
    $(this.winnerTarget.querySelector('select')).select2({
      placeholder: 'Vainqueur',
    });
  }

  selectSecond() {
    $(this.secondTarget.querySelector('select')).select2({
      placeholder: 'Deuxième',
    });
  }

  selectThird() {
    $(this.thirdTarget.querySelector('select')).select2({
      placeholder: 'Troisième',
    });
  }
}
