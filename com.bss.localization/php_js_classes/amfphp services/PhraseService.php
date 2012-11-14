<?php

require_once( "./vo/PhraseVO.php") ;
require_once( "./utils/connect.php" ) ;
require_once( "./utils/ResultUtils.php" ) ;

class PhraseService
{	
	public function __construct() {}
	
	public function getPhraseByLanguage( $projectID, $langID )
	{	
		$phrases = array();

		$query = mysql_query("SELECT t1.id as label_id, t1.label, t1.char_limit, t1.phrase original, t2.phrase as translation, t2.edited, t2.phrase_id
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
		
		while( $row = mysql_fetch_array( $query ) )
		{
			$phrase 				   			= new PhraseVO();
			$phrase->label_id					= $row['label_id'];
			$phrase->label_name					= $row['label'];
			$phrase->label_char_limit			= $row['char_limit'];
			$phrase->phrase_original			= $row['original'];
			$phrase->phrase_translation			= $row['translation'];
			$phrase->label_edited				= $row['edited'];
			$phrase->phrase_translation_id		= $row['phrase_id'];	  
		
			$phrases[] = $phrase;
		}
		
		return $phrases;	
	}
}