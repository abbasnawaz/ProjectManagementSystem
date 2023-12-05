import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update"
export default class extends Controller {
  connect() {
    alert("Working"+ index);
  }
}
