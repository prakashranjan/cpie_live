  <?php
 include("connection.php");
 require_once('auth_signup.php');
 $val=addslashes($_POST['val']);
$name=addslashes($_POST['name']);
if($name=="phone" || $name=="username" || $name=="email"){
if($name=="phone"){ $name="mobile";}
if($name=="username"){
    $val=  strtolower($val);

   $val= preg_replace('/[^A-Za-z0-9\-\']/', '', $val);

   
}
if($name=="username"&& ($val=="admin" || $val=="administrator")){

echo "0";
exit();
}

else{
$sql="SELECT $name FROM member WHERE $name='$val'";
				$tnme=mysql_query($sql);
				if($ro = mysql_fetch_row($tnme))
				{echo "0";}
else{
echo "1";
}
				

}
}


?>