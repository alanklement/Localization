<?php
	header('Content-type: text/csv');
	
	
//	$csvData = ($_POST['csvdata']) ? $_POST['csvdata'] : $_GET['csvdata'];
	$csvData = $_POST['tsvString'];
	
	echo  $csvData;
?>