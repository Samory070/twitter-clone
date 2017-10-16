$(document).ready(function() {
  $('.tweet-link').on('click', function(e) {
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

  $('#newTweetForm').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr('href'),
      method: 'get'
    })
    .done({
      $(#new)
    })
  })
});
