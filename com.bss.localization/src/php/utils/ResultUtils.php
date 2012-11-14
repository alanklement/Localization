<?php

class ResultUtils
{	
	public function fail( $message )
	{
		$resultObj = array() ;
		
		$resultObj[ "success" ] = false ;
		$resultObj[ "message" ] = $message."\n\n".mysql_error() ;
		
		return $resultObj ;
	}
	
	public function success( $queryResult )
	{
		$resultObj = array() ;
		
		$resultObj[ "success" ] = true ;
		$resultObj[ "queryResult" ] = $queryResult ;				
		
		return $resultObj ;
	}
	
	public function createLabelResultVOs( $query )
	{	
		$resultObj 		= array() ;
		$queryResult 	= array() ;
		
		while( $row = mysql_fetch_array( $query ))
		{
			$label 				   			= new LabelVO() ;
			$label->project_id				= $row[ 'project_id' ] ;
		 	$label->project_name			= $row[ 'project_name' ] ;
			$label->label_id 	   			= $row[ 'label_id' ] ;
			$label->label_name 		   		= $row[ 'label' ] ;
			$label->label_char_limit	   	= $row[ 'char_limit' ] ;
			$label->phrase_original	   		= $row[ 'original' ] ;
			$label->phrase_translation_id 	= $row[ 'translation_id' ] ;
			$label->phrase_translation	   	= $row[ 'translation' ] ;
			$label->label_created		 	= $row[ 'created' ] ;
			$label->label_edited		   	= $row[ 'edited' ] ;		  
		
			$queryResult[] = $label ;
		}
				
		$resultObj[ "success" ] = true ;
		$resultObj[ "queryResult" ] = $queryResult ;				
		
		return $resultObj ;
	}
	
	public function createLanguageResultVOs( $query )
	{
		$queryResult 	= array() ;			
		$resultObj 		= array() ;
		
		while ( $row = mysql_fetch_assoc( $query ))
		{
			$language 				   		= new LanguageVO() ;
			$language->language_id			= $row[ 'id' ] ;
			$language->language_code		= $row[ 'code' ] ;
			$language->language_eng_name	= $row[ 'eng_name' ] ;
			$language->language_local_name  = $row[ 'local_name'] ;		
			$queryResult[] = $language ;
		}
		
		$resultObj[ "success" ] = true ;
		$resultObj[ "queryResult" ] = $queryResult ;				
		
		return $resultObj ;
	}
	
	public function createProjectResultVOs( $query )
	{
		$resultObj 		= array() ;
		$queryResult 	= array() ;
		
		while( $row = mysql_fetch_array( $query ))
		{
			$projectVO 				   		= new ProjectVO();
			$projectVO->project_id			= $row['id'];
			$projectVO->project_name		= $row['name'];
			$projectVO->project_code		= $row['code'];
			$projectVO->project_notes	  	= $row['notes'];
			$projectVO->project_created		= $row['created'];
			$projectVO->project_edited		= $row['edited'];		  
		
			$queryResult[] = $projectVO;
		}
				
		$resultObj[ "success" ] = true ;
		$resultObj[ "queryResult" ] = $queryResult ;				
		
		return $resultObj ;
	}
	public function createPhraseResultVOs( $query )
	{		
		$resultObj 		= array() ;
		$queryResult 	= array() ;
		
		while( $row = mysql_fetch_array( $query ))
		{
			$phraseVO 				   			= new PhraseVO() ;
			$phraseVO->label_id					= $row[ 'id' ] ;
			$phraseVO->label_name				= $row[ 'name' ] ;
			$phraseVO->label_char_limit			= $row[ 'char_limit' ] ;
			$phraseVO->label_edited				= $row[ 'edited' ] ;		  
			$phraseVO->phrase_original	  		= $row[ 'original' ] ;
			$phraseVO->phrase_edited	  		= $row[ 'phrase_edited' ] ;
			$phraseVO->phrase_created	  		= $row[ 'created' ] ;
			$phraseVO->phrase_translation		= $row[ 'translation' ] ;
			$phraseVO->phrase_translation_id	= $row[ 'translation_id' ] ;		  
			$phraseVO->lang_eng_name			= $row[ 'eng_name' ] ;		  
		
			$queryResult[] = $phraseVO;
		}
				
		$resultObj[ "success" ] = true ;
		$resultObj[ "queryResult" ] = $queryResult ;				
		
		return $resultObj ;
	}
}