import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]

  toggle() {
    this.toggleTargets.forEach(target => target.classList.toggle("hidden"));
  }
}