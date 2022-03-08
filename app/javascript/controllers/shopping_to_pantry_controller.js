import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredientCard' ]
  static values = { id: Number, url: String }

  send_everything() {
    let url = this.urlValue;
    let ingredients = [];
    this.ingredientCardTargets.forEach((ingredient) => ingredients.push(ingredient.dataset.ingredientCardIdValue))
    console.log(url);
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: ingredients })
    })
    this.ingredientCardTargets.remove();
  }

}
