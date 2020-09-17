var Trix = require("trix");

var trixEnhancements = {
  setupEmbedTradingViewImagesButton: function() {
    /* insert the button visual in the default toolbar */
    addEventListener("trix-initialize", function(event) {
      event.target.toolbarElement.querySelector("[data-trix-button-group=file-tools]").insertAdjacentHTML("beforeend", trixEnhancements._buttonAttachTradingView())
      event.target.toolbarElement.querySelector(".trix-dialogs").insertAdjacentHTML("beforeend", trixEnhancements._dialogTradingView())
      trixEnhancements._attachEventToLinkButton()
      trixEnhancements._attachEventToAttachLinkButon()
    });
  },

  _buttonAttachTradingView: function() {
    return '<button type="button" id="attach-tradingview-link" class="trix-button icon-attach-tradingview" title="Attach TradingView screenshot" tabindex="-1">Embeed TradingView image</button>';
  },

  _dialogTradingView: function() {
    return '<div id="dialog-tv" class="trix-dialog trix-dialog--link trix-active" data-trix-dialog="href" data-trix-dialog-attribute="href" >\
              <div class="trix-dialog__link-fields">\
                <input type="url" id="tv-url" name="href" class="trix-input trix-input--dialog" placeholder="Enter a TradingView URL…" aria-label="URL" required="" data-trix-input="">\
                <div class="trix-button-group">\
                  <input type="button" id="button-tvlink" class="trix-button trix-button--dialog trix-button-tv" value="Link">\
                </div>\
              </div>\
            </div>';
  },

  _attachEventToLinkButton: function() {
    document.getElementById('button-tvlink').addEventListener('click', function(event) {
      var tvUrl = document.getElementById('tv-url').value;
      var attachment = new Trix.Attachment({ content: `<img src="${tvUrl}" />` })
      document.querySelector("trix-editor").editor.insertAttachment(attachment)
      document.getElementById('tv-url').value = ""
    })
  },

  _attachEventToAttachLinkButon: function() {
    document.getElementById('attach-tradingview-link').addEventListener('click', function(event) {
      var dialogElement = document.getElementById('dialog-tv')
      dialogElement.toggleAttribute('data-trix-active')
      dialogElement.classList.toggle('trix-active')
    })
  }
};

(function() {
  trixEnhancements.setupEmbedTradingViewImagesButton()
})();