$(function(){
  var currentResult = [{}]
  function appendSearchResult(user){
    var html = `
                <div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.userName}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.userId}" data-user-name="${user.userName}">追加</a>
                </div>
                `
    $(".user-search-result").append(html)
  }
  function appendAddedUser(user){
    var html = `
                <div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${user.userId}'>
                  <p class='chat-group-user__name'>${user.userName}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' data-user-id="${user.userId}" data-user-name="${user.userName}">削除</a>
                </div>
                `
    $(".added-user-list").append(html)
  }
  function addedUserArray(){
    var addedUserDatas = $(".js-chat-member").find("input[type=hidden]")
    var array = []
    $.each(addedUserDatas, function(i,userData){
      var number = parseInt($(userData).attr("value"))
      array.push(number)
    })
    return array
  }

  function searchUser(){
    var input = $("#user-search-field").val()
    var url = "/users"
    var reg = new RegExp("[a-z\\d]")
    if(input.match(reg)){
      $.ajax({
        type: "GET",
        url: url,
        data: {
            keyword: input
          },
        dataType: "json",
      })
      .done(function(users){
        $(".user-search-result").empty()
        users.forEach(function(user){
          if(addedUserArray().indexOf(user.userId) == -1){
            appendSearchResult(user)
          }
        })
        currentResult = users
      })
    }
  }

  $("#user-search-field").on("keyup",function(){
    searchUser()
  })
  $(document).on("click", ".user-search-add",function(){
    var user = $(this).data()
    appendAddedUser(user)
    $(this).parent().remove()
  })
  $(document).on("click", ".chat-group-user__btn--remove", function(){
    $(this).parent().remove()
    searchUser()
  })
})
