$(function() {
  $('#new-answer').hide();

  $('#add-answer').on("click", function(event){
    event.preventDefault();
    $('#add-answer').hide();
    $('#new-answer').show();
  });
    
  $('form').on("submit", function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $('form').serialize();

      $.post(url, data, function(server_response){
        $('#answers').append("<li>" + server_response.answer_text +"</li>")
        $('#new-answer').hide();
        $('#new-answer #answer_answer_text').val("");
      });

    $('#add-answer').show();
  })

});
