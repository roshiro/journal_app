var Trix = require("trix");

/* what the newly created button does */
Trix.config.textAttributes.red = {
  style: { color: "red" },
  parser: function(element) {
    return element.style.color === "red"
  },
  inheritable: true
}
/* insert the button visual in the default toolbar */
addEventListener("trix-initialize", function(event) {
  var buttonHTML = '<button type="button" data-trix-action="tvlink" class="trix-button icon-attach-tradingview" title="Attach TradingView screenshot" tabindex="-1">Embeed TradingView image</button>'
      dialog = '<div class="trix-dialog trix-dialog--link trix-active" data-trix-dialog="href" data-trix-dialog-attribute="href" data-trix-active>\
                  <div class="trix-dialog__link-fields">\
                    <input type="url" name="href" class="trix-input trix-input--dialog" placeholder="Enter a TradingView URL…" aria-label="URL" required="" data-trix-input="">\
                    <div class="trix-button-group">\
                      <input type="button" class="trix-button trix-button--dialog" value="Link" data-trix-method="setAttribute">\
                    </div>\
                  </div>\
                </div>'

  event.target.toolbarElement.querySelector("[data-trix-button-group=file-tools]").insertAdjacentHTML("beforeend", buttonHTML)
  event.target.toolbarElement.querySelector(".trix-dialogs").insertAdjacentHTML("beforeend", dialog)
})