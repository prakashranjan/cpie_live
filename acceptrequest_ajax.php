<?php
/* require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
$follow_idACC=$_GET['follow_idACC'];


$kqry="Update follow SET status=1 WHERE follow_id='$follow_idACC'";
 $mqry=mysql_query($kqry);
 
$kqry2="Update member SET followers=followers+1 WHERE username='$usern'";
 $mqry2=mysql_query($kqry2);

$kqry4="SELECT user1 FROM follow WHERE follow_id='$follow_idACC'";
 $mqry4=mysql_query($kqry4);
 $jqry4=mysql_fetch_row($mqry4);

$kqry3="Update member SET follow=follow+1 WHERE username='$jqry4[0]'";
 $mqry3=mysql_query($kqry3);
*/

?>
 