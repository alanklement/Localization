<?php
require_once("./vo/LabelVO.php");
require_once("./vo/LoginVO.php");
require_once("./vo/ProjectVO.php");
require_once("./vo/PhraseVO.php");
require_once("./vo/LanguageVO.php");
require_once("./vo/CopyDeckVO.php");

include_once("./utils/connect.php");
include_once("./utils/ResultUtils.php");

class LabelService
{
	// const __UNASSIGNED		= -1;
	// const __LANGUAGES_ALL	= 0;
	// const __PROJECTS_ALL	= 0;
		
	public function __construct() {}
	
	public function getAllLabel( $projectID, $langID )
	{		
		$utils = new ResultUtils() ;

		if( $projectID == -1 )
		{
			
			if ( $langID == 0 )
			{
				 $query = mysql_query(" SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original
										FROM label l, project_label p_l, label_phrase l_ph, phrase ph
										WHERE p_l.label_id = l.id
										AND p_l.project_id = -1
										AND l_ph.label_id = l.id
										AND l_ph.phrase_id = ph.id
										AND l_ph.orig = 1");			
			}
		}
		else if ( $projectID == 0)
		{			
			if ( $langID == 0 )
			{
				$query = mysql_query("  SELECT distinct l.id as label_id, l.label, l.char_limit, l.created, l.edited, ph.phrase as original
										from label l, label_phrase l_ph, phrase ph, project_label p_l
										where l.id = l_ph.label_id
										and l_ph.phrase_id = ph.id
										and l_ph.orig = 1
										and p_l.label_id = l.id
										and p_l.project_id != -1");											
			
			}
			else if ( $langID != 0 )
			{
					$query = mysql_query("  SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original, ph2.phrase AS translation, l.created, l.edited
											FROM phrase ph, label_phrase lph, label l, 
											phrase ph2, label_phrase lph2
											WHERE ph.id = lph.phrase_id 
											AND lph.orig = 1
											AND l.id = lph.label_id
											AND ph2.lang_id = $langID
											AND ph2.id = lph2.phrase_id
											AND lph2.label_id = l.id
											AND lph.orig = 1");		
			}
		}
		else if ( $projectID != 0 )
		{
			if ( $langID == 0 )
			{
				$query = mysql_query("  SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original,  l.created, l.edited
										FROM label l, label_phrase lph, phrase ph, project p, project_label pl
										WHERE lph.label_id = l.id
										AND lph.phrase_id = ph.id
										AND pl.label_id = l.id
										AND pl.project_id = p.id
										and p.id = $projectID
										AND lph.orig = 1");				
			}
			else if ( $langID != 0 )
			{
				$query = mysql_query("  SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original, ph2.phrase AS translation, l.created, l.edited
										FROM phrase ph, label_phrase lph, label l, 
										phrase ph2, label_phrase lph2, project p, project_label pl
										WHERE ph.id = lph.phrase_id 
										AND lph.orig = 1
										AND l.id = lph.label_id
										AND ph2.lang_id = $langID
										AND ph2.id = lph2.phrase_id
										AND lph2.label_id = l.id
										AND pl.label_id = l.id 
										AND pl.project_id = p.id
										AND p.id = $projectID
										AND lph.orig = 1");	
			}
		}
		
		if ( $query ) $result = $utils->createLabelResultVOs( $query ) ;
		else if ( !$query ) $result = $utils->fail( "Query failed while retrieving Labels") ;
		return $result ;
	}
	
	public function getLabelByString($projectID, $langID, $string)
	{
		$utils = new ResultUtils() ;

		if ( $projectID == 0 )
		{
			
			if ( $langID == 0 )
			{
				$query = mysql_query("SELECT l.id as label_id , l.label, l.char_limit, ph.phrase as original, l.created, l.edited
										FROM label l, label_phrase lph, phrase ph
										WHERE lph.label_id = l.id
										AND lph.phrase_id = ph.id
										AND lph.orig = 1
										AND l.label LIKE '%$string%' ");
			}
			else if ( $langID != 0 )
			{
					$query = mysql_query("SELECT l.id as label_id, l.label, l.char_limit, ph.phrase as original, ph2.phrase as translation, l.created, l.edited
											FROM phrase ph, label_phrase lph, label l, 
											phrase ph2, label_phrase lph2
											WHERE ph.id = lph.phrase_id 
											AND lph.orig = 1
											AND l.id = lph.label_id
											AND ph2.lang_id = $langID
											AND ph2.id = lph2.phrase_id
											AND lph2.label_id = l.id
											AND l.label LIKE '%$string%'
											AND lph.orig = 1");
			}
		}
		else if ( $projectID != 0 )
		{
			if ( $langID == 0 )
			{
					$query = mysql_query("SELECT l.id as label_id, l.label, l.char_limit, ph.phrase as original,  l.created, l.edited
											FROM label l, label_phrase lph, phrase ph, project p, project_label pl
											WHERE lph.label_id = l.id
											AND lph.phrase_id = ph.id
											AND pl.label_id = l.id
											AND pl.project_id = p.id
											AND l.label LIKE '%$string%'
											AND p.id = $projectID
											AND lph.orig = 1");
			}
			else if ( $langID != 0 )
			{
					$query = mysql_query("SELECT l.id as label_id, l.label, l.char_limit, ph.phrase as original, ph2.phrase as translation, l.created, l.edited
											FROM phrase ph, label_phrase lph, label l, 
											phrase ph2, label_phrase lph2, project p, project_label pl
											WHERE ph.id = lph.phrase_id 
											AND lph.orig = 1
											AND l.id = lph.label_id
											AND ph2.lang_id = $langID
											AND ph2.id = lph2.phrase_id
											AND lph2.label_id = l.id
											AND pl.label_id = l.id 
											AND pl.project_id = p.id
											AND p.id = $projectID
											AND l.label LIKE '%$string%'
											AND lph.orig = 1");
			}
		}
		
		if ( $query ) $result = $utils->createLabelResultVOs( $query ) ;
		else if ( !$query ) $result = $utils->fail( "Query failed while retrieving Labels") ;
		return $result ;		
	}
	
	// jk: modified to use a left join... aka simplified the query, which seems to fix some bugs we were having
	public function getLabelProject( $labelVO )
	{
		$labelId = $labelVO["label_id"] ;
		$utils = new ResultUtils() ;		

		$query = mysql_query("	SELECT *
								FROM   project LEFT OUTER JOIN project_label ON
									   project_label.project_id = project.id
								WHERE  project_label.label_id = '$labelId' ") ;

		if ( $query ) $result = $utils->createProjectResultVOs( $query ) ;
		else if ( !$query ) $result = $utils->fail( "Query failed while retrieving Projects") ;
		return $result ;
	}
	
	public function getLabelPhrase( $labelVO )
	{		
		$labelId = $labelVO[ "label_id" ];
		$utils = new ResultUtils() ;
		
		$query = mysql_query("	SELECT phrase.phrase as translation, language.eng_name, phrase.edited phrase_edited
								FROM phrase, label_phrase, label, language
								WHERE label_phrase.phrase_id = phrase.id
								AND label_phrase.label_id = label.id
								AND label.id = '$labelId'
								AND phrase.lang_id = language.id
								AND label_phrase.orig = 0") ;
								
		if ( $query ) $result = $utils->createPhraseResultVOs( $query ) ;
		else if ( !$query ) $result = $utils->fail( "Query failed while retrieving Phrases") ;
		return $result ;
	}

	
	
	public function createLabel( $labelVO )
	{		
		$labelName 				= 	$labelVO[ "label_name" ];
		$charLimit 				= 	$labelVO[ "label_char_limit" ];
		$labelID				=	$labelVO[ "label_id" ];
		$newPhrase				=	$labelVO[ "phrase_original" ];
		$editedBy				=	$labelVO[ "edited_by" ];
		$translationLangID		=	$labelVO[ "phrase_translation_id" ];
		$projectID				=	$labelVO[ "project_id" ];
	
		$date = date("Y-m-d H:i", time());
		$timeStamp = $date . " EST " . " by " . $editedBy;
		$returnData = array();
		$utils = new ResultUtils() ;
		
		// insert new label
		$query_1 = mysql_query("INSERT INTO label (label,char_limit,created) VALUES ('$labelName','$charLimit','$timeStamp')");		
		if( !$query_1 ) { $result = $utils->fail( 'Server could not create a label: '.$labelName.'' ) ;}
		else if ( $query_1 )
		{
			// ***** Save this for later down the for success result ***
			$createdLabelID = mysql_insert_id() ; 
			// insert new phrase
			$query_2 = mysql_query("INSERT INTO phrase (lang_id,phrase) VALUES ('$translationLangID','$newPhrase')");  						
			if( !$query_2 ) { $result = $utils->fail( 'Server could not create a new phrase: '.$newPhrase.'' ) ; }
			else if ( $query_2 )
			{
				$createdPhraseID = mysql_insert_id();
				// connect the two tables together ; make entry for orignal language = 1   Adding a new label always makes it an original phrase 
				$query_3 = mysql_query("INSERT INTO label_phrase (label_id,phrase_id,orig) VALUES ('$createdLabelID','$createdPhraseID','1')"); 
				if( !$query_3 ) { $result = $utils->fail( 'Server could not connect the new label ' .$createdLabelID.' with the new phrase '.$createdPhraseID.'' ) ; }
				else if ( $query_3 )
				{	
					//If projectID is -1, this means it is not assigned to any projects; otherwise, it is for a specific project
					if( $projectID != 0 )   																									
					{
						$query_4 = mysql_query("INSERT INTO project_label (project_id ,label_id) VALUES ($projectID ,$createdLabelID)");
						if( !$query_4 ) { $result = $utils->fail( 'Server could not connect the new label '.$createdLabelID.' with a project'.$projectID.'' ) ; }
						else if ( $query_4 ) 
						{ 
							$resultObj = array() ;
							$resultObj["success"] 	= true ;
							$resultObj["timeStamp"] = $timeStamp ;
							$resultObj["label_id"] 	= $createdLabelID ;
							$result = $resultObj ;
						}
					}
					// If phraseID is 0, this means the user wants the label assigned to all projects. ; 
					else if ( $projectID == 0 )
					{
						$projectsToAdd	=	mysql_query(" SELECT * FROM project ") ;
		
						while($row = mysql_fetch_array($projectsToAdd))
						{
							$projectId2 = $row["id"] ;
			
							$query_5 = mysql_query("INSERT INTO project_label (project_id ,label_id) VALUES ($projectId2 ,$createdLabelID)" );
							if(!$query_5) { $result = $utils->fail( 'Server could not connect the new label '.$createdLabelID.' with a project '.$projectId2.'') ; }
						}
						
						$resultObj = array() ;
						$resultObj["success"] 	= true ;
						$resultObj["timeStamp"] = $timeStamp ;
						$resultObj["label_id"] 	= $createdLabelID ;
						$result = $resultObj ;
					}
				}
			}		
		}
		return $result ;																										
	}
	
	public function updateLabel( $labelVO )	
	{
		$labelName 			= 	$labelVO["label_name"];
		$charLimit 			= 	$labelVO["label_char_limit"];
		$labelID			=	$labelVO["label_id"];
		$updatedPhrase		=	$labelVO["phrase_original"];
		$editedBy			=	$labelVO["edited_by"];

		$date = date("Y-m-d H:i", time());
		$timeStamp = $date . " EST " . " by " . $editedBy;
		$utils = new ResultUtils() ;
				
	 	mysql_query("UPDATE label
		 				SET label.label 	= 	'$labelName', 
		 				label.char_limit 	= 	'$charLimit',
						label.edited		=	'$timeStamp'
		 				WHERE label.id 		= 	'$labelID' ");		
				
		$returnedPhraseID = mysql_query("SELECT phrase_id
												FROM 	label_phrase
												WHERE 	label_id = '$labelID'
												AND 	orig = '1' ");
											
		$phraseID = mysql_result($returnedPhraseID, 0);
		

		 
		$query = mysql_query("	UPDATE phrase
			 					SET phrase = '$updatedPhrase'
			 					WHERE phrase.id = $phraseID ");
		
		if($query) { return $timeStamp ; }
		else if ( !$query )	{ $result = $utils->fail('Query failed to updated label') ; }				
	}
	
	public function createLabelPhrase( $labelVO )
	{		
		$labelID			=	$labelVO[ "label_id" ];
		$updatedPhrase		=	$labelVO[ "phrase_translation" ];
		$editedBy			=	$labelVO[ "edited_by" ];
		$projectID			=	$labelVO[ "project_id" ];
		$phraseID			=   $labelVO[ "phrase_translation_id" ];
		
		$date = date("Y-m-d H:i" , time());
		$timeStamp = $date . " EST" . " by " . $editedBy;
		$utils = new ResultUtils() ;
		
		 mysql_query("INSERT INTO phrase 
								(`phrase` ,`lang_id`, `edited`)
								VALUES 
								(	'$updatedPhrase', 
									'$phraseID', 
									'$timeStamp'	)");	
										
		// get back the id of the new entry	
		$returnedPhraseID = mysql_query("	SELECT ph.id 
												FROM phrase ph 
												WHERE ph.lang_id 	= '$phraseID' 
												AND ph.phrase		= '$updatedPhrase' ");
			
		$createdPhraseID = mysql_result( $returnedPhraseID, 0 ) ;
		// insert new label_phrase connecting label to phrase
		 mysql_query("INSERT INTO label_phrase (`label_id` ,`phrase_id`, `orig`) VALUES ('$labelID', '$createdPhraseID', 0)");
				
								
			// add to a project 0 means 'no project' because a project will never have an id of 0 ; NewPhraseEvent defaults project_id to 0
		
			if($projectID != 0)   	
			{
				mysql_query("INSERT INTO `localization`.`project_label` (`project_id` ,`label_id`)VALUES ('$projectID', '$labelID')");
			}
			
		return $timeStamp;
	}
	
	public function updatePhrase($labelVO)
	{
	
		$labelID			=	$labelVO["label_id"];
		$updatedPhrase		=	$labelVO["phrase_translation"];
		$editedBy			=	$labelVO["edited_by"];
		$projectID			=	$labelVO["project_id"];
		$phraseID			=   $labelVO["phrase_translation_id"];
				
		$date = date("Y-m-d H:i", time());
		
		$timeStamp = $date . " EST" . " by " . $editedBy;
		
		$result = mysql_query("UPDATE phrase 
								SET 
								phrase 				= 	'$updatedPhrase',
								edited				=	'$timeStamp'
								WHERE phrase.id 	= 	'$phraseID'");
		
		if($result)
		{
			return $timeStamp;
		}	
	}
	
	public function getLabelProjectPhraseTrans($projectID, $langID)
	{	

		$utils = new ResultUtils() ;

		$query = mysql_query("SELECT t1.id as id, 
									t1.label as name, 
									t1.char_limit, 
									t1.phrase original, 
									t2.phrase as translation, 
									t2.edited as phrase_edited, 
									t2.phrase_id as translation_id
									FROM 
									(SELECT l.id, l.label, ph.phrase, l.char_limit
									FROM label l, phrase ph, label_phrase l_ph, project_label p_l
									WHERE l.id = l_ph.label_id
									AND ph.id = l_ph.phrase_id 
									AND l_ph.orig = 1
									AND p_l.label_id = l.id
									AND p_l.project_id = $projectID) as t1
									LEFT JOIN 
									(SELECT l2.id, ph2.phrase, ph2.edited, ph2.id as phrase_id
									  FROM label l2, phrase ph2, label_phrase l_ph2, project_label p_l2
									  WHERE l2.id=l_ph2.label_id 
									  AND ph2.id = l_ph2.phrase_id
									  AND ph2.lang_id = $langID
									  AND p_l2.label_id = l2.id
									  AND p_l2.project_id = $projectID
									) AS t2
									ON t1.id = t2.id");

		if ( $query ){ $result = $utils->createPhraseResultVOs($query) ; }
		else if ( !$query ) { $result = $utils->fail('Server was unable to retrieve translations.') ; }
		return $result ;
	}
	
	public function deleteLabel($labelID)
	{	
		$utils			= 	new ResultUtils() ;
	
		$query = mysql_query( "DELETE phrase.* , label_phrase.*, label.*, project_label.*
								FROM phrase, label_phrase, label, project_label
								WHERE phrase.id = label_phrase.phrase_id
								AND label_phrase.label_id = label.id
								AND project_label.label_id = label.id
								AND label.id = $labelID") ;
		
		if(!$query) { $result = $utils->fail( 'Server could not properly delete the selected label' ) ; }
		else if ( $query ) { $result = $utils->success('Selected label and its associated phrases have been removed from database') ; }
		
		return $result ;
	}

	public function addLabelToProject( $labelVO )
	{					
		$labelID			=	$labelVO[ "label_id" ];
		$projectID			=	$labelVO[ "project_id" ];	
	
		$utils			= 	new ResultUtils() ;
		// ak: clears out label association from DB in case it is unasssigned ( projectid = -1 )
		mysql_query( "DELETE FROM project_label WHERE project_id = -1 AND label_id = $labelID" ) ;
					
		$query = mysql_query( "INSERT INTO project_label (project_id, label_id) VALUES ($projectID, $labelID)" ) ;
		if ( !$query ) { $result = $utils->fail('Server could not add label: '.$labelID.'\n\nTo project: '.$projectID.'') ; }
		else if ( $query ) { $result = $utils->success( $query ) ; }
		
		return $result ;
	}	

	public function removeLabelFromProject($labelVO)
	{			

		$labelID		=	$labelVO["label_id"] ;
		$projectID		=	$labelVO["project_id"] ;	
		$utils			= 	new ResultUtils() ;
			
		$query = mysql_query("DELETE FROM project_label WHERE project_id = $projectID AND label_id = $labelID");
		if ( !$query ) { $result = $utils->fail('Server could not remove label: '.$labelID.'\n\nFrom project: '.$projectID.'') ; }
		else if ( $query ) { $result = $this->getLabelProject($labelVO) ; }
			
		return  $result ;
	}
}