# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("ul.nav li").eq(2).addClass("active")

$(document).on "change", "[class*='employee_skill_range']", ->
  form = $(this).parents("form")[0]
  $(form).trigger "submit.rails"