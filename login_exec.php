<?php
	//Start session
	session_start();
 
	//Include database connection details
	require_once('connection.php');
 
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
	$username = clean($_POST['username']);
	$password = clean($_POST['password']);
 
	//Input Validations
	if($username == '') {
		$errmsg_arr[] = 'Username missing';
		$errflag = true;
	}
	if($password == '') {
		$errmsg_arr[] = 'Password missing';
		$errflag = true;
	}
 
	//If there are input validations, redirect back to the login form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: index");
		exit();
	}
        if(preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/", $username)){
            //echo "email";
           $firstid="email";
          
            
        }else if(strlen($username)==10 && preg_match('/^[1-9][0-9]*$/', $username)){
            //echo"phone";
            $firstid="mobile";
            
        }
        else{
            //echo"username";
            $firstid="username";
            
        }
 
	//Create query
	$qry="SELECT mem_id,fname,lname,gender,picture,username,mode_id FROM member WHERE $firstid='$username' AND password='$password'";
	$result=mysql_query($qry);
 
	//Check whether the query was successful or not
	if($result) {
		if(mysql_num_rows($result) > 0) {
			//Login Successful
			session_regenerate_id();
			$session=session_id();
			$time=time();
			$member = mysql_fetch_assoc($result);
		
			$_SESSION['SESS_MEMBER_ID'] = $member['mem_id'];
			$_SESSION['SESS_FIRST_NAME'] = $member['fname'];
			$_SESSION['SESS_LAST_NAME'] = $member['lname'];
			$_SESSION['SESS_GENDER'] = $member['gender'];
			$_SESSION['SESS_PICTURE'] = $member['picture'];
			$_SESSION['SESS_USERNAME'] = $member['username'];
                        $_SESSION['SESS_MODE'] = $member['mode_id'];
                     // checking student and marking student specialities to session
                        if($member['mode_id']==1){
                            $mem_id=$member['mem_id'];
                            $qry="SELECT course_id,branch_id,year,section_id FROM stud_member WHERE mem_id='$mem_id'";
	$result=mysql_query($qry);
 
	//Check whether the query was successful or not
	if($result) { $stud_member = mysql_fetch_assoc($result);
                        $_SESSION['SESS_SECTION'] = $stud_member['section_id'];
                        $_SESSION['SESS_COURSE'] = $stud_member['course_id'];
                        $_SESSION['SESS_YEAR'] = $stud_member['year'];
                        $_SESSION['SESS_BRANCH'] = $stud_member['branch_id'];
                        
        }}
                        else if($member['mode_id']==2){
                            // do nothing
                        }
			$_SESSION['SESS_CDATA'] =0;
			session_write_close();
			$member_id=$_SESSION['SESS_MEMBER_ID'];
			
			$sql1="INSERT INTO user_online (session,time,mem_id) VALUES ('$session','$time','$member_id')";
                        
$result1=mysql_query($sql1);


$sql1="INSERT INTO channel_user_online (session,time,mem_id) VALUES ('$session','$time','$member_id')";
$result1=mysql_query($sql1);
			header("location: home");
			exit();
		}else {
			//Login failed
			$errmsg_arr[] = 'Access Denied';
			$errflag = true;
			if($errflag) {
				$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
				session_write_close();
				header("location: index");
				exit();
			}
		}
	}else {
		die("Query failed");
	}
?>