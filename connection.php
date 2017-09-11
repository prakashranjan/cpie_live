<?php

$mysql_host = "localhost";
$mysql_database = "carbon";
$mysql_user = "root";
$mysql_password = "";
@mysql_connect("$mysql_host","$mysql_user","$mysql_password") or die ("could not connect");
@mysql_select_db("$mysql_database") or die ("no database");



?>
