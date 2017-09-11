 <?php
 

//require_once('auth.php');
//include("connection.php");
 
   
           exit();
  
          $sq1="select category,section_id from section ";
            $ru1=mysql_query($sq1);
            while($run1=mysql_fetch_row($ru1)){
                $qry45="INSERT INTO broadcast_tags (tag_name,type,ref_id) VALUES ('$run1[0]',4,'$run1[1]')";
                $result45=mysql_query($qry45);	  

            
        }
       
        
        $sq2="select course_full,course_id from course ";
            $ru2=mysql_query($sq2);
            while($run2=mysql_fetch_row($ru2)){
                $bety='CO-'.$run2[0];
                 $qry456="INSERT INTO broadcast_tags (tag_name,type,ref_id) VALUES ('$bety',2,'$run2[1]')";
                $result456=mysql_query($qry456);	
                
               
        }
        
     
        $sq3="select branch_full,course_id,branch_id from branch ";
            $ru3=mysql_query($sq3);
            while($run3=mysql_fetch_row($ru3)){
                $bety='BR-'.$run3[0];
                 $qry457="INSERT INTO broadcast_tags (tag_name,type,ref_id) VALUES ('$bety',3,'$run3[2]')";
                $result457=mysql_query($qry457);
                
          
               $sqq="select duration from course where course_id='$run3[1]' ";
            $ruq=mysql_query($sqq); 
                $runq=mysql_fetch_row($ruq);
                for($i=1;$i<=$runq[0];$i++){
                    $bety='YR-'.$i.'_'.$run3[0];
                    $qry458="INSERT INTO broadcast_tags (tag_name,type,ref_id) VALUES ('$bety',5,'$run3[2]')";
                $result458=mysql_query($qry458);	
                    
                    
               
                
                }
                
                
        }
           for($i=1;$i<=4;$i++){
               $bety='YR-'.$i;
                $qry459="INSERT INTO broadcast_tags (tag_name,type,ref_id) VALUES ('$bety',6,'$i')";
                $result459=mysql_query($qry459);	
        
           }
         
           
     

 ?>
