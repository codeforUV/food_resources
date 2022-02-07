import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  getCurrentPosition() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(position => {
        const { latitude, longitude } = position.coords;
        window.location.search = `?lat=${latitude}&lon=${longitude}}`;
      });
    } else {
      window.alert("Sorry, geolocation is not supported by this browser");
    }
  }
}
