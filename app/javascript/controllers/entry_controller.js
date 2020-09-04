import { Controller } from "stimulus"
import Choices from "choices.js"

export default class extends Controller {
  connect() {
    this.setupDateComponents()
    this.setupDropdownComponents()
  }

  setupDateComponents() {
    flatpickr('.date-field', {
      enableTime: true,
      altInput: true,
      altFormat: "F j, Y h:i",
      dateFormat: "Y-m-dTh:i",
    })
  }

  setupDropdownComponents() {
    const choices = new Choices('.entry-choices')
  }
}
