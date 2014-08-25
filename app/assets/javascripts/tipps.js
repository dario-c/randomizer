var App = {
  
  checkDuplicated: function(){

    $("#tipp_name").blur( function(){
      var text = $(this).val();
      
      $.ajax( {
        method: "post",
        url: "/tipps/check",
        data: { name: text },
        success: function(data){ 
          if(data.id){console.log(data)}
          else{console.log("Not found")} 

        }
      })

    })

   }

};