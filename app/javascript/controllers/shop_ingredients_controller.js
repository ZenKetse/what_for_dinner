import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredient' ]
  static values = { id: Number, url: String, create: String }

  update() {
    this.ingredientTargets.forEach((ingredient) => { if (ingredient.children[0].checked === true) {
      let url = `${this.urlValue}${ingredient.dataset.shopIngredientsIdValue}`;
        fetch(url, {
          method: "PATCH",
          headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
          body: JSON.stringify({ id: ingredient.dataset.shopIngredientsIdValue })
        })
      }
    });
}
}
