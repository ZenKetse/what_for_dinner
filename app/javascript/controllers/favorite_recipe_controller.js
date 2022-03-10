import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'button' ]
  static values = { url: String }

  unfavorite() {
    document.querySelector("#unfavorite").remove();
    this.buttonTarget.innerHTML = "<a class='primary-dark-btn-wfd' data-action='click->favorite-recipe#favorite' id='favorite' style='margin-bottom: 60px;' rel='nofollow' data-method='post' href='/pantry/cookbook/favorite/1'>Add to Cookbook</a>";
  }

  favorite() {
    document.querySelector("#favorite").remove();
    this.buttonTarget.innerHTML = "<a class='primary-dark-btn-wfd' data-action='click->favorite-recipe#unfavorite' id='unfavorite' style='margin-bottom: 60px;' rel='nofollow' data-method='post' href='/pantry/cookbook/unfavorite/1'>Remove from Cookbook</a>";
  }
}
