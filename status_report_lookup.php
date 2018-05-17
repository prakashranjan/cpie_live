<?php
include_once"connection.php";
?>
<html>
    <head>
        <title>
            Status lookUp
        </title>
        
        <style>
            h1{
                text-align: center
            }
            span{font-size: 200%;
                 
            }
        </style>
    </head>
    
        
    <body>
  <?php  
  function runqr($query){
  
 $mqry=mysql_query($query);
 $mrun=mysql_fetch_row($mqry);
 return $mrun[0];
  }
  
  
  echo'<h1>Students   : <span >'.  runqr("select COUNT(mem_id) from member where mode_id=1").'</span></h1>
        
       
        <h1>Faculty   : <span>'.  runqr("select COUNT(mem_id) from member where mode_id=2").'</span></h1>
        
        
        <h1>Anonymous Shouts   : <span>'.  runqr("select COUNT(image_id) from testblob where anonymous=1").'</span></h1>
        
        
        <h1>Total Shouts   : <span>'.  runqr("select COUNT(image_id) from testblob").'</span></h1>
        
        
        <h1>Class Shouts   : <span>'.  runqr("select COUNT(image_id) from channel_post").'</span></h1>
        
        
        <h1>Target Shouts   : <span>'.  runqr("select COUNT(image_id) from broadcast_post").'</span></h1>
        
       
        <h1>Channels   : <span>'.  runqr("select COUNT(topic_id) from topic").'</span></h1>
        
        
        ';
        
 
       ?> 
        
        
    </body>
</html>