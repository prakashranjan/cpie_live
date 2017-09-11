<?php
include_once"connection.php";
$str=$_GET['str'];
if($str!=""){
$sql=mysql_query("select college,college_id from college where univ='$str' ORDER BY college");
echo' <label>College</label><select class="selectpicker form-control " name="college" required>';
while($run=mysql_fetch_row($sql))
{$run[0]=trim($run[0]);
	$run[0]= preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $run[0]);
echo'<option value="'.$run[1].'">'.$run[0].'</option>';

}

echo'</select>';
}
else
{}


?>