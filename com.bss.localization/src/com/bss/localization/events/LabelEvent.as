package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.LabelVO;

	import flash.events.Event;

	public class LabelEvent extends CairngormEvent {
		public static const GET_ALL_LABEL : String = 'GET_ALL_LABEL' ;
		public static const GET_LABEL_PROJECT : String = 'GET_LABEL_PROJECT' ;
		public static const GET_LABEL_PHRASE : String = 'GET_LABEL_PHRASE' ;
		public static const GET_LABEL_PROJECT_PHRASE_TRANS : String = 'GET_LABEL_PROJECT_PHRASE_TRANS' ;
		public static const GET_LABEL_BY_STRING : String = 'GET_LABEL_BY_STRING' ;
		public static const UPDATE_LABEL : String = 'UPDATE_LABEL' ;
		public static const CREATE_LABEL : String = 'CREATE_LABEL' ;
		public static const CREATE_LABEL_PHRASE : String = 'CREATE_LABEL_PHRASE' ;
		public static const UPDATE_LABEL_PHRASE : String = 'UPDATE_LABEL_PHRASE' ;
		public static const ADD_LABEL_TO_PROJECT : String = 'ADD_LABEL_TO_PROJECT' ;
		public static const REMOVE_LABEL_FROM_PROJECT : String = 'REMOVE_LABEL_FROM_PROJECT' ;
		public static const DELETE_LABEL : String = 'DELETE_LABEL' ;
		public var labelVO : LabelVO ;
		// ak these are search params
		public var projectID : int ;
		public var langID : int ;
		public var searchString : String ;

		public function LabelEvent($type : String, $projectID : int, $langID : int, $labelVO : LabelVO = null, $searchString : String = null) {
			projectID = $projectID ;
			langID = $langID ;
			labelVO = $labelVO ;
			searchString = $searchString ;
			super($type) ;
		}

		override public function clone() : Event {
			return new LabelEvent(LabelEvent.GET_LABEL_BY_STRING, langID, langID, labelVO, searchString) ;
		}
	}
}


