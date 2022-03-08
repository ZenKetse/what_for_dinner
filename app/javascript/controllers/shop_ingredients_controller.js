import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredient' ]
  static values = { id: Number, url: String }
  connect() {
    console.log(this.urlValue.match(/^.*\//)[0]);
  }

  update() {
    console.log(this.urlValue.match(/^.*\//)[0]);
    let ingredients = [];
    this.ingredientTargets.forEach((ingredient) => {if (ingredient.children[0].checked) {
      ingredients.push(ingredient.dataset.shopIngredientsIdValue);
      }
    });
    ingredients.forEach((pantry_ingredient) => {
      console.log(pantry_ingredient);
      let url = `${this.urlValue}${pantry_ingredient}`;
      console.log(url);
        fetch(url, {
          method: "PATCH",
          headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
          body: JSON.stringify({ id: pantry_ingredient })
        })
    })
}
}
