<?php

 
	//Include database connection details
	require_once('connection.php');
        require ('mailhandler.php');
        //Start session
	session_start();
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['SESS_MEMBER_ID']) || (trim($_SESSION['SESS_MEMBER_ID']) == '')) {
	
	}
   else
   {   header("location: home");
		exit();   }

 
	//Array to store validation errors
	$errmsg_arr = array();
 
	//Validation error flag
	$errflag = false;
 
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($str) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysql_real_escape_string($str);
	}
 
	//Sanitize the POST values
	$epuinput = clean($_GET['epuinput']);
	
 
	//Input Validations
	if($epuinput == '') {
		$errmsg_arr[] = 'Username missing';
		$errflag = true;
	}
 
        
        function post_captcha($user_response) {
        $fields_string = '';
        $fields = array(
            'secret' => '6LfW_EMUAAAAAOnrRl6MzLPyMQ9E1b9qL0mUKsOF',
            'response' => $user_response
        );
        foreach($fields as $key=>$value)
        $fields_string .= $key . '=' . $value . '&';
        $fields_string = rtrim($fields_string, '&');

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://www.google.com/recaptcha/api/siteverify');
        curl_setopt($ch, CURLOPT_POST, count($fields));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, True);

        $result = curl_exec($ch);
        curl_close($ch);

        return json_decode($result, true);
    }

    // Call the function post_captcha
    $res = post_captcha($_GET['prcaptcha']);

  /*  if (!$res['success']) {
        // What happens when the reCAPTCHA is not properly set up
     //   echo 'reCAPTCHA error: Check to make sure your keys match the registered domain and are in the correct locations. You may also want to doublecheck your code for typos or syntax errors.';
    
        echo "<h2>sorry something went wrong....try again</h2>";
    } else {
        // If CAPTCHA is successful...

        // Paste mail function or whatever else you want to happen here!
      //  echo '<br><p>CAPTCHA was completed successfully!</p><br>';
    }*/
    if (!$res['success']){$errflag = true;}
        
        
        
        
	//If there are input validations, redirect back to the login form
	if($errflag) {
		
		
		
		exit();
	}
        if(preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/", $epuinput)){
            //echo "email";
           $firstid="email";
          
            
        }else if(strlen($epuinput)==10 && preg_match('/^[1-9][0-9]*$/', $epuinput)){
            //echo"phone";
            $firstid="mobile";
            
        }
        else{
            //echo"username";
            $firstid="username";
            
        }
 
	//Create query
	$qry="SELECT mem_id,email,username FROM member WHERE $firstid='$epuinput'";
	$result=mysql_query($qry);
     if(mysql_num_rows($result)===1){
         $run=mysql_fetch_row($result);
         //generate otp ...
           $sixotp = mt_rand(100000, 999999);
           
           //mail bhejna hai with otp..
         
if (smtpmailer($run[1], 'cpiejss@gmail.com', 'C-Pie JSSATEN', 'Password Reset', $sixotp.' is your OTP. This OTP expires in 15 minutes')) {
	//echo "email sent successfully";


 
           
         // insert into passreset with timestamp
         $queryotp=mysql_query("insert into passreset (mem_id,otp) values ('$run[0]','$sixotp')") or die();
         if($queryotp){
             
             $passre_id= mysql_insert_id();
         
          
         
 
         
         
         
         
         //next form
         $hidemail=  explode('@', $run[1]);
         
         $vatol=  strlen($hidemail[0]);
         for($vato=0;$vato<$vatol;$vato++){
             if($vato==0 || $vato==$vatol-1){}
             else{$hidemail[0][$vato]='*';}
             
         }
         
       
        // echo $sixotp."<br>";
        $_SESSION['OTPUSER']=$run[0]."@".$passre_id;
      // echo $_SESSION['OTPUSER']."<br>";
        echo'<form >
  <div class="form-group">
 
    <p class=""> Hey, <em  class="text-success" > $'.$run[2].' </em>	
an OTP has been sent to your email &nbsp;<em class="text-success"> '.$hidemail[0]."@".$hidemail[1].' </em>&nbsp;. Please enter the 6 digit OTP number</p>  
    <input type="text" size="6" maxlength="6" class="form-control text-center" id="otpinput" placeholder="Enter the OTP number">
  </div>
  
                        <div class="row control-group">
                            <div class="form-group ">
                                <label> New Password </label>
                                <input class="form-control" type="password" name="otppassword" id="otppword" onchange=""maxlength="20" pattern=".{4,}" placeholder="New Password" required data-validation-required-message="Please enter your new password ">
                                <p id=""class="help-block text-danger"></p>
                            </div>
                        </div>
                         <div class="row control-group">
                            <div class="form-group ">
                                <label> Confirm New Password </label>
                                <input class="form-control" type="password" name="otpcpassword" id="otpcpword"  pattern=".{4,}" onkeyup="otpcheckPasswordMatch();" maxlength="20" placeholder="Confirm New Password" required data-validation-required-message="Please confirm new password">
                                <p id="otperror"class="help-block text-danger"></p>
                            </div>
                        </div>  

 <div id="otpfinal"></div>
  <button type="button" onclick="verotp();" class="btn btn-success mbada"> Reset Password </button>
 
  
</form>';
        
     }else{
         
         echo"<p class='text-danger'>	
Something went wrong</p>";
         
     }
     
     }else{
         echo"<p class='text-danger'>	
Something went wrong</p>";
         
     }  
         
      
     }
     else{ echo"<p class='text-danger'>	
No Match Found</p>";}
