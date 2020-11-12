// Adds toggle to mobile menu

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
