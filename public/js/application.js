$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#signup-form").hide();
  $("#login-form").hide();

  $("#new-user-choice").on("submit", function(event) {
    event.preventDefault();
    $(".registration-login-choice").hide()
    $("#login-form").hide();
    $("#signup-form").show();
    });

  $("#login-user-choice").on("submit", function(event) {
    event.preventDefault();
    $(".registration-login-choice").hide()
    $("#signup-form").hide();
    $("#login-form").show();
    });

});
