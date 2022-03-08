import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'message' ]
  static values = { id: Number, url: String }

  connect() {
    console.log(this.idValue);
    console.log(this.urlValue);
  }

  send_everything() {
    let url = this.urlValue;
    let ingredients = []
    document.querySelectorAll(".card-ingredient").forEach((ingredient) => ingredients.push(ingredient.dataset.shoppingListIdValue));
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: ingredients })
    })
    document.querySelectorAll(".card-ingredient").forEach((ingredient) => ingredient.remove());
    document.querySelectorAll("p").forEach((p) => p.remove())
  }

}
