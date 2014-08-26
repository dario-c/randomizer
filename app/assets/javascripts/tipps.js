var App = {

  checkDuplicated: function(){
   
    $("#tipp_name").blur( function(){
      var text = $(this).val();
      $.ajax( {
        method: "post",
        url: "/tipps/check",
        data: { name: text },
        success: function(data){
        
        if(data.id){
            $("#taken").show();
            console.log(data);
            $("#taken").find("a").attr("href","/comments/new?tipp_id="+data.name);
            $(".button").prop('disabled', true);
          }
        else{ $("#taken").hide();
          $(".button").prop('disabled', false); }
        }
      });

    });

   }
};