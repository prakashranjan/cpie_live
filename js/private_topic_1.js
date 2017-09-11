


//magic1

					function join_group_request(){
                                        $("#join_group_request").hide();
 $.ajax({
         type:"get",
   url: "join_group_request_ajax.php",
   beforeSend: function() {
    $("#join_group").html("<div style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },  
   data: {tid:tid},
   success: function( data ) {
   $( "#join_group" ).html(data);
   },
   async:true,
   cache: false
});
 
                             };	

