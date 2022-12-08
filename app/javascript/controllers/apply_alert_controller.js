import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2";

// Connects to data-controller="apply-alert"
export default class extends Controller {
  static values = { notice: String };
  connect() {
    Swal.fire({
      icon: 'success',
      title: this.noticeValue,
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 1500,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })
  }
}
