

   Dropzone.options.docupload = {
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
     $('#comment_button').hide();
     $('#latest_comment').hide();
      $('#comment_info').hide();
     var npost_id= post_id.replace(/\D/g,'');
    
	$("#comment_post_id").val(npost_id);
        	$.ajax({

         type:"get",
   url: "show_comment_ajax.php",
    beforeSend: function() {
   $('#comments_display').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {comment_post_id:$("#comment_post_id").val()},
   success: function( data ) {
        $('#latest_comment').show();
     $("#comment_display").scrollTop(0);
   $( "#comments_display" ).html(data);
    $('#comment_info').show();
   $('#comment_button').show();
   },
   async:true,
   cache: false
})
        
};

 $(document).ready(function () {
  //your code here
 $('#comment_info').keydown(function (e){
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
{$('#comment_button').hide();
  $('#comment_info').hide();
	$.ajax({

         type:"get",
   url: "save_comment_ajax.php",
    beforeSend: function() {
   // do nothing
  },
   data: {comment_info:$("#comment_info").val(),comment_post_id:$("#comment_post_id").val()},
   success: function( data ) {
       
	 document.getElementById( 'latest_comment' ).scrollIntoView();
       document.getElementById("comment_info").value = "";
   $( "#comments_display" ).append(data);
     $('#comment_info').show();
   $('#comment_button').show();
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


	$.ajax({

         type:"post",
   url: "pollpost_ajax.php",
    beforeSend: function() {
    $('#respo3').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,cap:$("#cap3").val(),polloption:polloption,anony:anony},
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
	$('#loadmore').hide();

	$.ajax({
         type:"post",
   url: "chat_ajax.php",
    beforeSend: function() {
    $('#chatdiv').append("<div id='load_gif'style='text-align:center;'><img src='images/copy.gif'/></div>");
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
{$('#grabcap').hide();

	$.ajax({

         type:"post",
   url: "caption_ajax.php",
    beforeSend: function() {
    $('#respo').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid,cap:$("#cap").val(),anon:$('input:checkbox:checked').val()},
   success: function( data ) {
	   prechat();
   $( "#respo" ).html(data);
   $('#grabcap').show();
   },
   async:true,
   cache: false
})
	
}	
};


   


	
	
	function prechat(){
	
	$.ajax({
         type:"get",
   url: "prechat_ajax.php",
    beforeSend: function() {
    $('#chatdiv').prepend("<div id='load_gif'style='text-align:center;color:#2C3E50;'><img src='images/copy.gif'/></div>");
  },
   data: {tid:tid},
   success: function( data ) {
    $('#load_gif').remove();
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
   url: "media_ajax.php",
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
   url: "notification_ajax.php",
    
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

 $( "#chandis" ).html("<textarea rows='10' cols='100%'class='form-control input-lg lead ubuntu inputbak'style='color:black;' onchange='channeldiscrip();'name='channeldiscrip' id='channeldiscrip' placeholder='Give the channel discription in detail......'></textarea");
$("#channeldiscrip").text(chandata);
}
function channeldiscrip(){
	
	$.ajax({
         type:"post",
   url: "channeldiscrip_ajax.php",
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



		function favmark(){
                var con=confirm("Please confirm!");
		if(con){	
	$.ajax({
         type:"get",
   url: "favmark_ajax.php",
    
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
		
	
	

		
		
		function online(){
 $.ajax({
         type:"get",
   url: "topiconline_ajax.php",
   beforeSend: function() {
    $('#online').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
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
			
                        var poll_id= poll_id.replace(/\D/g,'');
                    var opt_val= $('input[id="'+poll_id+'poll"]:checked').val();
                    if(!opt_val){
                        //do nothing
                      }
                    else{
                    $("#"+ poll_id +"vote" ).hide();                     
         $.ajax({
         type:"post",
   url: "savevote_ajax.php",
     
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
			
	$.ajax({
         type:"post",
   url: "slam_ajax.php",
     
   data: {tid:tid,chatid:chat_id},
   success: function( data ) {
   $('#' + chat_id ).html(data);
   },
   async:true,
   cache: false
})
	
	
};
	
function slam_comment(comm_id){
			
                        var comment_id= comm_id.replace(/\D/g,'');
	$.ajax({
         type:"post",
   url: "comment_slam_ajax.php",
     
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
  
  $('#shoutid').val(share_id);
  
};
    

    function forward(){
		if($("#sharechannel").val()!=-99){
  
 $.ajax({
         type:"post",
   url: "share_ajax.php",
   beforeSend: function() {
    $('#status').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
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
    
		
  
 function topic_whatsapp(){
    
     
     if($(".whatsapp_g_link").val()){
	 var pakka=confirm("change channel's whatsapp group link");
        if(pakka){
	$.ajax({
         type:"post",
   url: "topicwhatsapp_ajax.php",
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

