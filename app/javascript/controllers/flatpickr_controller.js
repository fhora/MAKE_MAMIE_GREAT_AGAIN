import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ 'startDateInput' ]

  connect() {
    flatpickr(this.startDateInputTarget, {
      enableTime: true,
      time_24hr: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today"
      })
  }
}
