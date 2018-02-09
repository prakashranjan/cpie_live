	
      
        
        
        

  

        
  

        function validate(name,val,place_id=null){
            
		//console.log("chal gya"+place_id+"__"+name);
		if(val==="" ||name===""){
                    return;
                }
	if(name==="status"||name==="long_disc"||name==="from_place"||name==="lives_at"){
if(name==="from_place" || name==="lives_at"){
    if(place_id===""){return;}
    
}
	 $.ajax({
         type:"post",
   url: "savedetails_ajax.php",
		 
        beforeSend: function() {
    $('#' + name).html("");
  },
   data: {val:val,name:name,place_id:place_id},
   success: function( data ) {
   $('#' + name ).val(data);
   },
   async:true,
   cache: false
});
   
                }
	
   };
		

	

  


function skilltags(){
	$( "#tagy_show_but" ).hide();
	$.ajax({
         type:"post",
   url: "skilltags_ajax.php",
    beforeSend: function() {
    $('#tagy_show_res').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {newtag:$("#skill_tagy").val()},
   success: function( data ) {
		   $( "#tagy_show_res" ).html(data);
                   $( "#tagy_show_but" ).show();
   },
   async:true,
   cache: false 
})
	
	
};