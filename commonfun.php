<?php
function truncate($string,$length,$append="&hellip;") {
  $string = trim($string);

  if(strlen($string) > $length) {
    $tempstring=$string;
    $string = wordwrap($string, $length);
    if($string==$tempstring)
     { $string=substr($string,0,$length);}

    $string = explode("\n", $string, 2);
    $string = $string[0] . $append;
  }
 
  return $string;
}


	function makemydate($dtime,$yer=0,$mer=0,$der=0,$her=0,$mer=0,$ser=0){
$dtime = date_create($dtime);
//date_modify($date, '+1 day');
//echo date_format($date, 'Y-m-d');
            $m = date_format($dtime, 'm');
$d = date_format($dtime, 'd');
$y = date_format($dtime, 'y');
$h = date_format($dtime, 'H');
$i = date_format($dtime, 'i');
$s = date_format($dtime, 's');

              
$cor="+".$her."hours +".$mer."minutes";
$dnow = date("Y-m-d H:i:s", strtotime($cor));

$dnow = date_create($dnow);
 $nm = date_format($dnow, 'm');
$nd = date_format($dnow, 'd');
$ny = date_format($dnow, 'y');
$nh = date_format($dnow, 'H');
$ni = date_format($dnow, 'i');
$ns = date_format($dnow, 's');




 if($y<$ny){

$date=date_format($dtime, 'jS F Y');
  }
else
{
      if($m<$nm){
      	$date= date_format($dtime, 'jS F');
      }
      	else
      	{
                if($d<$nd){$temp=$nd-$d;
                	          if($temp==1)
                	          	  {$date=date_format($dtime, 'g:ia');
                	                 $date="yesterday at ".$date;         }
                		                else
                                       $date= date_format($dtime, 'F d \a\t g:ia');
                }
                else{

                      if($h<$nh){$temp=$nh-$h;
                      	             if($temp==1)
                               	 $date=$temp." hr ago";
                               	       else 
                               	       	$date=$temp." hrs ago";
                      }
                      	else{
                      		     if($i<$ni){$temp=$ni-$i;
                                                if($temp==1)
                               	                   $date=$temp." min ago";
                               	                    else 
                               	       	              $date=$temp." mins ago";
                      		           }
                      			      else{
                                             if($s<$ns){ $temp=$ns-$s;
                                             	          $date=$temp." sec ago";

                                                        }
                                             	           else{
                                             		            $date="just now";
                                             	                }
                      			           }
                      	}
                }
      	}
}


return $date;
		}



  function formatUrlsInText($text){
    $reg_exUrl = "/(((http|https|ftp|ftps)\:\/\/)|((www)\.))[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/?\S*)?/";
    preg_match_all($reg_exUrl, $text, $matches);
    $usedPatterns = array();

    foreach($matches[0] as $pattern){
        if(!array_key_exists($pattern, $usedPatterns)){
            $usedPatterns[$pattern]=true;
            // now try to catch last thing in text
                      
            $checkifimage =findinstring($pattern);
            $checkytube=videoType($pattern);
            if($checkifimage==1){ 
                $text = str_replace("$pattern ", '<br><img class="img-thumbnail" src="'.$pattern.'"></img></br> ', $text);   
            }else if($checkytube==1){
                        $check_patt=strpos($pattern,"watch?v=");
                if( $check_patt > 0){
                   
                  $older="watch?v=";
                  $newer="embed/";
                  
                  $pattern_yt = str_replace("$older", "$newer", $pattern);
                 
                }
                else{
                    echo 1;
                    $older="youtu.be/";
                    $newer="www.youtube.com/embed/";
                   $pattern_yt = str_replace("$older", "$newer", $pattern);
                    
                }
                $text = str_replace("$pattern ", '<br><iframe style="height:400px; width:100%;" class="img-thumbnail" src="'.$pattern_yt.'" frameborder="0" allowfullscreen></iframe></br> ', $text);  
            } 
            else {
              $wwwUrl="/(((http|https|ftp|ftps)\:\/\/))[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/?\S*)?/";
              if(!(preg_match_all($wwwUrl, $pattern, $pmatches)))
                {$mypattern=truncate($pattern,30);
                  $text = str_replace( "$pattern " , '<a target="_blank" href="http://'.$pattern.'">'.$mypattern.' </a>', $text);}

                else{$mypattern=truncate($pattern,30);
                $text = str_replace("$pattern ", '<a target="_blank" href="'.$pattern.'">'.$mypattern.' </a>', $text);}
              
            }   
        }
    }
    return $text;            
    }

function findinstring($str)
    {
        if(strpos( $str, "gif" ) === false && strpos($str, "jpg" ) === false && strpos($str, "png" ) === false && strpos($str, "peg" ) === false && strpos($str, "img" ) === false && strpos($str, "photo" ) === false ) { // substring not found in string
            return 0;
        } else { // substring found in string
            return 1;
        }
    }
    
    function videoType($str) {
    if (strpos($str, 'www.youtube.com') === false && strpos($str,'youtu.be') === false) {
        return 0;
    } 
    else{return 1;}
}



    function atrateInText($text){
    $reg_ex = "/@([a-z0-9_A-Z]+)/";
    preg_match_all($reg_ex, $text, $mat);
    $usedPat = array();

    foreach($mat[0] as $pattern){
        if(!array_key_exists($pattern, $usedPat)){
            $usedPat[$pattern]=true;
            $npattern=str_replace('@','', $pattern);
            // now try to catch last thing in text          
          $sql=mysql_query("select category from topic where category='$npattern'");
          $run=mysql_fetch_row($sql);
            if(!$run[0]){
                $text =str_replace("$pattern ", '<a class="atrate ubuntu" href="http://twitter.com/'.$npattern.'" target="_blank">@'.$npattern.' </a>', $text);    
            } else {
              
                $text = str_replace("$pattern ", '<a class="atrate ubuntu" href="topic?tn='.$npattern.'" target="_blank">@'.$npattern.' </a>', $text);
            }   
        }
    }
    return $text;            
    }


    function dolInText($text){
    
    $reg= '/\$([a-z0-9_A-Z]+)/';
    preg_match_all($reg, $text, $matches);
    $usedPat = array();
 

 foreach($matches[0] as $pattern){
    
     if(!array_key_exists($pattern, $usedPat)){
            $usedPat[$pattern]=true;
           $npattern=str_replace("$","", $pattern);
            // now try to catch last thing in text          
          $sql=mysql_query("select username from member where username='$npattern'");
          $run=mysql_fetch_row($sql);
            if(!$run[0]){
                $text =str_replace("$pattern ", '<a class="dollar ubuntu" href="http://facebook.com/'.$npattern.'" target="_blank">$'.$npattern.' </a>', $text);    
            } else {
              
                $text = str_replace("$pattern ", '<a class="dollar ubuntu" href="profile?un='.$npattern.'" target="_blank">$'.$npattern.' </a>', $text);
            }   
        }
    }
    return $text;            
    }
   

function carbonlink($input){

$caption=$input;
$caption=" ".$caption." ";

      $caption = formatUrlsInText($caption);
$caption = dolInText($caption);
$caption = atrateInText($caption);

      


return $caption;
}

function getfontsize($caplen){
    $size=1.0;
    
  if($caplen<30){$size=1.6;}
   else if($caplen<60){$size=1.4;}
    else if($caplen<120){$size=1.2;}
    
    return $size;
    
}




function formatbytes($file)
{ $filesize=filesize($file);
return $filesize;
}

function human_formatbytes($file)
{ 
    $filesize=filesize($file);
    
if(round($filesize/1000,1)!=0){
    $filesize=$filesize/1000;
    if(round($filesize/1000,1)!=0){
         $filesize=$filesize/1000;
    if(round($filesize/1000,1)!=0){
         $filesize=$filesize/1000;
    if(round($filesize/1000,1)!=0){
        
        return filesize($filesize);
        exit();
    }
    else{
         return round($filesize,1).' '."GB";
    }
    
        
    }
    else{
         return round($filesize,1).' '."MB";
    }
    
        
    }
    else{
         return round($filesize,1).' '."KB";
    }
    
    
}
else{
    return $filesize.' '."B";
}
   
  
}

function get_basename($filename)
{
    return preg_replace('/^.+[\\\\\\/]/', '', $filename);
}

?>