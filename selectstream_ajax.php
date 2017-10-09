<?php
/*include_once"connection.php";
$str=$_GET['str'];
if($str!=""){
$sql=mysql_query("select major,stream_id from stream where stream='$str' ORDER BY major");
echo' <label>Major</label><select class="selectpicker form-control " name="major" required>';
while($run=mysql_fetch_row($sql))
{$run[0]= preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $run[0]);
echo'<option value="'.$run[1].'">'.$run[0].'</option>';

}

echo'</select>';
}
else
{}
*/

?>