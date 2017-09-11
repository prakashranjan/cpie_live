<?php
 include("connection.php");
 require_once('auth_signup.php');
 
 $val=addslashes($_GET['val']);
$arr = array();

if($val!=""){

$sql="SELECT branch_short,tot_sections FROM branch WHERE branch_id='$val'";
				$tnme=mysql_query($sql);
				$ro = mysql_fetch_row($tnme);
                    		if($ro){
$arr[0] = $ro[0];
$arr[1] = $ro[1];


echo json_encode($arr);
				
                                }
                                else{
                                    //nothing
                                }
}



?>
