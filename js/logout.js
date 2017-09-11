  		
	function logout(){
 $.ajax({
         type:"post",
   url: "logout_ajax.php",
   beforeSend: function() {
    $('#logout').html("<i class='fa fa-cog fa-spin fa-2x fa-fw margin-bottom'></i> <span class='sr-only'>Loading...</span> ");
	   
  },  
   data: { },
   success: function( data ) {
  var newLocation = "./";
window.location = newLocation;
   },
   async:true,
   cache: false
})
 
};