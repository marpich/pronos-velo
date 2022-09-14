import { Controller } from 'stimulus';
import Swal from 'sweetalert';

export default class extends Controller {
  static targets = ["peloton"]

  connect() {
    console.log("Hello, Stimulus!")
  }

  league(event) {
    console.log(this.pelotonTarget.value)
    event.preventDefault()
    Swal({
      title: "🎊 Félicitations 🎉",
      text: `Ton peloton ${this.pelotonTarget.value} est créé`,
      icon: "success",
      buttons: true,
      // timer: 60000,
    // }).then(function() {
    //   window.location="users_dashboard_path";
     }).then($(this).submit());
  }
}
