 <?php
exit();

//require_once('../auth.php');
//include("../connection.php");
//for teachers only....dropdown  to choose among my classess....
if($_SESSION['SESS_MODE']==2){
 $usern=$_SESSION['SESS_USERNAME'];

$tid= addslashes($_GET['tid']);

$sql6="SELECT branch_id FROM section where section_id='$tid'";
 $query6=mysql_query($sql6);
$row6=mysql_fetch_row($query6);

 $sql="SELECT category,section_id FROM section where branch_id='$row6[0]' order by views DESC";
 $query=mysql_query($sql);
 while($row=mysql_fetch_row($query))
 {echo'<li><a  href="channel?tn='.$row[0].'"><i class="fa fa-at" ></i> '.$row[0].'</a></li>';
  }

}
else{
    // do nothing
}


?>
