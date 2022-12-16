import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

export default class extends Controller {
  static values = {
    league: String
  }

  connect() {
    Swal.fire({
      icon: 'success',
      title: '🎊 Félicitations 🎉',
      html: `Ton peloton <b>${this.leagueValue}</b> a rejoint la course !`,
      footer: "N'hésite pas à inviter tes potes à prendre ta roue... "
    })
  }

}
