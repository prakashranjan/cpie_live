
    
    function joinreq_show(){
 $.ajax({
         type:"get",
   url: "pendingjoinrequest_ajax.php",
   beforeSend: function() {
    $("#pendingjoinrequest").html("<div style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },  
   data: {tid:tid },
   success: function( data ) {
   $( "#pendingjoinrequest" ).html(data);
   },
   async:true,
   cache: false
});
 
};

				
		

function joinallow(join_idal){
			       join_idal= join_idal.replace(/\D/g,'');
			// ion.sound.play("water_droplet_2");
	$.ajax({
         type:"get",
   url: "allow_join_ajax.php",
     
   data: {join_idal:join_idal,tid:tid},
   success: function( data ) {
	    
   $('#' + join_idal + 'joinreq' ).remove();
   },
   async:true,
   cache: false
})
	
	
};
		
	
		
		
		function ignorerequest(join_idig){
			       join_idig= join_idig.replace(/\D/g,'');
			// ion.sound.play("button_tiny");
	$.ajax({
         type:"get",
   url: "ignore_join_ajax.php",
     
   data: {join_idig:join_idig,tid:tid},
   success: function( data ) {
	   
   $('#' + join_idig + 'joinreq' ).remove();
   },
   async:true,
   cache: false
});
	
	
};

function channeltags(){
	$( "#tagy_show_but" ).hide();
	$.ajax({
         type:"post",
   url: "channeltags_ajax.php",
    beforeSend: function() {
    $('#tagy_show_res').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,newtag:$("#tagy_show").val()},
   success: function( data ) {
		   $( "#tagy_show_res" ).html(data);
                   $( "#tagy_show_but" ).show();
   },
   async:true,
   cache: false 
})
	
	
};


/*ajax fun for searching*/
function searchuser(div){
    
     
      
	var term=$("#"+div).val();
        
	term=$.trim(term);
	if(term.length >=1){
if(term==""){
	
	}
	else if(term[0]=='$'){ 
		$("#".div).css("color", "RoyalBlue");
		$("#"+div).css("text-transform", "lowercase");	
		if(term=='$'){ }
		else{
		term = term.substr(1);  
			$.ajax({
         type:"get",
   url: "searchuser_mem_ajax.php",
   beforeSend: function() {
    $('#search_members').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term,tid:tid},
   success: function( data ) {
	   
   $( "#search_members" ).html(data);
   
   },
   cache:false
})
	
	}
	}
	
	
	else
	{
	$("#"+div).css("color", "green");
		$("#"+div).css("text-transform", "uppercase");	
							  
								
	$.ajax({
         type:"get",
   url: "searchname_mem_ajax.php",
   beforeSend: function() {
    $('#search_members').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term,tid:tid},
   success: function( data ) {
	   
   $( "#search_members" ).html(data);
   },
   cache: false
})
		
	
	
	}
	
        }	
 
}

function memberdo(membermark){
    console.log(mark);
    var sachi=confirm("are you sure?");
    if(sachi==true){
     $('#' + membermark + 'todomem' ).hide();
			    membermark= membermark.replace(/\D/g,'');
			// ion.sound.play("water_droplet_2");
	$.ajax({
         type:"get",
   url: "memberdo_ajax.php",
     
   data: {membermark:membermark,tid:tid},
   success: function( data ) {
	    
   $('#' + membermark + 'todomem' ).html(data);
   $('#' + membermark + 'todomem' ).show();
   },
   async:true,
   cache: false
});
	
        }	
};