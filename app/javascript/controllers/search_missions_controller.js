import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["form", "input", "list", "checkbox", "label", "date"]

  connect() {
    flatpickr(this.dateTarget, {
      mode: "multiple",
      dateFormat: "Y-m-d",
      minDate: "today",
      })
  }

  update() {
    let url = ""

    const dates = this.dateTarget.value.split(', ')

    const input_checked = []
    this.checkboxTargets.map((input, index) => {
      if(input.checked) {
        this.labelTargets[index].classList.add("checked")
        input_checked.push(input.getAttribute("id"))
      } else {
        this.labelTargets[index].classList.remove("checked")
      }
    })

    let queryString = "?"
    if(this.inputTarget.value != "") queryString += `&querysearch=${this.inputTarget.value}`;
    if(input_checked.length != 0) queryString += `&querychecks[]=${input_checked.join('&querychecks[]=')}`;
    if(this.dateTarget.value != "") queryString += `&querydates[]=${dates.join('&querydates[]=')}`

    url = queryString

    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
    })
  }
}
