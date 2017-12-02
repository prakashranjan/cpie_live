	var u_ids=new Array();
        
        Dropzone.options.broadcastdocupload = {
  paramName: "file", // The name that will be used to transfer the file
  maxFilesize: 30, // MB
  uploadMultiple: false,
  maxFiles: 5,
   dictDefaultMessage: "<i class='fa fa-upload fa-lg' aria-hidden='true' ></i> Drop or choose an image/file here to auto upload ",
     acceptedFiles:null, 
  accept: function(file, done) {
   
  if(file.name.length>150){
       done("file name too long.");
  }else{
      if((($("#tagy").val()=="" )&& ($("#hide_u_ids").val()=="")) || $("#catin").val()=="")
      {done("something went wrong");}
      else
      {//console.log("hello");
        done();}} 
  },
  sending: function(file, xhr, formData) {
      
      if ($("#anon2").is(":checked")) {  
    // checkbox is checked 
    var anon2=1;
    //console.log("anon2 checked");
} else {
    // checkbox is not checked 
     var anon2=0;
     //console.log("anon2 unchecked");
}
//console.log(u_ids.toString());
        //console.log($("#hide_u_ids").val());
        
      //console.log("ab chalega");
      var catino=$("#catin").val();
    catino= catino.replace(/\D/g,'');
    formData.append("tagy",$("#tagy").val());
    formData.append("u_ids",$("#hide_u_ids").val());
    formData.append("catin",catino);
    formData.append("anon2",anon2);
      
}
  
  
};
      
        
        
        $( document ).ready(function() {
    
      
      $("#wall_desk").hide();
     
      
      refer(1);
      
   
      
    
});
var counter_flag=new Array();
var lo=0;
while(lo<50){
    counter_flag[lo]=false;
    lo++;
}
        
     function moveform(no){
         if(no==1){$('#moveform').insertAfter('#tab1com');}
         else if(no==2){$('#moveform').insertAfter('#tab2com');}
         else if(no==3){$('#moveform').insertAfter('#tab3com');}
         
         
     };   
        
        
	function prechat(){
	
	$.ajax({
         type:"get",
   url: "broadcast_ajax/prechat_ajax.php",
    beforeSend: function() {
    $("#chatdiv").prepend("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {},
   success: function( data ) {
    $("#load_gif").remove();
   $( "#chatdiv" ).prepend(data);
   },
   async:true,
   cache: false
});
	
	
};

       function comm_show(post_id){
     $("#comment_button").hide();
     $("#latest_comment").hide();
      $("#comment_info").hide();
     var npost_id= post_id.replace(/\D/g,'');
    
	$("#comment_post_id").val(npost_id);
        	$.ajax({

         type:"get",
   url: "broadcast_ajax/show_comment_ajax.php",
    beforeSend: function() {
   $("#comments_display").html("<div class='text-center text-muted'><span style='text-align:center;' class='text-center'><i class='fa fa-refresh fa-spin fa-3x fa-fw text-center'></i><span class='sr-only'>Loading...</span></span></div>");
  },
   data: {comment_post_id:$("#comment_post_id").val()},
   success: function( data ) {
        $("#latest_comment").show();
     $("#comment_display").scrollTop(0);
   $( "#comments_display" ).html(data);
    $("#comment_info").show();
   $("#comment_button").show();
   },
   async:true,
   cache: false
});
        
};  

 $(document).ready(function () {
  //your code here
 $("#comment_info").keydown(function (e){
    if(e.keyCode === 13 ){
        
        save_comment();
    }
});
             });
        
    
function save_comment(){
	if($("#comment_info").val()==="")
	{// do nothing  
            
            }
else
{$("#comment_button").hide();
  $("#comment_info").hide();
 
	$.ajax({

         type:"get",
   url: "broadcast_ajax/save_comment_ajax.php",
    beforeSend: function() {
   // do nothing
  },
   data: {comment_info:$("#comment_info").val(),comment_post_id:$("#comment_post_id").val()},
   success: function( data ) {
       
	 document.getElementById( 'latest_comment' ).scrollIntoView();
       document.getElementById("comment_info").value = "";
   $( "#comments_display" ).append(data);
     $("#comment_info").show();
   $("#comment_button").show();
   },
   async:true,
   cache: false
});
	
}	
};        



function savepoll(){
   
	if($("#cap3").val()=="" || (($("#tagy").val()=="") && ($("#hide_u_ids").val()=="")) )
	$( "#respo3" ).html("<span style='color:red;text-align:center;'>**plese enter something...</span>");
else
{      //console.log(u_ids.toString());
        //console.log($("#hide_u_ids").val());
    
        $("#post_poll").hide();
    var polloption =[];
    for(i=1,j=0;i<=10;i++){
    if($("#opt"+i).val()!=""){
        polloption[j]=$("#opt"+i).val();
        //console.log(polloption[j]+" "+j);
        j++;
    }    
    }
    
    var catin=$("#catin").val();
    catin= catin.replace(/\D/g,'');
    
    if ($("#anon3").is(":checked")) {  
    // checkbox is checked 
    var anony=1;
} else {
    // checkbox is not checked 
     var anony=0;
}

var poll_checkbox=0;
	$.ajax({

         type:"post",
   url: "broadcast_ajax/pollpost_ajax.php",
    beforeSend: function() {
    $("#respo3").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {cap:$("#cap3").val(),poll_checkbox:poll_checkbox,polloption:polloption,anony:anony,tagy:$("#tagy").val(),catin:catin,u_ids:$("#hide_u_ids").val()},
   success: function( data ) {
	  //console.log(u_ids.toString()); 
       prechat();
   $( "#respo3" ).html(data);
   $("#post_poll").show();
   },
   async:true,
   cache: false
});
	
}	
};

    
  
		function savevote(poll_id){
			// ion.sound.play("button_tiny");
                        var poll_id= poll_id.replace(/\D/g,'');
                    var opt_val= $('input[id="'+poll_id+'poll"]:checked').val();
                    if(!opt_val){
                        //do nothing
                      }
                    else{
                    $("#"+ poll_id +"vote" ).hide();                     
         $.ajax({
         type:"post",
   url: "broadcast_ajax/savevote_ajax.php",
     
   data: {poll_id:poll_id,opt_val:opt_val},
   success: function( data ) {
   $("#"+ poll_id +"polldiv" ).html(data);
   },
   async:true,
   cache: false
});
                        
                    }

	
	
};	


		function slam(chat_id){
			// ion.sound.play("button_tiny");
	$.ajax({
         type:"post",
   url: "broadcast_ajax/slam_ajax.php",
     
   data: {tid:tid,chatid:chat_id},
   success: function( data ) {
   $('#' + chat_id ).html(data);
   },
   async:true,
   cache: false
});
	
	
};
	
function slam_comment(comm_id){
			// ion.sound.play("button_tiny");
                        var comment_id= comm_id.replace(/\D/g,'');
	$.ajax({
         type:"post",
   url: "broadcast_ajax/comment_slam_ajax.php",
     
   data: {commentid:comment_id},
   success: function( data ) {
   $('#' + comment_id +'comm_slam_id' ).html(data);
   },
   async:true,
   cache: false
});
	
	
};	


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
		


	function chan(id){

if(id==="pfile"||id==="pfile2"){ 
 $("#wll").removeClass("active bg-warning");
$("#wll2").removeClass(" btn-warning");
$("#wll2r").removeClass(" bg-warning");

        	$("#pfile").addClass("active bg-warning");
                $("#pfile2").addClass(" btn-warning");
                $("#pfile2r").addClass("bg-warning");
$("#desk").show();
$("#loud_shout").hide();
$("#loud_shout2").hide();
$("#wall_tab").hide();
$("#wall_desk").hide();
$('#loadmore').hide();
}
else if(id==="wll"||id==="wll2"){
$("#pfile").removeClass("active bg-warning");
$("#pfile2").removeClass(" btn-warning");
$("#pfile2r").removeClass(" bg-warning");
$("#pfile2").addClass(" btn-success");
        	$("#wll").addClass("active bg-warning");
        $("#wll2").addClass("btn-warning");
        $("#wll2r").addClass("bg-warning");
$("#desk").hide();
$("#loud_shout").show();
$("#loud_shout2").show();
$("#wall_tab").show();
$("#wall_desk").show();
$('#loadmore').show();

if($( ".wall_led" ).hasClass("led-yellow")){
               $( ".wall_led" ).removeClass("led-yellow");
               $( ".wall_led" ).addClass("led-yellow-off");
               
           }


}

	}	

					
var opt_new=5;
function add_opt(){
    if(opt_new<=10){
   
    $("#append_li").append('<li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt'+opt_new+'" maxlength="60" id="opt'+opt_new+'" placeholder="+ option '+opt_new+'"/></li>');
    //console.log(opt_new);
    if(opt_new==10){
        
      $("#add_opt_button").hide();      
    }
    opt_new=opt_new + 1;
    }
    
};			
			
function multi(){
	savecap();
	
	
};	

function savecap(){
	if(($("#cap").val()=="")||(($("#tagy").val()=="")&&($("#hide_u_ids").val()=="")))
	$( "#respo" ).html("<span style='color:red;'>***sorry invalid</span>");
else
{ 
        //console.log(u_ids.toString());
        //console.log($("#hide_u_ids").val());
    $('#grabcap').hide();
    var catin=$("#catin").val();
    catin= catin.replace(/\D/g,'');

	$.ajax({

         type:"post",
   url: "broadcast_ajax/caption_ajax.php",
    beforeSend: function() {
    $('#respo').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {cap:$("#cap").val(),anon:$('input:checkbox:checked').val(),tagy:$("#tagy").val(),catin:catin,u_ids:$("#hide_u_ids").val()},
   success: function( data ) {
	   //prechat();
           //console.log(u_ids.toString());
   $( "#respo" ).html(data);
   $('#grabcap').show();
   },
   async:true,
   cache: false
});
	
}	
};
		
         var ko=0;
         var bmark=new Array();
         var now_wall_id;
while(ko<15){
    bmark[ko]=0;
    ko++;
}


function refer(wallid){
	//$('#loadmore').hide();
        var pichla_div =$('#wall_desk').attr('name');
         


    if( $("#wallcat"+wallid).is(':empty') || (("#wallcat"+wallid )===("#"+pichla_div))) {
        //console.log("----------ajax");
var wall_id= wallid;
    bmark[wall_id]=0;
    //console.log("bmark-old-"+wall_id+"--"+bmark[wall_id]);
	$.ajax({
         type:"post",
   url: "broadcast_ajax/chat_ajax.php",
    beforeSend: function() {
    $('#wall_desk').append("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {counter:bmark[wall_id],wallid:wall_id},
   success: function( data ) {
       bmark[wall_id]=0;
       //console.log("bmark-new-"+wall_id+"--"+bmark[wall_id]);
    $('#load_gif').remove();
    var name =$('#wall_desk').attr('name');
    //console.log("1----------"+name);
    if((("#wallcat"+wallid )===("#"+pichla_div))){
        
        $( "#wall_desk" ).html(data);
        //console.log(data);
        //console.log("2-refresh--------"+$('#wall_desk').attr('name')); 
    }
    else{
    $( "#"+name ).html($( "#wall_desk" ).html()); 
    
   $( "#wall_desk" ).html(data);
   $('#wall_desk').attr('name','wallcat'+wallid);
     //console.log("2--new-------"+$('#wall_desk').attr('name'));  
     }
   },
   
   cache: false 
});
}
else{ 
    //console.log("----------cache");
    var name =$('#wall_desk').attr('name');
    //console.log("1-------------"+name);
    $( "#"+name ).html($( "#wall_desk" ).html()); 
     $( "#wall_desk" ).html( $( "#wallcat"+wallid ).html());
     $( "#wallcat"+wallid ).empty();
     $('#wall_desk').attr('name','wallcat'+wallid);
     //console.log("2-------------"+$('#wall_desk').attr('name'));
    }
    
 now_wall_id=wallid;   
 //console.log("now_wall_id-----------"+now_wall_id);
 
 
 
 
};
	
        
        
function refer_next(){
	$('#loadmore').hide();
        //console.log("working");
   
var now2_wall_id= now_wall_id;
//console.log("bmark-old-"+now2_wall_id+"--"+bmark[now2_wall_id]);
	$.ajax({
         type:"post",
   url: "broadcast_ajax/chat_index_ajax.php",
    beforeSend: function() {
    $('#wall_desk').append("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {counter:bmark[now2_wall_id],wallid:now2_wall_id},
   success: function( data ) {
       bmark[now2_wall_id]+=1;
       //console.log("bmark-now-"+now2_wall_id+"--"+bmark[now2_wall_id]);
    $('#load_gif').remove();
    
    
        
        $( "#wall_desk" ).append(data);
        //console.log("append--------"+ now2_wall_id); 
    
   },
   
   cache: false 
});


    
    
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
   url: "broadcast_ajax/searchuser_mem_ajax.php",
   beforeSend: function() {
    $('#search_members').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term},
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
   url: "broadcast_ajax/searchname_mem_ajax.php",
   beforeSend: function() {
    $('#search_members').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {term:term},
   success: function( data ) {
	   
   $( "#search_members" ).html(data);
   },
   cache: false
})
		
	
	
	}
	
        }	
 
}


function memberdojs(membermark){
     membermark= membermark.replace(/\D/g,'');
     if(membermark){
         
         if(u_ids.indexOf(membermark)<0){
         u_ids.push(membermark);
    $('#hide_u_ids').val(u_ids.toString());
    //console.log(u_ids.toString());
    
     $('#' + membermark + 'usercard' ).prependTo("#members_all");
     }	  
     
     else{
         if( $('#' + membermark + 'usercard').parent().attr("id")=="search_members"){
         $('#' + membermark + 'usercard' ).remove();
         //console.log(u_ids.toString());
     }
     else if($('#' + membermark + 'usercard').parent().attr("id")=="members_all"){
       u_ids.splice(u_ids.indexOf(membermark),1);
        $('#hide_u_ids').val(u_ids.toString());
                $('#' + membermark + 'usercard' ).remove();
                //console.log(u_ids.toString());
     }}
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