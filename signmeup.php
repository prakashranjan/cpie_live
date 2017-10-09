<?php
 include("connection.php");
 require_once('auth_signup.php');
 include("vcommon.php");
  
    
    

 function NewUser() 
 { //echo'<h4><strong>Hey!</strong>newuser starts</h4><br>';
     $dpic=null;
     $firstname = addslashes($_POST['first_name']); 
    // echo'<h4><strong>Hey!</strong>'.$firstname.'</h4><br>';
  $firstname = strtoupper($firstname);
 $lastname=addslashes($_POST['last_name']);
 //echo'<h4><strong>Hey!</strong>'.$lastname.'</h4><br>';
 $lastname = strtoupper($lastname);
 $email = addslashes($_POST['email']);
 //echo'<h4><strong>Hey!</strong>'.$email.'@@@</h4><br>';
 //email check code-------
 //--------------code over
 $userName = addslashes($_POST['user']);
 //echo'<h4><strong>Hey!</strong>'.$userName.'</h4><br>';
 $userName=  strtolower($userName);
 $userName= preg_replace('/[^A-Za-z0-9\-\']/', '', $userName);
 $phone = addslashes($_POST['phone']);
 //phone check code
 //-------------code over
 
 $password = addslashes($_POST['password']);
 $gender=addslashes($_POST['sex']);
 //echo'<h4><strong>Hey!</strong>'.$gender.'</h4><br>';
 if($gender=="male"){$dpic="images/ppicdefm.jpg";
 //echo'<h4><strong>Hey!</strong>gender1</h4><br>';
 }
 else if($gender=="female"){$dpic="images/ppicdeff.jpg";
 //echo'<h4><strong>Hey!</strong>gender2</h4><br>';
 }
 else{ 
   //  echo'<h4><strong>Hey!</strong>gender nahi</h4><br>';
     exit();}
 
  
 $dob=addslashes($_POST['dob']);
  
  
   $course=1;
    $branch=addslashes($_POST['branch']);
     $year=addslashes($_POST['year']);
      $section=addslashes($_POST['section']);
      
      
       $ad_no_bar=$_SESSION['GIFTY'];
       $ad_no=$ad_no_bar;
  //for branch code to branch_short
       $mql99=mysql_query("select branch_short from branch where branch_id='$branch' and course_id=1");
     //  echo'<h4><strong>Hey!</strong>check branch</h4><br>';
      
       if(mysql_num_rows($mql99)==1){
            $runmql99=mysql_fetch_row($mql99);
       //    echo'<h4><strong>Hey!</strong>branch check in</h4><br>';
           $branch_sh=$runmql99[0];
       }
       else{
         //  echo'<h4><strong>Hey!</strong>branch exit hua</h4><br>';
           exit();}
       
       
  //for section id  ,year , branch
       $section_name=$branch_sh."_".$section."_YR".$year;
       
       //echo'<h4><strong>Hey!</strong>section query hoga</h4><br>';
       $mql=mysql_query("select section_id,course_id,branch_id,year from section where category='$section_name' and course_id=1");
      
       if(mysql_num_rows($mql)==1){
           //echo'<h4><strong>Hey!</strong>section query hua</h4><br>';
       $runmql=mysql_fetch_row($mql);     
         // echo'<h4><strong>Hey!</strong>section query hua end</h4><br>';
    $mod_idw=1;
          
 $data=mysql_query("INSERT INTO member (fname,lname,username,email,picture,thumbnail,password,gender,mobile,dob,mode_id) VALUES ('$firstname','$lastname','$userName','$email','$dpic','$dpic','$password','$gender','$phone','$dob','$mod_idw')"); 
  
 if($data){
      //echo'<h4><strong>Hey!</strong>insert query hua end</h4><br>';
     $mem_id=  mysql_insert_id();
     
     if($mem_id!=""){
         //for students...
        // at present only btech..........
         $data2 =mysql_query("INSERT INTO stud_member (mem_id,course_id,branch_id,year,section_id,ad_no) VALUES ('$mem_id','$runmql[1]','$runmql[2]','$runmql[3]','$runmql[0]','$ad_no')"); 
 
         
     }
 }else{
    // echo'<h4><strong>Hey!</strong>insert query nhi chala</h4><br>';
     
 }
 
 
 if($data && $data2) { if(mkdir("user_files/$userName",0760)){
   //  echo "chal gya mkdir";
     
 }
 else {
    // echo "nhi chala mkdir";
     
 }
 $sql=  mysql_query("update barcode_sign set form_fill=1 where full_cid='$ad_no'");
 $sql09=  mysql_query("update section set stud_count=stud_count+1 where section_id='$runmql[0]'");
 $sql091=  mysql_query("update branch set branch_count=branch_count+1 where branch_id='$runmql[2]'");
 $sql092=  mysql_query("update course set course_count=course_count+1 where course_id='$runmql[1]'");
 // for defaults........
 $sql1998=mysql_query("insert into priority_log (mem_id) values ('$mem_id')");
 
 echo'<h4><strong>Hey!</strong> now login with your username and password...</h4><br>'; 
 
 session_abort();
 }
 else{
     //echo'<h4><strong>Hey!</strong>no data and data2------------</h4><br>';
 }
 
 }
else{
    echo'<h4><strong>Hey!</strong> please give correct details</h4><br>';
    
    
} }
 
 
 function SignUp() { 
     //checking the 'user' name which is from Sign-Up.html, is it empty or have some text 
 // unique username ,phone ,college id,email
     //echo "<h4><strong>Hey!</strong> shuru to hua</h4><br>";
     
     if($_POST['first_name']=="" ||$_POST['password']=="" || $_POST['sex']=="" || $_POST['year']=="" ||$_POST['branch']=="" || $_POST['section']=="" )
         {echo '<h4><strong>Warning!</strong> please give correct details.</h4><br>';
     exit();}
     
     if(!empty($_POST['user'])|| !empty($_POST['phone'])|| !empty($_SESSION['GIFTY'])|| !empty($_POST['email'])) 
     { //echo'<h4><strong>Hey!</strong>1st step cross</h4><br>';
         $userlame = addslashes($_POST['user']);
     $phonew = addslashes($_POST['phone']);
     $emailw = addslashes($_POST['email']);
     $giftyw = $_SESSION['GIFTY'];
 $userlame=  strtolower($userlame);
 $userlame= preg_replace('/[^A-Za-z0-9\']/','', $userlame);
 //echo'<h4><strong>Hey!</strong>1st step cross 1.5</h4><br>';
     $query = mysql_query("SELECT username FROM member WHERE username = '$userlame'");
   //  echo'<h4><strong>Hey!</strong>1st step cross2.1</h4><br>';
      $query2= mysql_query("SELECT mobile FROM member WHERE mobile = '$phonew'");
     // echo'<h4><strong>Hey!</strong>1st step cross2.2</h4><br>';
       $query3 = mysql_query("SELECT ad_no FROM stud_member WHERE ad_no = '$giftyw'"); 
     //echo'<h4><strong>Hey!</strong>1st step cross2.3</h4><br>';
       $query4 = mysql_query("SELECT email FROM member WHERE email = '$emailw'");
      //echo'<h4><strong>Hey!</strong>1st step cross2.4</h4><br>';
     if((mysql_num_rows($query)==0) && (mysql_num_rows($query2)==0) && (mysql_num_rows($query3)==0) && (mysql_num_rows($query4)==0)) {
        // echo'<h4><strong>Hey!</strong>2nd step cross</h4><br>';
         newuser();
       //  echo'<h4><strong>Hey!</strong>newuser to chala</h4><br>';
     } 
     else { echo '<h4><strong>Hey!</strong> you are already registered.</h4><br>'; 
     }

     }
else{
    echo '<h4><strong>Warning!</strong> please give correct details.</h4><br>';}
 } 
   
?>

<html>
<head>
<script type="text/javascript">

function delayer(){
    window.location = "index";
}

</script>
</head>
<body onLoad="setTimeout('delayer()', 3000)">
    <?php
    function post_captcha($user_response) {
        $fields_string = '';
        $fields = array(
            'secret' => '6Le-czEUAAAAAL9lf5PcH4GCnIIX88GaGX1uR_S0',
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
    $res = post_captcha($_POST['g-recaptcha-response']);

  /*  if (!$res['success']) {
        // What happens when the reCAPTCHA is not properly set up
     //   echo 'reCAPTCHA error: Check to make sure your keys match the registered domain and are in the correct locations. You may also want to doublecheck your code for typos or syntax errors.';
    
        echo "<h2>sorry something went wrong....try again</h2>";
    } else {
        // If CAPTCHA is successful...

        // Paste mail function or whatever else you want to happen here!
      //  echo '<br><p>CAPTCHA was completed successfully!</p><br>';
    }*/
    if (!$res['success']){echo "<h2>sorry something went wrong....try again </h2>";}
    else
     { 
       // echo $_POST['g-recaptcha-response']."<br>";
     
        
         //     $masking=mysql_query("SELECT @@sql_mode;");
         // $runmask=mysql_fetch_row($masking);
          //echo $runmask[0]."<br>";
          
         // $masking2=mysql_query("SELECT @@GLOBAL.sql_mode;");
          //$runmask2=mysql_fetch_row($masking2);
          //echo $runmask2[0]."<br>";
        
        
        if($_SESSION['GIFTY']){
         //echo'<h4><strong>Hey!</strong>0th step cross</h4><br>';
     SignUp();
     //echo'<h4><strong>Hey!</strong>i think all done</h4><br>';
     }
     else{
         echo'<h2><strong>Sorry!</strong> something went wrong...</h2><br>';
     }
     }
        
      
    
     ?>
<h2>Prepare to be redirected!</h2>


</body>
</html>