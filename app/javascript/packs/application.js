// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

import '../stylesheets/application.css';

document.addEventListener("turbolinks:load", function () {
  document.getElementById("mobile-button").addEventListener("click", () => {
    let mobileMenu = document.getElementById("mobile-menu");
    let menuIconOpen = document.getElementById("menu-icon-open");
    let menuIconClosed = document.getElementById("menu-icon-closed");
    if (mobileMenu.classList.contains("hidden")) {
      mobileMenu.classList.remove("hidden");
      mobileMenu.classList.add("block");
      menuIconOpen.classList.add("block");
      menuIconOpen.classList.remove("hidden");
      menuIconClosed.classList.add("hidden");
      menuIconClosed.classList.remove("block");
    } else {
      mobileMenu.classList.add("hidden");
      mobileMenu.classList.remove("block");
      menuIconOpen.classList.add("hidden");
      menuIconOpen.classList.remove("block");
      menuIconClosed.classList.add("block");
      menuIconClosed.classList.remove("hidden");
    }
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
