<?php

require_once("./vo/ProjectVO.php");
require_once("./vo/LanguageVO.php");
include_once("./utils/connect.php");
require_once("./utils/ResultUtils.php");

class ProjectService
{	
	public function __construct() {}
	
	public function getProjectLang( $projectVO )
	{
		$projectId	= $projectVO[ "project_id" ] ;
		$utils 		= new ResultUtils() ;
	
		$query = mysql_query("	SELECT l.eng_name, l.id, l.code    
								FROM language l, project p, project_language pl 
								WHERE pl.language_id = l.id 
								AND pl.project_id = p.id
								AND p.id = $projectId
								ORDER BY l.eng_name ASC ") ;
		if( !$query ){ $result = $utils->fail( "Error: Query to get language(s) failed" ) ; }
		else
		{				
			$result = $utils->createLanguageResultVOs($query) ;
		}		
		return $result ; 		
	}

	public function createProject( $projectVO )
	{
		$code		= $projectVO[ "project_code" ] ;
		$name	 	= $projectVO[ "project_name" ] ;
		$notes		= $projectVO[ "project_notes" ] ; 
		$editedBy	= $projectVO[ "edited_by" ] ;
		$date 		= date( "Y-m-d H:i", time() ) ;
		$timeStamp 	= $date . " EST " . " by " . $editedBy ;
		$utils 		= new ResultUtils() ;
				
		$query1 = mysql_query(" INSERT INTO project( code, name, notes, created ) VALUES ( '$code', '$name', '$notes', '$timeStamp')") ;
		if( !$query1 ) { $result = $utils->fail( "Error: Query to create project failed at Line 70" ) ; }
		else
		{
			$userID = mysql_query("SELECT id FROM project p WHERE p.name = '$name' AND p.code = '$code'");
			if( !$userID ) { $result = $utils->fail( "Error: Query to create project failed at Line 77" ) ; }
			else
			{
				$returnedProjectID = mysql_result($userID, 0);

				$query2 = mysql_query("SELECT * FROM project p WHERE p.id = '$returnedProjectID'");
				if( !$query2 ){ $result = $utils->fail( "Error: Query to create project failed at Line 86" ) ;}
				else
				{
					$result = $utils->createProjectResultVOs( $query2 ) ;					
				}
			}
		}				
		return $result ; 				
	}
	
	public function updateProject( $projectVO )
	{	
		$id		  	= $projectVO[ "project_id" ] ;
		$code	  	= $projectVO[ "project_code" ] ;
		$name	  	= $projectVO[ "project_name" ] ;
		$notes	  	= $projectVO[ "project_notes" ] ;
		$editedBy 	= $projectVO[ "edited_by" ] ;
		$date 		= date( "Y-m-d H:i", time() ) ;
		$timeStamp 	= $date . " EST " . " by " . $editedBy ;
		$utils 		= new ResultUtils() ;
		
	    $query = mysql_query("	UPDATE  project SET code = '$code', name = '$name', notes = '$notes', edited = '$timeStamp' WHERE id = '$id'") ;
		if( !$query ) { $result = $utils->fail( "Error: Query to update project failed at line 127" ) ; }
		else
		{
			$result = $utils->success( $timeStamp ) ;
		}
		return $result ;			
	}
	
	public function deleteProject( $projectVO )
	{
		$id		= $projectVO [ "project_id" ] ;
		$utils 	= new ResultUtils() ;
		
		$query = mysql_query( "DELETE FROM project WHERE id = '$id'" ) ;
		if( !$query ) { $result = $utils->fail( "Error: Query to delete project failed") ; }
		else
		{
			$result = $utils->success( $query ) ;
		}
		return $result ;	
	}

	public function addLanguage( $projectVO )
	{
		$projectId = $projectVO[ "project_id" ] ;
		$languageId = $projectVO[ "project_language" ] ;
		$utils 	= new ResultUtils() ;

		$query = mysql_query("INSERT INTO project_language (project_id,language_id) VALUES ('$projectId','$languageId')") ;
		if( !$query ) { $result = $utils->fail( "Error: Query to add language failed" ) ; }
		else if ( $query )
		{
			$result = $utils->success( $query ) ;
		}
		return $result ;
	}
	
	public function removeLanguage( $projectVO )
	{
		$projectId = $projectVO["project_id"] ;
		$languageId = $projectVO["project_language"] ;
		$utils 	= new ResultUtils() ;

		$query = mysql_query("DELETE FROM project_language WHERE project_id='$projectId' AND language_id='$languageId'") ;
		if( !$query ) { $result = $utils->fail( "Error: Query to remove language failed" ) ; }
		else
		{
			$result = $utils->success( $query ) ;
		}
		return $result ;
	}
}