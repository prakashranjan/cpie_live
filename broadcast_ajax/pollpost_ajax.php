
<?php 

require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
  include_once("broadcastpost_common.php");
   include("../vcommon.php");
  
	  $mem_id=$_SESSION['SESS_MEMBER_ID'];
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


		

$mul_cor= 0;

 


                    if(savecappoll()==1){
			echo'<div class="alert alert-success">
  <a href="#" class="close text-center" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> .
</div>';
/*
 $hint="chat";
if($anon!=1){
 $qry45="INSERT INTO notification (worker,channel_id,hint) VALUES ('$usern','$tid','$hint')";
                $result45=mysql_query($qry45);	}
 */
 
	}
else{
echo'<div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry! something went wrong. try again..</strong> .
</div>';

}	
function savecappoll()
            { $_POST  = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
    $usern=$_SESSION['SESS_USERNAME'];
            $mebateyga=3; 
    
			           $mem_id=$_SESSION['SESS_MEMBER_ID'];
			$caption=  addslashes($_POST['cap']); 
                        $all_tagy=addslashes($_POST['tagy']);
                       $catin=  addslashes($_POST['catin']);
                       $u_ids=  addslashes($_POST['u_ids']);
		$polloption=$_POST['polloption'];
                        $polloption =array_map('strip_tags', $polloption);
                        
			$anon=$_POST['anony'];
			$caption=  addslashes($_POST['cap']); 
			if((($all_tagy=="") && ($u_ids==""))||$caption=="" || $catin=="" || empty($polloption)==true){return 0;}
                        $caption=strip_tags($caption,"<img> <a> <br>");
                        $caption=trim($caption);
			$caption=carbonlink($caption);
                         $caption=trim($caption);
                        $mul_cor= 0;
                        
                        
			
				
                                if($caption!=''){
                $chala_kya=broadcastpost_common($usern,$mem_id,$caption,$all_tagy,$catin,$anon,$polloption,$mul_cor,$mebateyga,$u_ids);
                if($chala_kya==1){
                    //echo"------chal gya";
       return 1;}
   else {
       //echo "--------------------------------nhi-chalega";
       return 0;}
            }else{return 0;}


            }
			
			
		

			  
			
			?>

