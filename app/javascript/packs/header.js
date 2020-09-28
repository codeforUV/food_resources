document.addEventListener("turbolinks:load", function () {
  // Handle menu trigger menu
  document.getElementById("triggerMenu").addEventListener("click", triggerMenu);
  // Handle search bar
  document.getElementById("searchBar").addEventListener("input", search);
});

/**
 * Function that handles the search bar
 */
function search() {
  let search_term = document.getElementById("searchBar").value;

  if (search_term != "") {
    let xhr = new XMLHttpRequest();
    let params = "search_term=" + search_term;

    xhr.open("GET", "/food_access_points/search.js?" + params, true);
    xhr.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Update content with the new list of Food Access Points
        document.getElementById("list_food_access_points").innerHTML = xhr.response;
      }
    }
    xhr.send(null);
  }
}

/**
 * Function that handles menu trigger
 */
function triggerMenu() {
  let links = document.getElementById("links");
  let classList = links.classList;
  let svg = document.getElementById("menuIcon");

  // Menu is hidden
  if (classList.contains("hidden")) {
    // Show the menu
    links.classList = replaceClass("hidden", "block", classList);

    let closeSVG =
      "M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z";
    // Show close menu icon
    svg.setAttribute("d", closeSVG);
  } else {
    // Hide the menu
    links.classList = replaceClass("block", "hidden", classList);
    let openSVG =
      "M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z";
    // Show open menu icon
    svg.setAttribute("d", openSVG);
  }
  return true;
}

/**
 * Function that replaces a "oldClass" by a "newClass" in a "classList"
 * @param {*} oldClass
 * @param {*} newClass
 * @param {*} classList
 */
function replaceClass(oldClass, newClass, classList) {
  classList.remove(oldClass);
  classList.add(newClass);
  return classList;
}
