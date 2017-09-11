  <?php
require_once('auth.php');
 include("connection.php");	
 $usern=$_SESSION['SESS_USERNAME'];
 $val=$_POST['val'];
 $val=trim($val);
$name=$_POST['name'];
$uid=$_POST['uid'];

$sql="UPDATE member SET $name='$val' WHERE username='$usern'";
				$tnme=mysql_query($sql);
				

echo $val;
/*
if($name="status"){
$hint="changestatus";
$tidu=NULL;
 $qry456="INSERT INTO notification (worker,channel_id,hint,uid) VALUES ('$usern','$tidu','$hint','$uid')";
                $result456=mysql_query($qry456);


}
*/
?>