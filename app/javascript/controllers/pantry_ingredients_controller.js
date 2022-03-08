import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "ingredientCard" ]
  static values = { id: Number, shopping: String, url: String }

  remove_ingredient() {
    let url = this.urlValue
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


  send_to_shopping_list() {
    let url = this.shoppingValue;
    console.log(url);
    fetch(url, {
      method: "PATCH",
      headers: {  "Accept": "text/plain", 'Content-Type': 'application/json' } ,
      body: JSON.stringify({ id: this.idValue })
    })
    this.ingredientCardTarget.remove();
  }
}
