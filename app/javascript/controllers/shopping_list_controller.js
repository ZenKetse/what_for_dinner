import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredientCard' ]
  static values = { id: Number, destroy: String, update: String }

  destroy() {
    let url = this.destroyValue;
    console.log(this.destroyValue)
    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain", 'Content-Type': 'application/json' },
      body: JSON.stringify({ id: this.idValue })
    })
      this.ingredientCardTarget.remove();
  }

  update_to_pantry() {
    let url = this.updateValue;
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: this.idValue })
    })
    this.ingredientCardTarget.remove();
  }

  send_everything() {
    let url = this.updateValue;
    let ingredients = [];
    this.ingredientCardTargets.forEach((ingredient) => ingredients.push(ingredient.dataset.ingredientCardIdValue))
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: ingredients })
    })
    this.ingredientCardTargets.remove();
  }

}
