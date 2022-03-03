import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "ingredientCard" ]
  static values = { id: Number }

  connect() {

  }

  remove_ingredient() {
    console.log(this);
    const url = "http://localhost:3000/pantry"
    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain", 'Content-Type': 'application/json' },
      body: JSON.stringify({ id: this.idValue })
    })
      .then(response => response.text())
      .then((data) => {
        this.ingredientCardTarget.outterHTML = data
        console.log(data);
      })
      this.ingredientCardTarget.remove();
  }
}