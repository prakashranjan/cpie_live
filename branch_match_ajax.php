<?php
 require_once('auth.php');
include("connection.php");
include("commonfun.php");
//Start session
    if($_SESSION['SESS_MODE']==2){
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
 
$branch_id=  addslashes($_GET['branchid']);


                

                 $qry="update branch set views=views+1 where branch_id='$branch_id' ";
                 $res=mysql_query($qry);
                 $mqry="select branch_short,course_id,branch_full from branch where branch_id='$branch_id' ";
                 $mres=mysql_query($mqry);
                 $mrow=mysql_fetch_row($mres);
                 
                 $gmqry="select duration from course where course_id='$mrow[1]' ";
                 $gmres=mysql_query($gmqry);
                 $gmrow=mysql_fetch_row($gmres);
                 echo'<div class="panel "style="margin-bottom:0px;border-color:#8784ff;opacity:0.9;">
                      
<b>
<ul class="nav nav-pills text-center"style="background-color:#8784ff;width:100%;" >
                 <li><a style="color:#a19ff7;background-color:#2c3e50;"><i class="fa fa-calendar" aria-hidden="true"></i> Year </a></li>';
  for($i=1;$i<=$gmrow[0];$i++) {                  
  if($i==1){echo'<li class="active"><a data-toggle="pill" href="#menu'.$i.'">'.$i.'</a></li>';}
  else {echo'<li><a data-toggle="pill" href="#menu'.$i.'">'.$i.'</a></li>';}
  }
 echo'     <br class="visible-xs"><li class="pull-right getfull"style="border-radius:0px;"><a style="color:#35c3ab;background-color:#2c3e50;"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> '.$mrow[2].'</a></li>
</ul>

</b>


    </div>
    <br>';
                 
                 

echo'<div class="tab-content">';
for($i=1;$i<=$gmrow[0];$i++) {                  
  if($i==1){echo'<div id="menu'.$i.'" class="tab-pane fade in active">';
    getchannels($i);
  echo'</div>';}
  else {echo'<div id="menu'.$i.'" class="tab-pane fade ">';
    getchannels($i);
  echo'</div>';}
  }
  
  
    }
   else{exit();}



  function getchannels($inyear){
      $branch_id=  addslashes($_GET['branchid']);
 
                 $kqry="SELECT section_id,category,cdesc,wall,private FROM section WHERE branch_id='$branch_id' and year='$inyear' ORDER BY views DESC";
$y=-1;
$j=0;
//$p=0;

               $kresult=mysql_query($kqry);
                
                while($krow = mysql_fetch_row($kresult))
                {
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

                    if($krow[4]==1)
                        {
                  $priv="priv";
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
                    {
                  $priv="";
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
                    echo'<div class="col-lg-3 col-md-3 col-sm-6 sizehand"><a class="topichov '.$priv.' rounded"style="display:block;"href="channel?tn='.$krow[1].'">
<div class="thumbnail img-rounded responsive" style="background-color:'.$block.'; border:none;  max-height: 180px;
     height:180px;" > <!--  thumbnail 1  -->
        <div class="pannel-img img-responsive bwimg"  style="background:url('.$source.') center no-repeat; background-size: cover;height:60px; max-height:60px;" width="100%" alt="Card image"></div><!-- image 1 -->
          <div class="caption " style="padding-bottom:0px;background:url('.$source.') center no-repeat;"> <!-- caption -->
             <blockquote class="img-rounded "style="background-color:'.$blockn.'; padding-left:2px;padding-right:2px; border:none; margin:0 0 0; height:100px; max-height:100px;overflow:hidden;"><p style="margin: 0 0 0;font-size:0.69em;background-color:rgba(255,255,255,1.0);color:'.$colpr.'; font-weight:bolder;"class="ubuntu">@'.$krow[1].''.$lock.'</p>
            <footer class="'.$privfoot.'"style="font-style:italic;font-size:0.64em;" >'.$info.'</footer></blockquote>
            </div>
        </div>
</a>
</div>';
				
					//$p++;
					//if($p==5){$p=0;}
					
				// echo"<script>  $('#loadmore').show(); </script>";	
                
                
                    }

  
            
				if(!$krow[1]&& $y==-1) 
{echo'<img height="15%" width="15%"src="images/sorry.png"></img><br /><h2> No Channels!! </h2>';}
  }
  
  
  
    
 ?>



