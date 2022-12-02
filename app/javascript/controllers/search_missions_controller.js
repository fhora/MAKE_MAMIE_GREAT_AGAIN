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

    // transformer query en deux => query1=
    if(this.inputTarget.value != "") {

      let queryString = ""
      // si il y a un input dans la search bar
      // chaine des query pour chaque checkbox.checked
      input_checked.forEach((value) => {
        queryString += `&querycheck=${value}`
      })

      // url = `${this.formTarget.action}?querysearch=${this.inputTarget.value}&querycheck=${input_checked}`
      url = `${this.formTarget.action}?querysearch=${this.inputTarget.value}${queryString}`
    } else {
      // si il n'y a pas d'input dans search bar
      // créer une query en chainant checkbox.checked
      url = `${this.formTarget.action}?querycheck=${input_checked.join('&querycheck=')}`
    }



    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.listTarget.outerHTML = data
    })
  }
}
