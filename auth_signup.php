<?php
	//Start session
	session_start();
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['GIFTY']) && !isset($_SESSION['GIFTY_roll'])) {
		header("location: index");
		exit();
	}
?>
