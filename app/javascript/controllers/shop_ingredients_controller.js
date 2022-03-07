import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'ingredient' ]
  static values = { id: Number, url: String }

  update() {
    let ingredients = [];
    this.ingredientTargets.forEach((ingredient) => {if (ingredient.children[0].checked) {
      ingredients.push(ingredient.dataset.shopIngredientsIdValue);
      }
    });
    ingredients.forEach((pantry_ingredient) => {
      console.log(pantry_ingredient);
      let url = `http://localhost:3000/pantry/pantry_ingredients/${pantry_ingredient}`
        fetch(url, {
          method: "PATCH",
          headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
          body: JSON.stringify({ pantry_ingredient: pantry_ingredient })
        })
    })
}
}
