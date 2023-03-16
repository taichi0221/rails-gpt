$(function() {
  $('#chat-form').on('submit', function(e) {
    e.preventDefault();
    var input_text = $('#input-text').val();
    if (input_text) {
      $('#input-text').val('');
      $('#chat-window').append('<div class="chat-bubble right"><span>' + input_text + '</span></div>');
      $.ajax({
        url: '/home/chat',
        type: 'POST',
        dataType: 'json',
        data: { input_text: input_text },
        success: function(data) {
          var response = data.response;
          $('#chat-window').append('<div class="chat-bubble left"><span>' + response + '</span></div>');
          $("#chat-window").scrollTop($("#chat-window")[0].scrollHeight);
        }
      });
    }
  });
});
