<?php


function cleankar($str,$para=null) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
                
		return mysql_real_escape_string($str);
	}



?>
