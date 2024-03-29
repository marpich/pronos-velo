// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require select2
//= require_tree .
//= require turbolinks


import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage"
import "../controllers"
import "./select2_init.js"

Rails.start()
ActiveStorage.start()
