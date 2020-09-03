import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    flatpickr('.date-field', {
      enableTime: true,
      altInput: true,
      altFormat: "F j, Y h:i",
      dateFormat: "Y-m-dTh:i",
    })
  }
}
