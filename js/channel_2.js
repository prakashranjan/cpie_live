
 
  
 function favmark(){
                var con=confirm("Please confirm!");
		if(con){	// ion.sound.play("water_droplet_2");
	$.ajax({
         type:"get",
   url: "channel_ajax/favmark_ajax.php",
    
   data: {tid:tid},
     dataType: "json",
   success: function( data ) {if(data[0]==1){$( "#fav" ).html('<i style="color:#e74c3c;" class="fa fa-heart-o fa-lg fa-2x" aria-hidden="true"></i> <span class="badge hrt">'+data[1]+'</span>');
                              $( "#fav2" ).html('<i style="color:#e74c3c;" class="fa fa-heart-o getora" aria-hidden="true"></i> <span class="badge hrt">'+data[1]+'</span>');}
       else if(data[0]==2){$( "#fav" ).html('<i style="color:#e74c3c;" class="fa fa-heart fa-lg fa-2x" aria-hidden="true"></i> <span class="badge hrt">'+data[1]+'</span>');
                              $( "#fav2" ).html('<i style="color:#e74c3c;" class="fa fa-heart getora" aria-hidden="true"></i> <span class="badge hrt">'+data[1]+'</span>');}
    
       
   
   },
   async:true,
   cache: false
})
	
                    }
};
	
		

 				



		
	
	



