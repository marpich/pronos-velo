import { Controller } from 'stimulus';
import Swal from 'sweetalert2';

export default class extends Controller {

  connect() {
    Swal.fire({
      icon: 'success',
      title: '🎊 Bravo 🎉',
      html: `Ton prono est pris en compte, allume ta télé pour suivre la course !`
    })
  }

}
