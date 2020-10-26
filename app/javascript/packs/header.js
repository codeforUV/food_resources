// Adds toggle to mobile menu

document.addEventListener("turbolinks:load", function () {
  document.getElementById("mobile-button").addEventListener("click", () => {
    let mM = document.getElementById("mobile-menu");
    let mIO = document.getElementById("menu-icon-open");
    let mIC = document.getElementById("menu-icon-closed");
    if (mM.classList.contains("hidden")) {
      mM.classList.remove("hidden");
      mM.classList.add("block");
      mIO.classList.add("block");
      mIO.classList.remove("hidden");
      mIC.classList.add("hidden");
      mIC.classList.remove("block");
    } else {
      mM.classList.add("hidden");
      mM.classList.remove("block");
      mIO.classList.add("hidden");
      mIO.classList.remove("block");
      mIC.classList.add("block");
      mIC.classList.remove("hidden");
    }
  });
});
