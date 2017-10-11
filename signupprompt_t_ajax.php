<?php
  include("connection.php");
   include("vcommon.php");
  

		session_start();
	
	

 // echo "<br>-----1--------".$_GET['sec_key']."---------------------<br>";
  if($_GET['sec_key']=="" || strlen($_GET['sec_key'])!=12){
    echo "<h4 style='text-align:center;'> invalid secret key</h4>";
    exit();
}
$sec_key= cleankar($_GET['sec_key']);
//echo "<br>------2-------".$sec_key."---------------------<br>";




 $er=array();
 



if($sec_key!=""){
    
    $sql= "select key_data from teacher_key where key_data='$sec_key' and valid=1";
    $data1= mysql_query ($sql);
    if(mysql_num_rows($data1))
    { 
        $res=mysql_fetch_row($data1);
           if($res[0]){
            echo"<h4 style='text-align:center;' class='text-success'><i class='fa fa-2x fa-smile-o' aria-hidden='true'></i>Access Granted</h4>";
            $_SESSION['GIFTY_SEC_KEY'] = $sec_key;
          //  echo "<br>----".$_SESSION['GIFTY_SEC_KEY']."--------<br>";
          
            showsign();
        }
        else{
            
        echo "<h4 style='text-align:center;'> invalid secret key</h4>";}
   
        
        
    }else{
       echo "<h4 style='text-align:center;'> invalid secret key</h4>";}
   
    

}
else{
       echo "<h4 style='text-align:center;'> invalid secret key</h4>";}




function showsign(){
   

echo '<script src="https://www.google.com/recaptcha/api.js"></script>
    
    
<script>
var errory= new Array();
$("#signupform").submit(function (event) {
//console.log("capthca wala chala");
 event.preventDefault();
// submit the form which now includes a g-recaptcha-response input
  //add custom validations...
  var allWell=signup_cus_val();
  
  if(allWell==true){
  //console.log("1 validation");
    grecaptcha.reset();
    grecaptcha.execute();    }
        else{return;}
   
    
  });

function formSubmit() {
//console.log("submit wala chala");
  // submit the form which now includes a g-recaptcha-response input
  //add custom validations...
  var allWell2=signup_cus_val();
  if(allWell2==true){
  //console.log("2 validation");
        document.getElementById("signupform").submit();
        $("#signMeUp").hide();}
        else{return;}
    }
</script>
    <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Sign Up</h2>
                    <hr class="star-primary">
                    <span class="text-muted" style="text-align:center;"> *** Please give correct details .Its just a Beta.please support</span>
                </div>
                
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form  role="form" id="signupform" name="signupform" method="POST" action="signmeup_t.php"  >
                    
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> First Name </label>
                                <input class="form-control"  type="text" name="first_name" pattern=".{2,}" onkeyup="cutter(this.id,\'a\');" id="first_name" maxlength="15" title="be honest" placeholder=" First Name" required data-validation-required-message="Please enter your first name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Last Name </label>
                                <input class="form-control" type="text" name="last_name" id="last_name" maxlength="15"  pattern=".{2,}" onkeyup="cutter(this.id,\'a\');" title="be honest" placeholder=" Last Name" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                 <label> Email(Gmail) </label>
                                <input type="email" class="form-control"  name="email" id="email" onchange="validate(this.name,this.value);" placeholder="Email Address"  required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger" id="emailerror"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" pattern="[0-9]{10}" class="form-control"  maxlength="10" name="phone" id="phone"onchange="validate(this.name,this.value);" onkeyup="cutter(this.id);" placeholder="Phone Number"  required data-validation-required-message="Please enter your phone number.">
                                <p  id="phoneerror" class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group " style="text-align:center;">
                            <div class="form-group col-xs-6  controls">
                            <label class="btn "><input class="form-control " value="female"type="radio" name="sex"required placeholder="female"  ><i class="fa fa-female" aria-hidden="true"></i> female</label>
                            </div>
                            <div class="form-group col-xs-6  controls">
                            <label class="btn "><input class="form-control " value="male"type="radio" name="sex"required placeholder=" male "><i class="fa fa-male" aria-hidden="true"></i> male</label>
                            </div>
                        </div>
                          
                           <br>

                         <div class="row control-group">
                            <div class="form-group col-xs-12 label-form-group controls">
                                <label> Date of Birth </label>
                                <input type="date" class="form-control" name="dob" id="dob" placeholder="Date of Birth dd/mm/yyyy" max="2003-01-01"  required data-validation-required-message="Please select your DOB">
                               
                                <p id=""class="help-block text-danger"></p>
                            </div>
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> User Name </label>
                                <input class="form-control" type="text" name="user" id="user" maxlength="20" pattern=".{3,}" onchange="validate(this.name,this.value);" onkeyup="cutter(this.id,\'an\');" placeholder="Username" required data-validation-required-message="Please enter your username name.">
                                <p id="usernameerror"class="help-block text-danger"></p>
                            </div>
                        </div>

                         <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Password </label>
                                <input class="form-control" type="password" name="password" id="pword" onchange=""maxlength="20" pattern=".{4,}" placeholder="Password" required data-validation-required-message="Please enter your password ">
                                <p id=""class="help-block text-danger"></p>
                            </div>
                        </div>
                         <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Confirm Password </label>
                                <input class="form-control" type="password" name="cpassword" id="cpword"  pattern=".{4,}" onkeyup="checkPasswordMatch();" maxlength="20" placeholder="Confirm Password" required data-validation-required-message="Please confirm password">
                                <p id="error"class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                         
                        <br>
                        <div id="success"></div>
                         
                        <div class="row">
                            
                            <div class="form-group col-xs-12" style="text-align:center;">
                          <div class="g-recaptcha" 
       data-sitekey="6Le-czEUAAAAADXsIx2IhkZm3D-dW8x5FfQ5-ki3"
       data-size="invisible"
       data-callback="formSubmit">
  </div>
                                <button class=" btn btn-lg btn-success " id="signMeUp" type="submit">
    Sign me Up
</button>

                            </div>
                        </div>
                        <br><br>
                    </form>
                </div>
</div>';

}

?>

