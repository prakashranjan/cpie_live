
Dropzone.options.channeldocupload = {
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
        done();} 
  },
  sending: function(file, xhr, formData) {
      
     

if ($("#hide_t2").is(":checked")) {  
    // hide_t2_checkbox is checked 
    var hide_t2=1;
} else {
    // hide_t2_checkbox is not checked 
     var hide_t2=0;
}
if ($("#anon2").is(":checked")) {  
    // hide_identity2_checkbox is checked 
    var hide_identity2=1;
} else {
    // hide_identity2_checkbox is not checked 
     var hide_identity2=0;
}


        
      //console.log("ab chalega");

   //console.log("-------"+hide_identity2);
      //console.log("-------"+hide_t2);
    formData.append("anon2",hide_identity2);
    formData.append("hide_t2",hide_t2);
    
      
}
  
};
 
 var counter_flag=new Array();
var lo=0;
while(lo<50){
    counter_flag[lo]=false;
    lo++;
}
 
var mark=0;
// A $( document ).ready() block.
$( document ).ready(function() {
   
      refer();
    
});

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
    function comm_show(post_id){
     $("#comment_button").hide();
     $("#latest_comment").hide();
      $("#comment_info").hide();
     var npost_id= post_id.replace(/\D/g,'');
    
	$("#comment_post_id").val(npost_id);
        	$.ajax({

         type:"get",
   url: "channel_ajax/show_comment_ajax.php",
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
})
        
};

 $(document).ready(function () {
  //your code here
 $("#comment_info").keydown(function (e){
    if(e.keyCode === 13){
        save_comment();
    }
});
             });
             


function save_comment(){
	if($("#comment_info").val()=="")
	{// do nothing  
            }
else
{$("#comment_button").hide();
  $("#comment_info").hide();
	$.ajax({

         type:"get",
   url: "channel_ajax/save_comment_ajax.php",
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
})
	
}	
};


function savepoll(){
   
	if($("#cap3").val()=="")
	$( "#respo3" ).html("<span style='color:red;text-align:center;'>**plese enter something...</span>");
else
{$("#post_poll").hide();
    var polloption =[];
    for(i=1,j=0;i<=10;i++){
    if($("#opt"+i).val()!=""){
        polloption[j]=$("#opt"+i).val();
        //console.log(polloption[j]+" "+j);
        j++;
    }    
    }
    
    if ($("#poll_checkbox").is(":checked")) {  
    // checkbox is checked 
    var anony=1;
} else {
    // checkbox is not checked 
     var anony=0;
}
if ($("#poll_hide_t").is(":checked")) {  
    // poll_hide_t_checkbox is checked 
    var poll_hide_t=1;
} else {
    // poll_hide_t_checkbox is not checked 
     var poll_hide_t=0;
}

var poll_checkbox=0;
	$.ajax({

         type:"post",
   url: "channel_ajax/pollpost_ajax.php",
    beforeSend: function() {
    $("#respo3").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,cap:$("#cap3").val(),poll_checkbox:poll_checkbox,polloption:polloption,anony:anony,poll_hide_t:poll_hide_t},
   success: function( data ) {
	   prechat();
   $( "#respo3" ).html(data);
   $("#post_poll").show();
   },
   async:true,
   cache: false
})
	
}	
};


function refer(){
	$("#loadmore").hide();

	$.ajax({
         type:"post",
   url: "channel_ajax/chat_ajax.php",
    beforeSend: function() {
    $("#chatdiv").append("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,counter:mark},
   success: function( data ) {mark+=1;
    $('#load_gif').remove();
   $( "#chatdiv" ).append(data);

   },
   
   cache: false 
})
	
	
};







function savecap(){
	if($("#cap").val()=="")
	$( "#respo" ).html("<span style='color:red;'>**plese enter something...</span>");
else
{$("#grabcap").hide();
if ($("#hide_t").is(":checked")) {  
    // hide_t_checkbox is checked 
    var hide_t=1;
} else {
    // hide_t_checkbox is not checked 
     var hide_t=0;
}
if ($("#anon").is(":checked")) {  
    // hide_identity_checkbox is checked 
    var hide_identity=1;
} else {
    // hide_identity_checkbox is not checked 
     var hide_identity=0;
}

	$.ajax({

         type:"post",
   url: "channel_ajax/caption_ajax.php",
    beforeSend: function() {
    $("#respo").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,cap:$("#cap").val(),anon:hide_identity,hide_t:hide_t},
   success: function( data ) {
	   prechat();
   $( "#respo" ).html(data);
   $("#grabcap").show();
   },
   async:true,
   cache: false
})
	
}	
};


   


	
	
	function prechat(){
	
	$.ajax({
         type:"get",
   url: "channel_ajax/prechat_ajax.php",
    beforeSend: function() {
    $("#chatdiv").prepend("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid},
   success: function( data ) {
    $("#load_gif").remove();
    tick=0;
   $( "#chatdiv" ).prepend(data);
   },
   async:true,
   cache: false
})
	
	
};
	

	
	
function multi(){
	savecap();
	
	
};
	
	

function media(){
    if(!counter_flag[0]){
	$.ajax({
         type:"get",
   url: "channel_ajax/media_ajax.php",
    beforeSend: function() {
    $('#media').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid},
   success: function( data ) {
		   $( "#media" ).html(data);
                   counter_flag[0]=true;
   },
   async:true,
   cache: false
})
	
    }
};		




var naseebnoti=naseeb_batao(20000,4);
setTimeout(notify, naseebnoti) 
console.log(naseebnoti);
var tick=0;
function notify(){
	$.ajax({
         type:"post",
   url: "channel_ajax/notification_ajax.php",
    
    
   data: {tid:tid,count:tick},
   success: function( data ) {
   $( ".ting" ).html(data);
   var numbu=parseInt(data);
   console.log("numbu-->"+numbu);
   if(numbu!=0){
       console.log("tick-->"+tick);
       var waga=data.search("red");
       console.log("waga-->"+waga);
       if(waga!=-1 && tick!=numbu){
           console.log("tick-->"+tick);
        displayNotification("@"+tn_url+"",numbu+" new shouts",2);
    }
   }
   tick=numbu;
   console.log("tick-->"+tick);
   },
   async:true,
   cache: false
})
   
   
   if(tick>0)
   naseebnoti=naseeb_batao(20000,7);
   else
   naseebnoti=naseeb_batao(20000,4);
   
   console.log(naseebnoti);
setTimeout(notify, naseebnoti);
	
};


function editchandis(){
  var chandata= $("#channeldiscrip").text();

 $( "#chandis" ).html("<textarea rows='10' cols='100%'class='form-control input-lg lead ubuntu inputbak 'style='color:black;' onchange='channeldiscrip();'name='channeldiscrip' id='channeldiscrip' placeholder='Give the channel discription in detail......'></textarea");
$("#channeldiscrip").text(chandata);
}
function channeldiscrip(){
	
	$.ajax({
         type:"post",
   url: "channel_ajax/channeldiscrip_ajax.php",
    beforeSend: function() {
    $('#chandis').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,val:$("#channeldiscrip").val()},
   success: function( data ) {
		   $( "#chandis" ).html(data);
   },
   async:true,
   cache: false 
})
	
	
};	
	
		
	

		
		
		function online(){
 $.ajax({
         type:"get",
   url: "channel_ajax/sectiononline_ajax.php",
   beforeSend: function() {
    $("#online").html("<img src='images/copy.gif'/> ");
  },  
   data: {tid:tid},
   success: function( data ) {
   $( "#online" ).html(data);
   },
   async:true,
   cache: false
})
 
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
   url: "channel_ajax/savevote_ajax.php",
     
   data: {poll_id:poll_id,opt_val:opt_val},
   success: function( data ) {
   $("#"+ poll_id +"polldiv" ).html(data);
   },
   async:true,
   cache: false
})
                        
                    }

	
	
};	
	

		function slam(chat_id){
			// ion.sound.play("button_tiny");
	$.ajax({
         type:"post",
   url: "channel_ajax/slam_ajax.php",
     
   data: {tid:tid,chatid:chat_id},
   success: function( data ) {
   $('#' + chat_id ).html(data);
   },
   async:true,
   cache: false
})
	
	
};
	
function slam_comment(comm_id){
			// ion.sound.play("button_tiny");
                        var comment_id= comm_id.replace(/\D/g,'');
	$.ajax({
         type:"post",
   url: "channel_ajax/comment_slam_ajax.php",
     
   data: {commentid:comment_id},
   success: function( data ) {
   $('#' + comment_id +'comm_slam_id' ).html(data);
   },
   async:true,
   cache: false
})
	
	
};	

function shareid(share_id){
      var share_id= share_id.replace(/\D/g,'');
  
  $("#shoutid").val(share_id);
  
};
    

    function forward(){
		if($("#sharechannel").val()!=-99){
  
 $.ajax({
         type:"post",
   url: "channel_ajax/share_ajax.php",
   beforeSend: function() {
    $("#status").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {postid:$("#shoutid").val(),category:$("#sharechannel").val()},
   success: function( data ) {
   $( "#status" ).html(data);
   },
   async:true,
   cache: false
})
		}
		else
		{$( "#status" ).html("<div class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Please!</strong> select category.</div>");
		}
};
    
		
 function channel_whatsapp(){
    
     
     if($(".whatsapp_g_link").val()){
	 var pakka=confirm("change channel's whatsapp group link");
        if(pakka){
	$.ajax({
         type:"post",
   url: "channel_ajax/channelwhatsapp_ajax.php",
    beforeSend: function() {
    $('#whatsapp_link_jagah').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,link:$(".whatsapp_g_link").val()},
   success: function( data ) {
       
       var data_check=data.trim();
       if(data_check=='false'){$( "#whatsapp_link_jagah" ).html("<span class='text-danger'>***invalid link</span>"); }
	else	{   $( "#whatsapp_link_jagah" ).html(data);}
                   //return json for boolean result
   },
   async:true,
   cache: false 
});
 }
 
 }	
}; 
 
  
 
		

    
   
				
		


		
	
		
		
		
	
                             
					
