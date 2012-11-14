<?php
require_once("./vo/LanguageVO.php");
require_once("./utils/connect.php");
require_once("./utils/ResultUtils.php");

class LanguageService
{	
	public function __construct() {}
	
	public function getAllLanguage()
	{
		$query 		= mysql_query( "SELECT * FROM language" ) ;
		$languages 	= array() ;		
		$utils 		= new ResultUtils();
		
		if( !$query ) { $result = $utils->fail( "Error: Query to remove language failed at line 17" ) ; }
		else
		{
			$result = $utils->createLanguageResultVOs ( $query ) ;
		}
		return $result ;
	}
	
	public function createLanguage( $languageVO )
	{
		$code			= $languageVO[ "language_code" ] ;
		$engName		= $languageVO[ "language_eng_name" ] ;
		$localName		= $languageVO[ "language_local_name" ] ;
		$utils 			= new ResultUtils() ;
		
		$query = mysql_query("INSERT INTO language (code, eng_name, local_name)VALUES('$code', '$engName', '$localName')");		
		if( !$query ) { $result = $utils->fail( "Error: Query to create language failed at line 47" ) ; }
		else
		{
			$result = $utils->success( $query ) ;
		}
		return $result ;
	}
}