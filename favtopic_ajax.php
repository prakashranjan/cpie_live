<?php
 require_once('auth.php');
include("connection.php");
include("commonfun.php");
 $usern=$_SESSION['SESS_USERNAME'];
 
$count=$_GET['counter'];
 


                 $kqry="SELECT topic.topic_id,topic.category,topic.cdesc,topic.wall,topic.private FROM topic INNER JOIN favourites ON topic.topic_id=favourites.topicid AND favourites.username='$usern' ORDER BY favourites.views DESC  ";
$y=-1;
$j=0;
//$p=0;

               $kresult=mysql_query($kqry);
        
                while($krow = mysql_fetch_row($kresult))
                {$r = 255;
                  //rand(30 , 200 );
                  $g = 255;
                  //rand(30 , 200 );
                  $b =255; 
                      //rand(30 , 200 );
                  $a =65; 
                  //rand(50 , 75 );
                  $a=$a/100;
      //$j+=1 ;
                  //for checking notifications of new post in this fav topic
                      $qry2=mysql_query("SELECT COUNT(tes.image_id) FROM testblob as tes WHERE category = '$krow[1]' AND event > (select pichla_view from favourites where category='$krow[1]' and username='$usern')");
                  $fav_top_no=  mysql_fetch_row($qry2);
    if($fav_top_no[0]==0){
        $fav_top_led="-off";
        $fav_top_no2="";   
    }
    else if($fav_top_no[0]>0){
        //switch on blinker
    $fav_top_led=" ";
    $fav_top_no2=$fav_top_no[0];   
    }
               
                  
                  $ran="rgba(".$r.",".$g.",".$b.",".$a.")";

                  if($krow[4]==1)
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

         $info=$krow[2];
                  $info = strip_tags($info);
        $info= truncate($info,120);
      //if($p==0||$p==1)
       if(!$krow[3])
            {
             $l = rand(1,9);

              $source="images/tt".$l.".png";
            }
            else
            $source=$krow[3];
        //  $p++;}
          //else if($p==2||$p==3||$p==4)
          echo'<div class="col-lg-3 col-md-3 col-sm-6 sizehand"><a class="topichov '.$priv.' rounded"style="display:block;"href="topic?tn='.$krow[1].'">
<div class="thumbnail img-rounded responsive" style="background-color:'.$block.'; border:none; max-height: 180px;
     height:180px;" > <!--  thumbnail 1  -->
        <div class="pannel-img img-responsive bwimg"  style="background:url('.$source.') center no-repeat; background-size: cover;height:60px; max-height:60px;" width="100%" alt="Card image"></div><!-- image 1 -->
          
          <div class="caption " style="padding-bottom:0px;background:url('.$source.') center no-repeat;"> <!-- caption -->
          
            <blockquote class="img-rounded "style="background-color:'.$blockn.'; padding-left:2px;padding-right:2px; border:none; margin:0 0 0; height:100px; max-height:100px;overflow:hidden;">';
              if($fav_top_no[0]>0){    echo '<span class="badge pull-left" style="background-color:#2c3e50;color:#ff0;"><span class="badge" style="background-color:#2c3e50;"><div id="fav_top_led"  class="led-yellow'.$fav_top_led.'"></div></span><span>'.$fav_top_no2.'</span></span></span>';}
                  echo '<p style="margin: 0 0 0;font-size:0.69em;background-color:rgba(255,255,255,1.0);color:'.$colpr.'; font-weight:bolder;"class="ubuntu">@'.$krow[1].''.$lock.'</p>
            <footer class="'.$privfoot.'"style="font-style:italic;font-size:0.64em;" >'.$info.'</footer></blockquote>
            </div>
        </div>
</a>
</div>';
				
					//$p++;
					//if($p==5){$p=0;}
					
				// echo"<script>  $('#loadmore').show(); </script>";	
		 }


		 
		 if(!$krow[0]&& $y==-1) 
{echo'<img height="15%" width="15%"src="images/sorry.png"></img><br /><h2>you have not selected favourite channel</h2>';}
            

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
     
 ?>
 