
 <?php
 require_once('auth.php');
include("connection.php");

 if($_SESSION['SESS_MODE']==2){
$cour_id=addslashes($_GET['cour']);

 $kqry="SELECT course_short FROM course where course_id='$cour_id' ";


               $kresult=mysql_query($kqry);
               $jrow=mysql_fetch_row($kresult);
               
  
  echo'<div class="panel " style="border-color:#8784ff;opacity:0.9;">
      <b><ul class="nav nav-pills text-center"style="background-color:#8784ff;width:100%;" ><li class="pull-right "style="border-radius:0px;"><a style="color:#35c3ab;background-color:#2c3e50;"><i class="fa fa-book" aria-hidden="true"></i> '.$jrow[0].'</a></li> </ul></b>
       
    </div>
<div class="row"><p style="line-height: 70%;">';

                 $kqry="SELECT branch_id,branch_short,branch_full FROM branch where course_id='$cour_id' ORDER BY views DESC";


               $kresult=mysql_query($kqry);
			$mang=0;	
                while($krow = mysql_fetch_row($kresult))
                {$n = rand(15,40)/10;
			echo'<a id="bran'.$krow[0].'" href="#"  title="'.$krow[2].'" onclick="branch_match(this.id)" class=" btn btn-link text-success magic" style="background-color:rgba(44,62,80,0.7); border-radius:0.5em;font-size:'.$n.'em;  ">'.$krow[1].'</a>&nbsp;&nbsp;';   
                      $mang++;  }
                      if($mang==0){echo'<img height="15%" width="15%"src="images/sorry.png"></img><br /><h2> Sorry! No branches </h2>';}

echo'</p>
</br>';
//<img src="images/floral-finish.png" width="50%"></img>

			   
/*if(!$krow[0]&& $y==-1) 
{echo"<script>  $('#loadmore').hide(); </script>";}*/
            
 }	
 ?>

