import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredientCard' ]
  static values = { id: Number, destroy: String, update: String }

  destroy() {
    console.log(this.destroyValue)
    console.log(this.idValue)
    console.log(this.ingredientCardTarget)
    let url = this.destroyValue
    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "text/plain", 'Content-Type': 'application/json' },
      body: JSON.stringify({ id: this.idValue })
    })
      this.ingredientCardTarget.remove();
  }

  update_to_pantry() {
    let url = this.updateValue;
    console.log(url);
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: this.idValue })
    })
    this.ingredientCardTarget.remove();
  }

}
