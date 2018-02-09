

                                              function update_diska(){
                                                   $.ajax({
         type:"get",
   url: "update_diska_ajax.php",
    
   data: {uid:$("#uid").val()},
   success: function( data ) {
       $('.diska').html(data);
   },
   async:true,
   cache: false
});
                                                  
                                                  
                                              }
                                              
					function sendrequest(hut){
                                            var marka=confirm("Are you sure?");
                                            if(marka){
 $.ajax({
         type:"get",
   url: "sendrequest_ajax.php",
   beforeSend: function() {
    $('.makar'+hut).hide();
  },  
   data: {uid:$("#uid").val(),hut:hut},
   success: function( data ) {
       if(data==1){
   $('.makar'+hut).remove();
  // console.log("ho gya ----"+hut);
   //update progress bar and value
   update_diska();
       }else if (data==0){
           //nothing
         //  console.log("waah");
       }
   },
   async:true,
   cache: false
});
                                            }
};
				
