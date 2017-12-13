<?php 
require_once('../auth.php');
 include("../connection.php");	
	 include("../commonfun.php");
          include("../vcommon.php");
        
                 $mode_id=$_SESSION['SESS_MODE'];
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER']; 
                        $gender= strtolower($gender);
	$mem_id=$_SESSION['SESS_MEMBER_ID'];
        if($mode_id==1){
                       $mysec_id= $_SESSION['SESS_SECTION'];
                        $myco_id=$_SESSION['SESS_COURSE'];
                        $my_yr=$_SESSION['SESS_YEAR'];
                        $mybr_id=$_SESSION['SESS_BRANCH'];
        }
                        $y=-1;	
 
 $bmark=cleankar($_POST['counter']);
 $wallid=cleankar($_POST['wallid']);
 if($bmark=="" || $wallid==""){exit();}
 $bmark=$bmark*6;
 $end=6;
$n=0;
$mart=0;
$dupli_checker=array();




echo'<div class="chat">';




    $mem_id=$_SESSION['SESS_MEMBER_ID'];
    
                   





                $qry="SELECT * FROM broadcast_post  where image_id IN (select image_id from b_post_index where (category_id ='$wallid' and mem_id='$mem_id') and dexter=1) order by image_id DESC LIMIT $bmark, $end";
                
                $result=mysql_query($qry);
               while ($rowori= mysql_fetch_row($result)){
                $n++;
                //echo "n---->".$n;
                $rowori[4]=  nl2br($rowori[4]);
                	if($rowori[9]!=1){
                	
					$qery="SELECT thumbnail,mem_id,username FROM member WHERE username='$rowori[1]'";
				$prpic=mysql_query($qery);
				$prpicori = mysql_fetch_row($prpic);
				$qe="SELECT mem_id,username FROM member WHERE username='$rowori[8]'";
				$pr=mysql_query($qe);
				$prp= mysql_fetch_row($pr);
					
			}
						if($rowori[9]==1){$prpicori[0]="images/anon.png";
						$prpicori[1]="#";
						$prpicori[2]="$******";
					     $prp[0]="#";
					     $prp[1]="$*******";
					 }
                                         
                                         if($rowori[13]==0){$rowori[13]='';}
					
                   $usr=$_SESSION['SESS_USERNAME']; 
					if($usr!=$rowori[1] || $rowori[9]==1)
					{
						if($rowori[9]==1){
						$usr="$*******";
						$rowori[1] ="*******";}

						echo'<div class="row">
                          <!-- main col right -->
                          <div class="col-sm-6 ">
                               
                               
                      
                               <div class="panel panel-danger" style="box-shadow:0px 0px 10px #000000;">
                                 <div class="panel-heading" ';if($rowori[9]==1){echo'style="background-color:#000000;border-color:#000000;"';}echo'><a href="profile?un='.$prpicori[2].'" class="pull-left">
									      <img class="img-circle pull-right img-responsive"  src="'.$prpicori[0].'">
									</a> <a style="color:white;"href="profile?un='.$prpicori[2].'"><h4 class="ubuntu"style="text-align:left;">$'.$rowori[1].'</h4></a></div>
                                  <div class="panel-body panel-marko text-info">';
							 if($rowori[1]!=$rowori[8] && $rowori[9]!=1){		  
                                                         echo'<p class="comicfont" style="text-align:right;color:gray;font-size:1.0em; ">Original by <a href="profile?un='.$prp[1].'"style="font-family:ubuntu; color:RoyalBlue;">$'.$rowori[8].'</a></p>';}
                                    if($rowori[4]!=NULL){$size=getfontsize(strlen(strip_tags($rowori[4])));
                                                           
                                                           echo'<p class="comicfont ubuntu" style="font-size:'.$size.'em; color:#034775;">'.$rowori[4].'</p>';}
                                    if($rowori[7]!=NULL){$docname=get_basename($rowori[7]);
                                                          $shortdocname= substr($docname,0,30)."...";
                                                          $file_size=human_formatbytes("../".$rowori[7], "MB");
										echo'<a class="text-center btn btn-info" style="font-size:0.9em;width:100%;" href="'.$rowori[7].'" title="'.$docname.'" download><i class="fa fa-download" aria-hidden="true"></i> '.$file_size.' | <i class="fa fa-file" aria-hidden="true"></i> '.$shortdocname.'</a>';}
                                    echo'<div class="clearfix">';
                                   //poll place
                                    
                                      if($rowori[12]!=NULL){$k='A';
                                        //check for already voted
                                     
                                     $jql="SELECT option_id FROM broadcast_poll_count WHERE username='$usern' AND image_id='$rowori[0]'";
                                     $dar=mysql_query($jql);
                                     if ($par=mysql_fetch_row($dar)){
                                         
                                      
                 echo '<div id="'.$rowori[0].'polldiv"><div class="panel-body panel-marko">';
                                       
                                       $qry="SELECT option_id,poll_option,hits FROM broadcast_poll_option WHERE image_id='$rowori[0]'";
				$res=mysql_query($qry);
				while($option = mysql_fetch_row($res))
                                {
                                   echo'<div class="radio">
                               <label>
                                    
                                    <strong>'.$k++.'.  </strong>'.$option[1].'   
                                </label>
                                <div class="pull-right"><span class="text-info  small" > '.$option[2].' <i class="fa fa-hand-peace-o" aria-hidden="true"></i> </span></div>
                            </div>
                            
                               <div class="progress progress-striped active">';
                                        $poll_per=($option[2]/2000)*100;  
                                        if($poll_per>=75)
                                        { echo'<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=50)
                                             { echo'<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=25)
                                             { echo'<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else 
                                             { echo'<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                             echo'<span class="sr-only"> '.$option[2].'Votes </span>
                                   </div>
                               </div>';
                          }                
                                  echo'</div></div>';       
                                     }          
                                      
                                     else{
                                               // poll ui
                                         //echo'<form id="'.$rowori[0].'poll" name="'.$rowori[0].'poll">  ';
                                     
                                       echo '<div id="'.$rowori[0].'polldiv"><div class="panel-body panel-marko">';
                                       
                                       $qry="SELECT option_id,poll_option,hits FROM broadcast_poll_option WHERE image_id='$rowori[0]'";
				$res=mysql_query($qry);
				while($option = mysql_fetch_row($res))
                                {
                                   echo'<div class="radio">
                               <label>
                                    <input type="radio" name="'.$rowori[0].'poll" id="'.$rowori[0].'poll" value="'.$option[0].'" />
                                    <strong>'.$k++.'.  </strong>'.$option[1].'   
                                </label>
                                <div class="pull-right"><span class="text-muted small" > '.$option[2].' <i class="fa fa-hand-peace-o" aria-hidden="true"></i> </span></div>
                            </div>
                            
                               <div class="progress progress-striped active">';
                                        $poll_per=($option[2]/2000)*100;  
                                        if($poll_per>=75)
                                        { echo'<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=50)
                                             { echo'<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=25)
                                             { echo'<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else 
                                             { echo'<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                             echo'<span class="sr-only"> '.$option[2].'Votes </span>
                                   </div>
                               </div>';
                          }
                           
                         echo'</div>
                         <div class="panel-footer">
                            <button  class="btn btn-success btn-sm text-center" type="button" onclick="savevote(this.id)" id="'.$rowori[0].'vote"><span class="glyphicon glyphicon-bell"></span> Mark My Vote</button>
                              
                        </div>
                        </div>
                        ';
                                       
                                        
                                        }
                                        
                                             }
                                    
				if($rowori[3]!=NULL){
                                    $imagedetails = getimagesize("../".$rowori[10]);
                                  $width = $imagedetails[0]; 
                                  $height = $imagedetails[1];
                                  if($width<$height || $width<450 || $height<450){echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[3].'")\'  height="100%"src="'.$rowori[3].'"></div>';}
                                  else{
                                  
                                  echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[3].'")\' style="width:100%" height="100%"src="'.$rowori[3].'"></div>';}}
				if($rowori[11]!=NULL){$imagedetails = getimagesize("../".$rowori[10]);
                                  $width = $imagedetails[0]; 
                                  $height = $imagedetails[1];
                                  if($width<$height || $width<450 || $height<450){echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[11].'")\' height="100%"src="'.$rowori[11].'"></div>';}
                                  else{
                                  
                                echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[11].'")\' style="width:100%" height="100%"src="'.$rowori[11].'"></div>';}}					     
									echo'
									
                                    <div class="input-group">
                                      <div class="input-group-btn">';
									  
									  $jql="SELECT s_id FROM broadcast_slam WHERE username='$usern' AND chat_id='$rowori[0]'";
                                      $dar=mysql_query($jql);
                                      if ($tar=mysql_fetch_row($dar))
									  echo'<button id="'.$rowori[0].'" onclick="slam(this.id)" type="button"class="btn smiliy_but"><i class="fa fa-smile-o fa-2x  text-success"  aria-hidden="true"></i><span class="badge text-success">'.$rowori[5].'</span></button>&nbsp;';
								  else
									  echo'<button id="'.$rowori[0].'" onclick="slam(this.id)" type="button"class="btn smiliy_but"><i class="fa fa-smile-o fa-2x text-muted" aria-hidden="true"></i><span class="badge text-success">+'.$rowori[5].'</span></button>&nbsp;';
                                      
									 
									// if($rowori[9]!=1 && $rowori[12]==NULL){echo'<button class="btn" type="button" id="'.$rowori[0].'A"  onclick="shareid(this.id)" data-toggle="modal" data-target="#shareModal"><i class="glyphicon glyphicon-share"></i></button>';}
                                                                         
									 echo'<button class="btn " type="button" id="'.$rowori[0].'comm"  onclick="comm_show(this.id);" data-toggle="modal" data-target="#commentModal"><i class="fa fa-comments-o" aria-hidden="true"></i> <span class="badge" >'.$rowori[13].'</span></button>';
                                                                        if($rowori[10]!=NULL){
                                                                            $image_size=human_formatbytes("../".$rowori[10], "MB");
                                                                            echo'<button class="btn " type="button"><a href="'.$rowori[10].'"   id="'.$rowori[0].'downcontent" download><span class="badge" ><i class="fa fa-arrow-down" aria-hidden="true"></i> '.$image_size.'</span></a></button>';  }  
                                                                         echo'</div>
                                      <p class="text-muted form-control text-right " style="color:#2c3e50; font-size:0.75em;"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($rowori[6]).'</p>
                                    </div>
                                    </div>
                                   
                                  </div>
                               </div>
                  
                            
                          </div>
						  </div>';
					
					
					}
					else
					{

						echo'<div class="row">
                          <!-- main col right -->
                          <div class="col-sm-6 ri">
                               
                               
                      
                               <div class="panel panel-warning" style="box-shadow:0px 0px 10px #000000;">
                                 <div class="panel-heading"><a href="profile?un='.$prpicori[2].'" class="pull-left">
									      <img class="img-circle pull-right img-responsive"  src="'.$prpicori[0].'">
									</a> <a style="color:white;"href="profile?un='.$prpicori[2].'"><h4 class="ubuntu"style="text-align:left;">$'.$rowori[1].'</h4></a></div>
                                  <div class="panel-body  panel-marko">';
					 	 if($rowori[1]!=$rowori[8]){
                                                 echo'<p class="comicfont" style="text-align:right;color:gray;font-size:1.0em; ">Original by | <a href="profile?un='.$prp[1].'" style="font-family:ubuntu; color:RoyalBlue;">$'.$rowori[8].'</a></p>';}
                                    if($rowori[4]!=NULL){$size=getfontsize(strlen(strip_tags($rowori[4])));
                                                                   echo'<p class="comicfont"style="font-size:'.$size.'em; color:#00523c;">'.$rowori[4].'</p>';}
                                    if($rowori[7]!=NULL){$docname=get_basename($rowori[7]);
                                                        $shortdocname= substr($docname,0,30)."...";
                                                        $file_size=human_formatbytes("../".$rowori[7], "MB");
										echo'<a class="text-center btn btn-info" style="font-size:0.9em;width:100%;"  href="'.$rowori[7].'" title="'.$docname.'" download><i class="fa fa-download" aria-hidden="true"></i> '.$file_size.' | <i class="fa fa-file" aria-hidden="true"></i> '.$shortdocname.'</a>';}
                                    echo'<div class="clearfix">';
                                     if($rowori[12]!=NULL){$k='A';
                                        //check for already voted
                                     
                                     $jql="SELECT option_id FROM broadcast_poll_count WHERE username='$usern' AND image_id='$rowori[0]'";
                                     $dar=mysql_query($jql);
                                     if ($par=mysql_fetch_row($dar)){
                                         
                                      
                 echo '<div id="'.$rowori[0].'polldiv"><div class="panel-body panel-marko">';
                                       
                                       $qry="SELECT option_id,poll_option,hits FROM broadcast_poll_option WHERE image_id='$rowori[0]'";
				$res=mysql_query($qry);
				while($option = mysql_fetch_row($res))
                                {
                                   echo'<div class="radio">
                               <label>
                                    
                                    <strong>'.$k++.'.  </strong>'.$option[1].'  
                                </label>
                                <div class="pull-right"> <span class="text-info   " > '.$option[2].' <i class="fa fa-hand-peace-o" aria-hidden="true"></i> </span></div>
                            </div>
                            
                               <div class="progress progress-striped active">';
                                        $poll_per=($option[2]/2000)*100;  
                                        if($poll_per>=75)
                                        { echo'<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=50)
                                             { echo'<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=25)
                                             { echo'<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else 
                                             { echo'<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                             echo'<span class="sr-only"> '.$option[2].'Votes </span>
                                   </div>
                               </div>';
                          }                
                                  echo'</div></div>';       
                                     }          
                                      
                                     else{
                                               // poll ui
                                         //echo'<form id="'.$rowori[0].'poll" name="'.$rowori[0].'poll">  ';
                                     
                                       echo '<div id="'.$rowori[0].'polldiv"><div class="panel-body panel-marko">';
                                       
                                       $qry="SELECT option_id,poll_option,hits FROM broadcast_poll_option WHERE image_id='$rowori[0]'";
				$res=mysql_query($qry);
				while($option = mysql_fetch_row($res))
                                {
                                   echo'<div class="radio">
                               <label>
                                    <input type="radio" name="'.$rowori[0].'poll" id="'.$rowori[0].'poll" value="'.$option[0].'" />
                                    <strong>'.$k++.'.  </strong>'.$option[1].'   
                                </label>
                                <div class="pull-right"><span class="text-muted text-right small" > '.$option[2].' <i class="fa fa-hand-peace-o" aria-hidden="true"></i> </span></div>
                            </div>
                            
                               <div class="progress progress-striped active">';
                                        $poll_per=($option[2]/2000)*100;  
                                        if($poll_per>=75)
                                        { echo'<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=50)
                                             { echo'<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=25)
                                             { echo'<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else 
                                             { echo'<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                             echo'<span class="sr-only"> '.$option[2].'Votes </span>
                                   </div>
                               </div>';
                          }
                            echo'
                        
                        </div>
                         <div class="panel-footer">
                            <button  class="btn btn-success btn-sm text-center" type="button" onclick="savevote(this.id)" id="'.$rowori[0].'vote"><span class="glyphicon glyphicon-bell"></span> Mark My Vote</button>
                              
                        </div>
                        </div>
                        ';
                                       
                                        
                                        }
                                        
                                             }
									if($rowori[3]!=NULL){
                                                                            $imagedetails = getimagesize("../".$rowori[10]);
                                  $width = $imagedetails[0]; 
                                  $height = $imagedetails[1];
                                  if($width<$height || $width<450 || $height<450){echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[3].'")\' height="100%"src="'.$rowori[3].'"></div>';}
                                  else{
                                  
                                  echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[3].'")\' style="width:100%" height="100%"src="'.$rowori[3].'"></div>';}
                                                                            }
									if($rowori[11]!=NULL){$imagedetails = getimagesize("../".$rowori[10]);
                                  $width = $imagedetails[0]; 
                                  $height = $imagedetails[1];
                                  if($width<$height || $width<450 || $height<450){echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[11].'")\' height="100%"src="'.$rowori[11].'"></div>';}
                                  else{
                                  
                                                                        echo'<div class="text-center"><img class="img-thumbnail" data-toggle="modal" data-target="#zoomModal" onclick=\'zoom_img("'.$rowori[10].'","'.$rowori[11].'")\' style="width:100%" height="100%"src="'.$rowori[11].'"></div>';}}
	                                echo'
									
                                    <div class="input-group">
                                      <div class="input-group-btn">';
									  
                                        $jql="SELECT s_id FROM broadcast_slam WHERE username='$usern' AND chat_id='$rowori[0]'";
                                      $dar=mysql_query($jql);
                                      if ($tar=mysql_fetch_row($dar))
                                      { echo'<button id="'.$rowori[0].'" type="button"onclick="slam(this.id)" class="btn smiliy_but"><i class="fa fa-smile-o fa-2x text-success" aria-hidden="true"></i><span class="badge text-success">'.$rowori[5].'</span></button>&nbsp;';}
								  else
                                                                  { echo'<button id="'.$rowori[0].'" type="button" onclick="slam(this.id)" class="btn smiliy_but"><i class="fa fa-smile-o fa-2x text-muted" aria-hidden="true"></i><span class="badge text-success">+'.$rowori[5].'</span></button>&nbsp;';}
                                      
                                  //  if($rowori[12]==NULL) {echo'<button class="btn" type="button" id="'.$rowori[0].'A"  onclick="shareid(this.id)" data-toggle="modal" data-target="#shareModal"><i class="glyphicon glyphicon-share"></i></button>';}
				echo'<button class="btn" type="button" id="'.$rowori[0].'comm"  onclick="comm_show(this.id)" data-toggle="modal" data-target="#commentModal"><i class="fa fa-comments-o" aria-hidden="true"></i> <span class="badge" >'.$rowori[13].'</span></button>';					  
                                if($rowori[10]!=NULL){$image_size=human_formatbytes("../".$rowori[10], "MB");
                                    
                                    echo'<button class="btn " type="button"><a href="'.$rowori[10].'"   id="'.$rowori[0].'downcontent" download><span class="badge" ><i class="fa fa-arrow-down" aria-hidden="true"></i> '.$image_size.'</span></a></button>';  }  
                                echo'</div>
                                      <p class="text-muted form-control text-right  " style="color:#2c3e50; font-size:0.75em;"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($rowori[6]).'</p>
                                    </div>
                                    </div>
                                   
                                  </div>
                               </div>
                  
                            
                          </div>
						  </div>';
						
						
						
					}
                                       
			
                                 
                                        	 
				

   

	
}

if($n==6)
				       echo"<script>  $('#loadmore').show(); </script>";
				 else
                                        echo"<script>  $('#loadmore').hide(); </script>";


//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
?>








