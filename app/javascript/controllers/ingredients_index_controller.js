import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "ingredientCard" ]
  static values = { id: Number, url: String }

  connect() {

  }

  select_ingredient() {
    const url = this.urlValue
    fetch(url, {
      headers: { "Accept": "text/plain", 'Content-Type': 'application/json' },
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.ingredientCardTarget.classList.toggle("clicked-background")
      })
  }
}
