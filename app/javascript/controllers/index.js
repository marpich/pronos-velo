// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
import CloseButtonController from "./close_button_controller"
application.register("close-button", CloseButtonController)

import CountdownRaceController from "./countdown_race_controller"
application.register("countdown-race", CountdownRaceController)

import CountdownStageController from "./countdown_stage_controller"
application.register("countdown-stage", CountdownStageController)

import DropdownButtonController from "./dropdown_button_controller"
application.register("dropdown-button", DropdownButtonController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PelotonPopupController from "./peloton_popup_controller"
application.register("peloton-popup", PelotonPopupController)

import PronoPopupController from "./prono_popup_controller"
application.register("prono-popup", PronoPopupController)

import ShowLeagueButtonController from "./show_league_button_controller"
application.register("show-league-button", ShowLeagueButtonController)

import ClipboardController from "./clipboard_controller"
application.register("clipboard", ClipboardController)

import HideBetsController from "./hide_bets_controller"
application.register("hide-bets", HideBetsController)

import SearchController from "./search_controller"
application.register("search", SearchController)
