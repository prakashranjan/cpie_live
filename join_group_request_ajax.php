<?php
require_once('auth.php');
include("connection.php");

  $usern=$_SESSION['SESS_USERNAME'];
 $tid=$_GET['tid'];
 
 $kqry="SELECT category FROM topic WHERE topic_id='$tid'";
 $mqry=mysql_query($kqry);
 $jqry=mysql_fetch_row($mqry);
 
 
 
 
$qry89="INSERT INTO private_member (username,category,allow) VALUES ('$usern','$jqry[0]',0)";
$result89=mysql_query($qry89) or die;
if($result89){
        echo'<button type="button"  class="btn btn-danger disabled btn-lg"><i class="glyphicon glyphicon-hand-up" ></i> Request sent</button>';
}
else{
     echo'<button type="button" id="join_group_request" onclick="join_group_request();" class="btn btn-info btn-lg"><i class="glyphicon glyphicon-hand-up"></i> Request to join</button>';
}