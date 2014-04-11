$(document).ready(function(){
  var num_click = 0;
  $(".view-hidden-trainee").click(function(){
    if(num_click % 2 == 0) {
      $(".trainee-in-course").hide();
    } else {
      $(".trainee-in-course").show();      
    }
    num_click++;
  });
});