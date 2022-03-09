import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'message' ]
  static values = { id: Number, url: String }

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
    document.querySelector(".message").innerHTML = "<h1>Your shopping list 🛒</h1><h6 data-shopping-to-pantry-target='message' style='font-size: 14px; color: grey; margin-bottom: 20px; margin-left: 3px;'>You have everything in stock!</p>"
  }

}
