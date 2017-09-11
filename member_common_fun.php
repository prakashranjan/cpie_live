<?php




function kya_ayega($user,$topic){
    
    $query=mysql_query("select pvt_id from private_member where  username='$user' and category='$topic' and allow=1 ");
    if(mysql_num_rows($query)==1){
        echo'<i class="fa fa-minus-circle " title="Remove"  aria-hidden="true"></i>';
    }else if(mysql_num_rows($query)==0){
        
        echo'<i class="fa fa-plus-circle " title="Add"  aria-hidden="true"></i>';
    }
    
    
    
    
}

?>