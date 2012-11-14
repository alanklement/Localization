<?php

class QueryUtils
{
	// public function query1()
	// 	{		
	// 		$utils = new ResultUtils() ;
	// 	
	// 		$query = mysql_query("SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original
	// 		 			 										FROM label l, project_label p_l, label_phrase l_ph, phrase ph
	// 		 			 										WHERE p_l.label_id = l.id
	// 		 			 										AND p_l.project_id = -1
	// 		 			 										AND l_ph.label_id = l.id
	// 		 			 										AND l_ph.phrase_id = ph.id
	// 		 			 										AND l_ph.orig = 1");
	// 			
	// 		if ( $query ) $result = $utils->createLabelSearchVOs( $query ) ;
	// 		else $result = $utils->fail( "Query failed while retrieving:"."\n\n"."Unassigned Labels ") ;	
	// 		return $result ;
	// 	}
	// 
	// 	public function query2()
	// 	{
	// 		$utils = new ResultUtils() ;
	// 	
	// 		$query = mysql_query("SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original, ph2.phrase as translation, l.created, l.edited
	// 								FROM phrase ph, label_phrase lph, label l, 
	// 								phrase ph2, label_phrase lph2, project p, project_label pl
	// 								WHERE ph.id = lph.phrase_id 
	// 								AND lph.orig = 1
	// 								AND l.id = lph.label_id
	// 								AND ph2.lang_id = $langID
	// 								AND ph2.id = lph2.phrase_id
	// 								AND lph2.label_id = l.id
	// 								AND pl.label_id = l.id 
	// 								AND pl.project_id = p.id
	// 								AND p.id = -1
	// 								AND lph.orig = 1");
	// 			
	// 		if ( $query ) $result = $utils->createLabelSearchVOs( $query ) ;
	// 		else $result = $utils->fail( "Query failed while retrieving:"."\n\n"."Unassigned Labels ") ;	
	// 		return $result ;
	// 	}
	// 
	// 	public function query3( $projectID )
	// 	{
	// 		$utils = new ResultUtils() ;
	// 	
	// 		$query = mysql_query("SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original,  l.created, l.edited
	// 								FROM label l, label_phrase lph, phrase ph, project p, project_label pl
	// 								WHERE lph.label_id = l.id
	// 								AND lph.phrase_id = ph.id
	// 								AND pl.label_id = l.id
	// 								AND pl.project_id = p.id
	// 								and p.id = $projectID
	// 								AND lph.orig = 1");
	// 			
	// 		if ( $query ) $result = $utils->createLabelSearchVOs( $query ) ;
	// 		else $result = $utils->fail( "Query failed while retrieving:"."\n\n"." Labels for project ID: ".$projectID."") ;	
	// 		return $result ;
	// 	}
	// 
	// 	public function query4( $projectID, $langID )
	// 	{
	// 		$utils = new ResultUtils() ;
	// 	
	// 		$query = mysql_query("SELECT l.id AS label_id, l.label, l.char_limit, ph.phrase AS original, ph2.phrase AS translation, l.created, l.edited
	// 								FROM phrase ph, label_phrase lph, label l, 
	// 								phrase ph2, label_phrase lph2, project p, project_label pl
	// 								WHERE ph.id = lph.phrase_id 
	// 								AND lph.orig = 1
	// 								AND l.id = lph.label_id
	// 								AND ph2.lang_id = $langID
	// 								AND ph2.id = lph2.phrase_id
	// 								AND lph2.label_id = l.id
	// 								AND pl.label_id = l.id 
	// 								AND pl.project_id = p.id
	// 								AND p.id = $projectID
	// 								AND lph.orig = 1");	
	// 			
	// 		if ( $query ) $result = $utils->createLabelSearchVOs( $query ) ;
	// 		else $result = $utils->fail( "Query failed while retrieving:"."\n\n"." Labels for project ID: ".$projectID."") ;	
	// 		return $result ;
	// 	}
}