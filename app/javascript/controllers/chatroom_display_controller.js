import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatroom-display"
export default class extends Controller {
  static targets = ["chatrooms"]
  static values = { chatroomId: Number }
  connect() {
    console.log("Hello from chatroom display controller")
    console.log(this.chatroomsTargets)
  }

  removeDnone(event) {
    // recuperer l'element sur lequel je click
    const id = event.currentTarget.dataset.chatroomId
    const chatroom = document.querySelector(`#chatroom-${id}`)
    // Lire son id
    // retrouver la chatroom avec lid chatroom-id
    this.chatroomsTargets.forEach((chatroom) => {
      chatroom.classList.add("d-none")
    })
    chatroom.classList.remove("d-none")
    // add d-none to all my chatroomstargets
    // remove it on chatroom-id
  }
}
