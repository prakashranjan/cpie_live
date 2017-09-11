<?php 

include_once"connection.php";

    //Start session
    session_start();
$session=session_id();
if($session){
$sql4="DELETE FROM user_online WHERE session='$session'";
$result4=mysql_query($sql4);
    unset($session);
}
    //Unset the variables stored in session
    unset($_SESSION['SESS_MEMBER_ID']);
    unset($_SESSION['SESS_FIRST_NAME']);
    unset($_SESSION['SESS_LAST_NAME']);
    unset($_SESSION['SESS_PICTURE']);
    unset($_SESSION['SESS_USERNAME']);
    unset($_SESSION['SESS_MODE']);
    unset($_SESSION['SESS_SECTION']);
    unset($_SESSION['SESS_COURSE']);
    unset($_SESSION['SESS_GENDER']);


    
    









?>