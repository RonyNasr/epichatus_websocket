var scheme = 'ws://';
var uri = scheme + window.document.location.host + '/';

var ws = new WebSocket(uri);

ws.onmessage = function(message) {
  var data = JSON.parse(message.data);
  $("#chat-text").append("<li class='Other'><div class='avatar'><img src='/assets/images/profile.png' alt='profile avatar'/></div><div class='messages'><p>" + data.handle + ":" + data.text + "</p></div></li>");
  $("#chat-text").stop().animate({
    scrollTop: $('#chat-text')[0].scrollHeight
  }, 800);
};

$("#input-form").on("submit", function(event) {
  event.preventDefault();
  var handle = $("#input-handle")[0].value;
  var text   = $("#input-text")[0].value;
  ws.send(JSON.stringify({ handle: handle, text: text }));
  $("#input-text")[0].value = "";
});

//user.erb jquery effects and animations -->
window.onload= function(){
  var $login = $('#login');
  var $signin = $('#signin');
  var $chats = $('#chats');

  $login.click(function(){
    $('.login').fadeIn(1000);
    $('.signin').hide();
    $('.error').hide();
  });
  $signin.click(function(){
    $('.signin').fadeIn(1000);
    $('.login').hide();
    $('.error').hide();
  });
  $('.chats_icon').click(function(){
    $('.chat_div').slideToggle(500);
  });
  $('#chats_arrow_up').click(function(){
    $(this).hide()
    $('#chats_arrow_down').show()
  });
  $('#chats_arrow_down').click(function(){
    $(this).hide()
    $('#chats_arrow_up').show()
  });
  $('.minus').click(function(){
    $(this).closest("section").children(".discussion_with_input").toggle();
    $(this).siblings(".plus").show();
    $(this).hide();
  });
  $('.plus').click(function(){
    $(this).closest("section").children(".discussion_with_input").toggle();
    $(this).siblings(".minus").show();
    $(this).hide();
  });
  // $('.exit').click(function(){
  //   $(this).closest("section").toggle();
  // });

  // $('.layer').animate({
  //     'opacity': 1
  // }, 2000);

};
