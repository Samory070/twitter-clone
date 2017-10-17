$(document).ready(function() {
  $('ul').on('click', '.tweet-link', function(e) {
    e.preventDefault();
    var $aTag = $(this)

    $.ajax({
      url: $(this).attr('href'),
      method: 'get'
    })
    .done( function (res){
      $aTag.parent().append(res)
      // $aTag.parent().removeClass('.tweet-link')
    })

  })

  $('#newTweetFormContainer').on('submit', '#newTweetForm' function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    })
    .done(function(res){
      $('ul').prepend(res)
    })
  })

});
