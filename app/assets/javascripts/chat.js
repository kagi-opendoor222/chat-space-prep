$(function(){
  function appendHtml(data){
    var img = data.image_url ? `<img style='margin-top: 10px' src=${data.image_url} alt=${data.image_name}>` : ""
    var html = `<li class="message-container">
                  <h3 class="message-container__header">
                    ${data.user_name}
                    <span class="date">
                      ${data.created_at}
                    </span>
                  </h3>
                  ${img}
                  <p class="message-container__text">
                    ${data.content}
                  </p>
                </li>`

    console.log(html)
    $(".message-list").append(html)
  }
  $("#new_message").on("submit", function(e){
    e.preventDefault()
    var formData = new FormData(this)
    var url = $(this).attr("action")
    $.ajax({
      type: "POST",
      url: url,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data)
      $("#new_message")[0].reset()
      appendHtml(data)
      var scrollTarget = $(".contents").find(".main-contents")
      scrollTarget.animate({scrollTop: scrollTarget[0].scrollHeight}, 500, "swing")
    })
  })
})
