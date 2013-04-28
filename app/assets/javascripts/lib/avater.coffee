jQuery ->
  $(document).ready ->
  called = false
  $("img.logo").error ->
    unless called
      $(this).attr
        src: "/images/missing_default.jpg"
        alt: "画像が見つかりません。"
        style: "border: 1px solid #999999;"
      called = true
