# = require jquery
# = require jquery_ujs
# = require offCanvasMenu

$(document).on 'ready page:load', ->
  $(document).foundation();

$(document).on 'ready', ->
  m = $.offCanvasMenu
    direction: 'left'
    coverage: '300px',
    trigger: '#menu-trigger'
    menu: '#global-nav'
    duration: 250
  m.on()