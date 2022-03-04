import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["recipes", "form"]

  recipe(event) {
    // event.preventDefault()

    console.log("TODO: send request in AJAX")
    fetch(`${this.formTarget.action}?query=${event.target.value}`, {
      headers: { "Accept": "application/json"}
    })
    .then(response => response.json())
    .then((data) => {
      this.powersTarget.innerHTML = data.powers;
    })
  }
}
