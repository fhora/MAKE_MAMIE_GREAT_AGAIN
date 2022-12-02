import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-missions"
export default class extends Controller {
  static targets = ["form", "input", "list", "checkbox"]

  connect() {
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
    // console.log(this.listTarget)
    // console.log(this.checkboxTargets);
  }

  update() {
    let url = ""
    const input_checked = []
    this.checkboxTargets.map(input => {
      if(input.checked) input_checked.push(input.getAttribute("id"))
    })

    if(this.inputTarget.value != "") {
      url = `${this.formTarget.action}?query=${this.inputTarget.value} ${input_checked.join(' ')}`
    } else {
      url = `${this.formTarget.action}?query=${input_checked.join(' ')}`
    }

    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
    })
  }
}
