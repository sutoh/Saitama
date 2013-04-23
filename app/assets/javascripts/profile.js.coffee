# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("ul.nav li").eq(0).addClass("active")
  
  $(document).ready ->
  called = false
  $("img.logo").error ->
    unless called
      $(this).attr
        src: "/images/missing_default.jpg"
        alt: "画像が見つかりません。"
        style: "border: 1px solid #999999;"
      called = true
