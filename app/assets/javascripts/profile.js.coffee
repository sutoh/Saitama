# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require_directory ./gmaps4rails
#= require_directory ./lib
jQuery ->
  $("ul.nav li").eq(0).addClass("active")