<?php
	
	$db_address  = "localhost";
	$db_user 	 = "aries";
	$db_password = "";
	$db_db 		 = "localization_tool";

	$sqlConnection = mysql_connect($db_address, $db_user, $db_password)
	or die("Could not connect: " . mysql_error());
	mysql_select_db( $db_db ) or die ( "Couldn't open $db_db: ".mysql_error() );
?>
