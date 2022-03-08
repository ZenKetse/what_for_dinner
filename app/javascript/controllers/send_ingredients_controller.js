import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list", "ingredientCard" ]
  static values = { id: Number, url: String }

  send() {
    let pantry_ingredients = []
    let ingredients_list = document.querySelectorAll(".clicked-background").forEach((ingredient) => pantry_ingredients.push(ingredient.getAttribute("data-send-ingredients-id-value")))
    const url = this.urlValue;
    console.log(url);
    fetch(url, {
      method: "POST",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ ingredients: pantry_ingredients })
    })
      document.querySelectorAll(".clicked-background").forEach((ingredient) => ingredient.remove());
  }
}
