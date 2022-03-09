import swal from 'sweetalert';

const removeFromFavorite = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector("#sweet-alert-unfavorite");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

const addedToFavorite = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector("#sweet-alert-favorite");
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};


export { removeFromFavorite };
export { addedToFavorite };
