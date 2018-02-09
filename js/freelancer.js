/*!
 * Start Bootstrap - Freelancer Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('body').on('click', '.page-scroll a', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Floating label headings for the contact form
$(function() {
    $("body").on("input propertychange", ".floating-label-form-group", function(e) {
        $(this).toggleClass("floating-label-form-group-with-value", !! $(e.target).val());
    }).on("focus", ".floating-label-form-group", function() {
        $(this).addClass("floating-label-form-group-with-focus");
    }).on("blur", ".floating-label-form-group", function() {
        $(this).removeClass("floating-label-form-group-with-focus");
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});


function psendmail(){
    if($("#epuinput").val()!==""){
  var prtoken=grecaptcha.getResponse();
  
  //console.log(prtoken);
  if(prtoken){
 
 $.ajax({
         type:"get",
   url: "fndaccnt.php",
   beforeSend: function() {
    $('#fndaccnt').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {epuinput:$("#epuinput").val(),prcaptcha:prtoken},
   success: function( data ) {
   $( "#fndaccnt" ).html(data);
   
   }
  
})
}
    }


}



function verotp(){
    if($("#otpinput").val()!=="" && $("#otpinput").val().length===6 && tark===0){
  
 $.ajax({
         type:"post",
   url: "verotp.php",
   beforeSend: function() {
    $('#otpfinal').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },

   data: {otpinput:$("#otpinput").val(),otpcpword:$("#otpcpword").val()},
   success: function( data ) {
   $( "#otpfinal" ).html(data);
   
   }
  
})
    }


}

var tark= 1;

function otpcheckPasswordMatch() {
   
    var otppassword = $("#otppword").val();
    var otpconfirmPassword = $("#otpcpword").val();
   // console.log(password.length);
 if(otppassword.length <= 3){
   //  console.log("ye kaise chala");
     $("#otperror").html("**too short..").css('color', 'red');
     tark=1;
     return;}
    if (otppassword != otpconfirmPassword)
    { $("#otperror").html("**not matching..").css('color', 'red');
          tark=1;}
    else
    {$("#otperror").html("**matched").css('color', 'green');
          tark=0;}
}
