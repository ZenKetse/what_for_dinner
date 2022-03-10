import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const category = urlParams.get('category')

    if (category) {
      document.getElementById(category).classList.add("selected-category-ingredients")
    } else {
      document.getElementById('all').classList.add("selected-category-ingredients")
    }
  }
}
