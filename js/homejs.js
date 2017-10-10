	
        
        $( document ).ready(function() {
    
      $("#return11").html($("#return").html());
      
    
    
});
      function home(){
    $("#return").html($("#return11").html());
};
        
   function getinputbox(){
        
       $('#navswitch1').show(); 
       
     $('#navjustify').attr('style','display:none !important');  
        
    };     
        
        
        Dropzone.options.dpupload = {
  paramName: "file", // The name that will be used to transfer the file
  maxFilesize: 3, // MB
  uploadMultiple: false,
  maxFiles: 1,
   dictDefaultMessage: "<i class='fa fa-upload fa-lg' aria-hidden='true' ></i> Drop or choose an image here to auto upload ",
     acceptedFiles:"image/jpeg,image/png,image/gif,image/jpg", 
  accept: function(file, done) {
    if(file.name.length>150){
       done("file name too long.");
  }else{
        done();} 
  }
};
        
        

var count=0;



function prechat(){
    
    //do nothing
    
    
}
var lo=0;
var flag=[false,false,false,false,false,false,false,false,false,false,false,false];
var tm_flag=new Array();
while(lo<500){
    tm_flag[lo]=false;
    lo++;
}


function trend(){
  if(!flag[2]){
 $.ajax({
         type:"get",
   url: "topicajax.php",
   beforeSend: function() {
    $('#return2').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {},
   success: function( data ) {
   $( "#return2" ).html(data);
    
   $("#return").html($("#return2").html());
   flag[2]=true;
   },
   cache: true
})
 
}
else{
$("#return").html($("#return2").html());}
}



function getallbranch(cour){
    
  var cour= cour.replace(/\D/g,'');
 $.ajax({
         type:"get",
   url: "getallbranch_ajax.php",
   beforeSend: function() {
    $('#return').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {cour:cour},
   success: function( data ) {
   $( "#return" ).html(data);
   closeNav();
   },
   cache: true
})
 


}
								
			

function favtopic(){
    if(!flag[5]){
 $.ajax({
         type:"get",
   url: "favtopic_ajax.php",
   beforeSend: function() {
    $('#return5').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {counter:count},
   success: function( data ) {
   $( "#return5" ).html(data);
    $("#return").html($("#return5").html());
    flag[5]=true;
   },
   cache: true
})
 
}

else{
  $("#return").html($("#return5").html()); 
}
}

function mytopic(){
    closeNav();
    if(!flag[6]){
        
 $.ajax({
         type:"get",
   url: "mytopic_ajax.php",
    beforeSend: function() {
    $('#return6').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {counter:count},
   success: function( data ) {
   $( "#return6" ).html(data);
   $("#return").html($("#return6").html()); 
   flag[6]=true;
  
   },
   cache: true
})
 
}
else{
  $("#return").html($("#return6").html()); 
}
}



function both(){
  if($("#ntopic").val()==""){$( "#report" ).html("**enter topic name");}
    else{if(($("#type").val()=="" && $("#newcat").val()=="")||($("#type").val()!="" && $("#newcat").val()!="") ){$( "#report" ).html("**select category or create new");}
    
    else {if($("#cdesc").val()==""){$( "#report" ).html("**enter channel description");}
          else{if($("#topic_visi").val()=="-99"){$( "#report" ).html("**select visibility");}
            else{
                if($("#tagy").val()==''){$( "#report" ).html("**give some tags");}
                else
                {newtopic();}}
            
            }
   
     }
  
}}

function newtopic(){
	
 $.ajax({
         type:"post",
   url: "newtopicajax.php",
   beforeSend: function() {
    $('#report').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {ntopic:$("#ntopic").val(),typeid:$("#type").val(),topic_visi:$("#topic_visi").val(),cdesc:$("#cdesc").val(),ttagy:$("#ttagy").val(),private:$('input:radio[name=private]:checked').val(),newcat:$("#newcat").val()},
   success: function( data ) {
   $( "#report" ).html(data);
   },
   async:true,
   cache: false
})

};	





function clean(){
	$( "#report" ).empty();
	 
}

function removeinputbox(){
    $('#navswitch1').hide(); 
       
       $('#navjustify').attr('style','display:block !important'); 
        
}

/*ajax fun for searching*/
function search(div){
    
     
      
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
   url: "searchuserajax.php",
   beforeSend: function() {
    $('#return').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term},
   success: function( data ) {
	   
   $( "#return" ).html(data);
   
   },
   cache:false
})
	
	}
	}
	
	else if(term[0]=='@') { $("#"+div).css("color", "red");
						   $("#"+div).css("text-transform", "lowercase");	
				if(term=='@'){ }
							   else{
								   term = term.substr(1); 
	$.ajax({
         type:"get",
   url: "searchtopicajax.php",
   beforeSend: function() {
    $('#return').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term},
   success: function( data ) {
	   
   $( "#return" ).html(data);
   },
   cache: false
})
		}}
	else
	{
	$("#"+div).css("color", "green");
		$("#"+div).css("text-transform", "uppercase");	
							  
								
	$.ajax({
         type:"get",
   url: "searchnameajax.php",
   beforeSend: function() {
    $('#return').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term},
   success: function( data ) {
	   
   $( "#return" ).html(data);
   },
   cache: false
})
		
	
	
	}
	
        }	
 
}



		
		
		function online(){
 $.ajax({
         type:"get",
   url: "homeonline_ajax.php",
   beforeSend: function() {
    $('#online').html("<i class='fa fa-cog fa-spin fa-2x fa-fw margin-bottom'></i> <span class='sr-only'>Loading...</span> ");
  },  
   data: { },
   success: function( data ) {
   $( "#online" ).html(data);
   },
   async:true,
   cache: false

 
})
		};
		
		
		
		
    function type_match(type_id){
       
       if(!tm_flag[type_id]){
       
         $("#tmcacheall").append("<div id='tmcache_"+type_id+"'></div>");
  $.ajax({
         type:"get",
   url: "typematch_ajax.php",
   beforeSend: function() {
    $('#tmcache_'+type_id).html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {typeid:type_id},
   success: function( data ) {
   $( '#tmcache_'+type_id ).html(data);
    $("#return").html($("#tmcache_"+type_id).html()); 
   tm_flag[type_id]=true;
   },
   async:true,
   cache: true
})
  
        }
        else{
             $("#return").html($("#tmcache_"+type_id).html()); 
        }
};
	
function branch_match(branch_id){
    var branch_id=branch_id.replace(/\D/g,'');
  $.ajax({
         type:"get",
   url: "branch_match_ajax.php",
   beforeSend: function() {
    $('#return').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {branchid:branch_id},
   success: function( data ) {
   $( "#return" ).html(data);
  
   },
   async:true,
   cache: true
})
  
  
};



function global_led(kya){
    var root="";
    var prfix=".";
    //console.log(kya);
    if(kya==="class"){root="channel_ajax/";
    prfix="#";}
 $.ajax({
         type:"get",
   url: root+kya +"_led_ajax.php",
   
   data: { },
   success: function( data ) {
   var output=data;
   //console.log(output);
   if(output==1){
        //console.log("----"+output);
       if($( prfix+kya+"_led" ).hasClass("led-yellow")){ 
       //do nothing
           }
           else if($( prfix+kya+"_led" ).hasClass("led-yellow-off")){
               $( prfix+kya+"_led" ).removeClass("led-yellow-off");
               $( prfix+kya+"_led" ).addClass("led-yellow");
               
           }
       
   }
   else{
        //console.log("++++"+output);
   }
   },
   async:true,
   cache: false

 
});

var naseeb=naseeb_batao();
//console.log(naseeb);

if(!($(prfix+kya+"_led").hasClass("led-yellow"))){
setTimeout(function(){
  global_led(kya);
}, naseeb);
}

		};	
    
   
	function naseeb_batao(){
            var val = parseInt(Math.random() * 4);
            var salty=parseInt(Math.random() * 10);
            val=40000 + val*salty*10000;
            
            return val;
        }	
		
    
	

   
		
		
    
			

  


	


