<?php

 
	//Include database connection details
	require_once('connection.php');
        //Start session
	session_start();
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['SESS_MEMBER_ID']) || (trim($_SESSION['SESS_MEMBER_ID']) == '')) {
	
	}
   else
   {   header("location: home");
		exit();   }

                if(!isset($_SESSION['OTPUSER'])){
                    
                }else{
                    exit();
                }
 
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
	$otpinput = clean($_POST['otpinput']);
        $otpcpword = clean($_POST['otpcpword']);
       
//	echo $otpcpword."<br>";
  //      echo $otpinput."<br>";
   //     echo $_SESSION['OTPUSER']."<br>";
        $otpuser=$_SESSION['OTPUSER'];
        $otpcontent=  explode('@', $otpuser);
     //   echo $otpcontent[0]."<br>";
      //  echo $otpcontent[1]."<br>";
	//Input Validations
	if($otpinput == '') {
		$errmsg_arr[] = 'otp missing';
		$errflag = true;
	}
        if($otpcpword == '') {
		$errmsg_arr[] = 'pword missing';
		$errflag = true;
	}
        if($otpuser == '') {
		$errmsg_arr[] = 'Username missing';
		$errflag = true;
	}
        
        
 
	//If there are input validations, redirect back to the login form
	if($errflag) {
		
		exit();
	}
        
 
	//Create query
	$qry="SELECT passre_id,mem_id FROM passreset WHERE passre_id='$otpcontent[1]' AND otp='$otpinput' and expire > DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
	$result=mysql_query($qry);
     if(mysql_num_rows($result)==1){
        $run2=  mysql_fetch_row($result);
//change password ... 
$chpass=  mysql_query("update member set password='$otpcpword' where mem_id='$run2[1]'");
        
//delete passreset record
         $delpassre=mysql_query("delete from passreset where passre_id='$run2[0]'");
         //show kardo
          unset($_SESSION['OTPUSER']);
           echo'<script> $("#passwall").html(\'<p class="help-block text-success"><i class="fa fa-5x fa-thumbs-up" aria-hidden="true"></i> <br><br> Your password has been reset successfully! <br> Now Login with your new Password. </p>\');  </script>';     
      
     }
     else{ echo'<p class="help-block text-danger"> &nbsp;<i class="fa fa-2x fa-frown-o" aria-hidden="true"></i> Something went wrong </p>';}
