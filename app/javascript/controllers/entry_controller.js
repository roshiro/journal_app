import { Controller } from "stimulus"
import Choices from "choices.js"
import Autolinker from 'autolinker';

export default class extends Controller {
  connect() {
    this.setupDateComponents()
    this.setupDropdownComponents()
    this.watchTrixEditor()
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

  watchTrixEditor() {
    var self = this

    addEventListener("trix-change", function(event) {
      self.convertUrlsToImagesAndUpdateStateUrlCounter()
    })
  }

  urlsInText(text) {
    const urlRegex = /(https?:\/\/[^\s]+)/g;
    return text.match(urlRegex) || []
  }

  convertUrlsToImagesAndUpdateStateUrlCounter() {
    var element = document.querySelector("trix-editor")
    var urlsAddedToText = this.urlsInText(element.value.replaceAll("&nbsp;", " ").replaceAll("\<br\>", " "))
    if(urlsAddedToText.length > this.data.get('urlCounterInText')) {
      this.convertImageUrlsToImageTags()
    }
    this.data.set('urlCounterInText', urlsAddedToText.length)
  }

  convertImageUrlsToImageTags() {
    var linkedText = Autolinker.link(document.querySelector("trix-editor").value, this.autoLinkerOptions())
    document.querySelector("trix-editor").value = linkedText
  }

  autoLinkerOptions() {
    return {
      replaceFn : function(match) {
        switch(match.getType()) {
          case 'url':
            return `<img src="${match.getAnchorHref()}"/>`
        }
      }
    }
  }
}
