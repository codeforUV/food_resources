document.addEventListener("turbolinks:load", function () {
  document.getElementById("mobile-button").addEventListener("click", (e) => {
    let mM = document.getElementById("mobile-menu");
    if (mM.style.display == "none") {
      mM.style.display = "block";
    } else {
      mM.style.display = "none";
    }
  });
});
