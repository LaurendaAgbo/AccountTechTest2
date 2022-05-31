import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="adress"
export default class extends Controller {
  postalCode() {
    console.log("Hello World!");
    // var optionSelected = $("option:selected", this);
    var valueSelected = document.getElementById("postal_code").value;
    console.log(valueSelected)
  }
}
