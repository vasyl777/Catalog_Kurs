// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "stylesheets/application";
import {pagination_js,change_sugar_substitute, search} from "./custom"
window.pagination_js = pagination_js
window.change_sugar_substitute = change_sugar_substitute
window.search = search

import "trix"
import "@rails/actiontext"

import Typed from 'typed.js';

//+ та - в кошику
document.addEventListener("turbolinks:load", function() {
  var typed = new Typed('#typed', {
    stringsElement: '#typed-strings',
    typeSpeed: 30,
    loop: true,
    loopCount: Infinity,
  });
});
