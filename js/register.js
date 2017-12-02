//for intializing vlaidation array
var chal = { "email": 1, "phone": 1, "username": 1 , "password":1 };

var dl;
function keyadno(mask){
    var kat=mask;
    kat =kat.toUpperCase();
    var cou=kat.length;
    if(kat[3]=="d"||kat[3]=="D"){
        dl=1;
    }
    else{dl=0;}
    if(cou==2){
      if(kat=="14" || kat=="15" || kat=="16" || kat=="17")
      {  $("#adno").val(kat+'/');
   }
       else 
       {
       $("#adno").val('');  }   
    }
    else if(cou==5||(cou==7 && dl==1)){
       
       var ltwo = kat.substr(cou - 2);
       if(ltwo=="DL"){
           dl=1;
          kat =kat.toUpperCase();
          $("#adno").val(kat);
       }
        else {  if(ltwo=="IT" || ltwo=="CE" || ltwo=="IC" || ltwo=="EC" || ltwo=="ME")
       { $("#adno").val(kat+'/');
            
       }  
       else if(ltwo=="CS" || ltwo=="EE")
        {
       $("#adno").val(kat);  } 
        else{
             $("#adno").val(''); 
        }
    }
        
    }
    else if((cou==6 && dl==0)||(cou==8 && dl==1)){
        
        var lone = kat.substr(cou - 1);
       if(lone=="E")
       { $("#adno").val(kat+'/');
            
       } 
       else if(lone=='/')
        { $("#adno").val(kat);
            
       }    
       else
       {$("#adno").val(''); }
        
    }
    else
    { kat =kat.toUpperCase();}
    
}

function cutter(usernamew,par=null){
    var cut=$('#'+usernamew).val();
            if(par=="an"){cut=cut.replace(/[^a-zA-Z0-9]/g, '');}
            else if(par=="a"){cut=cut.replace(/[^a-zA-Z]/g, '');}
            else {cut=cut.replace(/[^0-9]/g, '');}
            
            $('#'+usernamew).val(cut);
            
    
};

function adno_getform(){
    var tempori=$("#adno").val();
    if(tempori!==""){
              var bardata = tempori.split('/',3);
              // console.log("year-"+bardata[0]);
              //console.log("branch-"+bardata[1]);
              //console.log("rollno-"+bardata[2]);
/* checker */
var er=[];
var temp1=bardata[0];
var temp2=bardata[1];
var temp3=bardata[2];

if(temp1=="14"||temp1=="15"||temp1=="16"||temp1=="17"){er[0]=1;}
else {er[0]=0;}
//console.log(er[0]);
if(temp2.substr(0,2)=="DL"){
    temp2=temp2.substr(2);
}else{
    //do nothing
}
if(temp2=="IT"||temp2=="CSE"||temp2=="EC"||temp2=="EE"||temp2=="CE"||temp2=="IC"||temp2=="EEE"||temp2=="ME"){er[1]=1;}
else {er[1]=0;}
//console.log(er[1]);

if(temp3!=0 && temp3<250 ){er[2]=1;}
else {er[2]=0;}
//console.log(er[2]);
/*checker ends*/
if(bardata[2] && bardata[0] && bardata[1] && er[0] && er[1] && er[2]){

             if((bardata[2].length==3||bardata[2].length==2) && bardata[0].length==2 && bardata[1].length<=5 ){
             
             /*correct*/
            //console.log("chalaaaaaa kyaaaa");
         
                  $("#headody").remove(); 
                 $('#signModal').modal('show'); 
                 $("#result").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
                          $.ajax({
         type:"get",
   url:"signupprompt_ajax.php",
   
   data: {yr:bardata[0] , br:bardata[1],rl:bardata[2],roll_no:null},
   success: function( data ) {
   $( "#result" ).html(data);
   },
   
   cache: false
})
                

                }
             else {
               
             /* wrong*/
             $("#container").html("<h2 class='text-info' style='text-align:center;'><i class='fa fa-refresh fa-3x' aria-hidden='true'></i> try again</h2>");    
             
                   

                    }
              }
            else{
            
             /* wrong*/
              $("#container1").html("<h2 class='text-info' style='text-align:center;'><i class='fa fa-refresh fa-2x' aria-hidden='true'></i> try again</h2>");    
             
                  }
/* checker end*/
    
}}


    


function sec_key_getform(){
    var temporia=$("#seckey").val();
    if(temporia!==""){
             
             

if(temporia.length==12){

             
             
             /*correct*/
            //console.log("chalaaaaaa kyaaaa");
         
                  $("#headody").remove(); 
                 $('#signModal').modal('show'); 
                 $("#result").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
                          $.ajax({
         type:"get",
   url:"signupprompt_t_ajax.php",
   
   data: {sec_key:temporia},
   success: function( data ) {
   $( "#result" ).html(data);
   },
   
   cache: false
})
                

              }
            else{
            
             /* wrong*/
              $("#container2").html("<h2 class='text-info' style='text-align:center;'><i class='fa fa-refresh fa-2x' aria-hidden='true'></i> try again</h2>");    
             
                  }
/* checker end*/
    
}}


function rollno_getform(){
    var temporia=$("#roll_no_s").val();
    if(temporia!==""){
             
             

if(temporia.length==10){

             
             
             /*correct*/
            //console.log("chalaaaaaa kyaaaa");
         
                  $("#headody").remove(); 
                 $('#signModal').modal('show'); 
                 $("#result").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
                          $.ajax({
         type:"get",
   url:"signupprompt_ajax.php",
   
   data: {yr:null,br:null,rl:null,roll_no:temporia},
   success: function( data ) {
   $( "#result" ).html(data);
   },
   
   cache: false
})
                

              }
            else{
            
             /* wrong*/
              $("#container3").html("<h2 class='text-info' style='text-align:center;'><i class='fa fa-refresh fa-2x' aria-hidden='true'></i> try again</h2>");    
             
                  }
/* checker end*/
    
}}

    function major(stream,ur,div){
ur=ur+".php";
var str=stream;
$.ajax({
         type:"get",
   url:ur,
     
   data: {str:str},
   success: function( data ) {
   $("#"+div ).html(data);
   },
   
   cache: false
})


};





    function validate(name,val){
       // console.log("--"+name+"--"+val+"--");
		var error="error";
		 if(name=="user"){name="username";
                val = val.replace(/[^a-zA-Z0-9]/g, ''); }
		var id=name+error;
if(val==''){$('#' + id ).html("<span class='pull-right'>required </span>");}
else{		
	 
	if(name=="phone"){
	if(val>=7000000000&&val<=9999999999)
	{ $.ajax({
         type:"post",
   url: "register_ajax.php",
      beforeSend: function() {
    $('#' + id ).html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {val:val,name:name},
   success: function( data ) {
       if(data ==1){
         $('#' + id ).html("<span class=\"pull-right\" style=\"color:green;\">correct <i class=\"fa fa-check\" aria-hidden=\"true\"></i></span>"); 
       chal['phone']=0;
       }else if(data==0){
          $('#' + id ).html("Sorry! already exist"); 
       chal['phone']=1;}
   else{  $('#' + id ).html("<span class='pull-right'>invalid </span>"); 
       chal['phone']=1;}
   
      
   },
   async:true,
   cache: false
})
    }
		
		else{
		$('#' + id ).html("<span class='pull-right'>invalid </span>");
		chal['phone']=1;
		}
	
	}
    
    else if(name=="email"){
    
    if(validateEmail(val)){
       $.ajax({
         type:"post",
   url: "register_ajax.php",
     beforeSend: function() {
    $('#' + id ).html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  }, 
   data: {val:val,name:name},
   success: function( data ) {
       if(data ==1){
         $('#' + id ).html("<span class=\"pull-right\" style=\"color:green;\">correct <i class=\"fa fa-check\" aria-hidden=\"true\"></i></span>"); 
       chal['email']=0;
       }else if(data==0){
          $('#' + id ).html("Sorry! already exist"); 
       chal['email']=1;}
   else{ $('#' + id ).html("<span class='pull-right'>invalid </span>"); 
       chal['email']=1;}
   
  
   },
   async:true,
   cache: false
})   
        
    }
    else{
    
    $('#' + id ).html("<span class='pull-right'>invalid </span>");
    chal['email']=1;
    }
    
    
    }
	else{
		
   $.ajax({
         type:"post",
   url: "register_ajax.php",
     beforeSend: function() {
    $('#' + id ).html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  }, 
   data: {val:val,name:name},
   success: function( data ) {
       if(data ==1){
         $('#' + id ).html("<span class=\"pull-right\" style=\"color:green;\">correct <i class=\"fa fa-check\" aria-hidden=\"true\"></i></span>"); 
       chal['username']=0;
       }else if(data==0){
          $('#' + id ).html("Sorry! already exist"); 
      chal['username']=1; }
  else{   $('#' + id ).html("<span class='pull-right'>invalid </span>"); 
      chal['username']=1;}
   
   
   },
   async:true,
   cache: false
})
  
	}}
   };



function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function sections(mat){
    if(mat!==""){
    var gom = mat;
   
    
     $.ajax({
         type:"get",
   url: "register_val_ajax.php",
     dataType: "json", // Set the data type so jQuery can parse it for you 
   data: {val:gom},
   success: function( data ) {
       var dat="";
     while(data[1]>0){
         dat=dat + "<option value='"+ data[1] +"' >"+ data[0] + data[1] +"</option>";
         
       data[1]--;
   
         }
          $("#classpik").html(dat); 
   },
   async:true,
   cache: false
});
   

}
}

function signup_cus_val(){
    
    for (var x in chal){
        if(chal[x]==1){
            return false;
        }
       
    }
    return true;
    
}

function checkPasswordMatch() {
   
    var password = $("#pword").val();
    var confirmPassword = $("#cpword").val();
   // console.log(password.length);
 if(password.length <= 3){
   //  console.log("ye kaise chala");
     $("#error").html("**too short..").css('color', 'red');
     chal['password']=1;
     return;}
    if (password != confirmPassword)
    { $("#error").html("**not matching..").css('color', 'red');
          chal['password']=1;}
    else
    {$("#error").html("**matched").css('color', 'green');
          chal['password']=0;}
}
