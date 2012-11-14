<?php

	require_once( "./utils/connect.php" ) ;
	require_once( "./vo/LabelReportVO.php" ) ;
	require_once( "./utils/ResultUtils.php" ) ;
	
	class LabelReportService
	{
		public function __construct() {}
		
		public function getLabelReport ( $labels )
		{

			$count = count( $labels ) ;
			$utils = new ResultUtils();
			$reportCollection = array() ;	
			
			for ( $counter = 0 ; $counter < $count ; $counter ++ )
			{
				$id = $labels[$counter] ;
				
				$query = mysql_query( "SELECT t1.label, t1.original, t2.phrase, t2.eng_name
										from
										   ( select l.id, l.label, ph.phrase as original
												from label l, phrase ph, label_phrase l_ph
												where l.id = l_ph.label_id
												and l_ph.phrase_id = ph.id
												and l.id = $id 
												and l_ph.orig = 1) as t1
										 left JOIN
										    ( select l.id, ph.phrase, lang.eng_name
												from label l, phrase ph, label_phrase l_ph, language lang
												where l.id = l_ph.label_id
												and l_ph.phrase_id = ph.id
												and ph.lang_id = lang.id
												and l.id = $id ) as t2
											on t1.id = t2.id") ;
				
				if ( !$query )
				{
					$result = $utils->fail( "Querry Fails at phrase id ".$id."") ;
					return $result ;
				}
				
				$subArray = array() ;
											
				while ( $row = mysql_fetch_array ( $query ) )
				{
					$report					=	    new LabelReportVO() ;
					$report->label			=	    $row[ 'label' ] ;
					$report->original		=	    $row[ 'original' ] ;
					$report->phrase			=	    $row[ 'phrase' ] ;
					$report->eng_name		=	    $row[ 'eng_name' ] ;
				                                   
					$subArray[]				=	    $report ;
				}
				
				$reportCollection[] = $subArray ;
			}			

			$result = $utils->success( $reportCollection ) ;
			return $result ;
		}
	}