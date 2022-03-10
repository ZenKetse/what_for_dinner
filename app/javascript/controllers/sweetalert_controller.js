import { Controller } from "stimulus"
import swal from 'sweetalert';

export default class extends Controller {

  connect() {
    const removeButton = document.querySelector("#sweet-alert-unfavorite");
    if (removeButton) { // protect other pages
      removeButton.addEventListener('click', () => {
        swal({
          title: "Removed from Cookbook",
          icon: "warning"
        }).then({}); // <-- add the `.then({})`
      });
    }

    const addButton = document.querySelector("#sweet-alert-favorite");
    if (addButton) { // protect other pages
      addButton.addEventListener('click', () => {
        swal({
          title: "Added to Cookbook",
          icon: "success"
        }).then({}); // <-- add the `.then({})`
      });
    }

    const emptyPantry = document.querySelector("#sweet-alert-empty-pantry");
    if (emptyPantry) { // protect other pages
      window.onload = (event) => {
        swal({
          title: "Empty pantry",
          text: "Since your pantry is empty, there are no recipes you can cook right now",
          icon: "warning"
        }).then({}); // <-- add the `.then({})`
      };
    }

  }

}
