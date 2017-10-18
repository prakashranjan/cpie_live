

 $(document).ready(function () {
  //your code here
 
             });

var side=1;

function displayNotification(title,content,pkey) {
  if (Notification.permission === 'granted') {  
    navigator.serviceWorker.getRegistration()
    .then(function(reg){
       
       var options = {
   body: content,
   icon: 'images/ic_launcher/res/mipmap-xhdpi/ic_launcher.png',
   vibrate: [100, 50, 100],
   data: { primaryKey: pkey } // allows us to identify notification
 };
 reg.showNotification(title, options);

     
    });
  }
}

function sidehide(){
if(side==1){$('#sidebar').hide();
$("#main").removeClass("column col-sm-10 ");
   $("#main").addClass("column col-sm-12 ");
   $(".sizehand").removeClass(" col-lg-3 ");
   $(".sizehand").addClass(" col-lg-2 ");
   $("#sideh").html("<i class='fa fa-chevron-circle-right fa-2x text-primary' style='padding-top:12px;padding-left:5px;' aria-hidden='true'></i>");
   side=2;

} 
else
{$('#sidebar').show();
$("#main").removeClass("column col-sm-12 ");
   $("#main").addClass("column col-sm-10 ");
   $(".sizehand").addClass(" col-lg-3 ");
   $(".sizehand").removeClass(" col-lg-2 ");
   $("#sideh").html("<i class='fa fa-chevron-circle-left fa-2x text-primary' style='padding-top:12px;padding-left:5px;' aria-hidden='true'></i>");
side=1;}
};

function openNav() {
    if($("#sidebar").length == 0) {
  //it doesn't exist do nothing
}
else{
    $("#sideclone").html($("#sidebar").html());}
    document.getElementById("mySidenav").style.width = "100%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

var older=0;




function saaf(){
  
document.getElementById("cap").value = "";  
$('#respo').empty();
}; 




function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
  alert("->> Email id  has been copied!\n\
         1. Click on new conversation.\n\
         2. Paste the email id in the search box.");
}
	




