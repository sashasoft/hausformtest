$(document).on('page:change', function () {

  //$('.dropdown-toggle').dropdown();
  
  $("p.showdopdiw").click(function(){
   var text = $(this).text();
   if (text == "Открыть дополнительные поля"){
     $(".dopdiv").show(500);
     $(this).html("Закрыть дополнительные поля");
   } else {
     $(".dopdiv").hide(500); 
     $(this).html("Открыть дополнительные поля");
   } 
 });
});
