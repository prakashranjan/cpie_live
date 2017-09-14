<?php
 require_once('auth.php');
include("connection.php");
include("commonfun.php");
$memid=$_SESSION['SESS_MEMBER_ID'];
 
$term=$_GET['term'];
if($term!=""){

$y=-1;
$r=1;
                 $kqry="SELECT mem_id,username,thumbnail,fname,lname FROM member where ( (CONCAT(fname, ' ', lname) like '$term%') or (fname like '$term%' or lname like '$term%' ) ) and mem_id <> '$memid'  ORDER BY views DESC ";

                $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
                {$full=$krow[3]." ".$krow[4];
				 if($r%2!=0){
					echo'<div class=" col-lg-3 col-sm-6 panel panel-danger "><div class="panel-heading"><a href="profile?un='.$krow[1].'" >
									      <img class="img-circle pull-right" style="margin-top:0px;"  src="'.$krow[2].'">
									</a> <a style="color:white;"href="profile?un='.$krow[1].'"><h5 class="ubuntu"style="text-align:left;">$'.$krow[1].'</h5></a></div> <h5 class="ubuntu"style="text-align:left;color:red;"> '.$full.' </h5></div>';
				 }
				 else{
				 
				 echo'<div class=" col-lg-3 col-sm-6 panel panel-warning "><div class="panel-heading"><a href="profile?un='.$krow[1].'" >
									      <img class="img-circle pull-right" style="margin-top:0px;" src="'.$krow[2].'">
									</a> <a style="color:white;"href="profile?un='.$krow[1].'"><h5 class="ubuntu"style="text-align:left;">$'.$krow[1].'</h5></a></div> <h5 class="ubuntu"style="text-align:left;color:orange;"> '.$full.' </h5></div>';
				 
				 
				 
				 }
					
		 
				$y++;
				$r++;}
                                
                                 
                 
                 //for topic tag search 
                 $term=strtoupper($term);
                 
              $kqry2="SELECT topic_id,category,cdesc,wall,private,topic_mode FROM topic where topic_id IN "
                      . "(select topic_tag.topic_id from tag_list JOIN topic_tag WHERE (topic_tag.tagl_id = tag_list.tagl_id) and (tag_list.tag_name like '$term%')) "
                      . "ORDER BY views DESC ";

$y2=-1;
$p2=0;

                $kresult2=mysql_query($kqry2);
				
                while($krow2 = mysql_fetch_row($kresult2))
                {
                    if($_SESSION['SESS_MODE']==$krow2[5] || $krow2[5]==0){
                    $r = 255;
                  //rand(30 , 200 );
                  $g = 255;
                  //rand(30 , 200 );
                  $b =255; 
                      //rand(30 , 200 );
                  $a =65; 
                  //rand(50 , 75 );
                  $a=$a/100;
			//$j+=1 ;
                	$ran="rgba(".$r.",".$g.",".$b.",".$a.")";

                	if($krow2[4]==1)
                		{$priv="priv";
                                $colpr="#e74c3c";
                                 $block=$ran;
                                $blockn="rgba(231,76,60,0.85)";
                  $privfoot="privfoot";
                  $m=5;
                         $lock='<span class="fa-stack pull-right fa-lg" style="font-size:0.96em;">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa  fa-lock text-danger fa-stack-1x fa-inverse"></i>
</span>';
                         }
                	else
                	{$priv="";
                        $blockn="rgba(135,132,255,0.85)";
                         $colpr="#8784ff";
                	$block=$ran;
                  $privfoot="privfoot";
                  $m=7;
                	$lock='<span class="fa-stack pull-right fa-lg" style="font-size:0.96em;">
  <i class="fa fa-circle fa-stack-2x"></i>
  <i class="fa fa-globe text-info fa-stack-1x fa-inverse"></i>
</span>';
                	}
                	$y=0;

				 $info=$krow2[2];
                  $info = strip_tags($info);
        $info= truncate($info,120);
			//if($p==0||$p==1)
			 if(!$krow2[3])
            {
             $l = rand(1,9);

              $source="images/tt".$l.".png";
   
            }
            else
            $source=$krow2[3];
				//	$p++;}
					//else if($p==2||$p==3||$p==4)
					echo'<div class="col-lg-3 col-md-3 col-sm-6 sizehand"><a class="topichov '.$priv.' rounded"style="display:block;"href="topic?tn='.$krow2[1].'">
<div class="thumbnail img-rounded responsive" style="background-color:'.$block.'; border:none;  max-height: 180px;
     height:180px;" > <!--  thumbnail 1  -->
         <div class="pannel-img img-responsive bwimg"  style="background:url('.$source.') center no-repeat; background-size: cover;height:60px; max-height:60px;" width="100%" alt="Card image"></div><!-- image 1 -->
          <div class="caption " style="padding-bottom:0px;background:url('.$source.') center no-repeat;"> <!-- caption -->
            <blockquote class="img-rounded "style="background-color:'.$blockn.'; padding-left:2px;padding-right:2px; border:none; margin:0 0 0; height:100px; max-height:100px;overflow:hidden;"><p style="margin: 0 0 0;font-size:0.69em;background-color:rgba(255,255,255,1.0);color:'.$colpr.'; font-weight:bolder; box-shadow: 2px 2px 15px #fff !important;"class="ubuntu">@'.$krow2[1].''.$lock.'</p>
            <footer class="'.$privfoot.'"style="font-style:italic;font-size:0.64em;" >'.$info.'</footer></blockquote>
            </div>
        </div>
</a>
</div>';
				
					//$p++;
					//if($p==5){$p=0;}
					
				// echo"<script>  $('#loadmore').show(); </script>";	
		 }}     
                 
                 
                                
				if($y==-1 && $y2==-1) 
{echo'<img height="15%" width="15%"src="images/sorry.png"></img><br /><h2>no match found</h2>';}	

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
}
 ?>
 
        
    
	
	