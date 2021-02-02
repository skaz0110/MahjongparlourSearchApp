import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// bootstrap導入
require("bootstrap/dist/js/bootstrap")

// Jqueryの呼び出し
window.$ = window.jQuery = require('jquery')
require('packs/raty') 