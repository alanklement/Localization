package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.ProjectVO;

	import flash.events.Event;

	public class ProjectEvent extends CairngormEvent {
		public static const GET_ALL_PROJECT : String = 'GET_ALL_PROJECT' ;
		public static const GET_PROJECT : String = 'GET_PROJECT' ;
		public static const CREATE_PROJECT : String = 'CREATE_PROJECT' ;
		public static const UPDATE_PROJECT : String = 'UPDATE_PROJECT' ;
		public static const DELETE_PROJECT : String = 'DELETE_PROJECT' ;
		public static const ADD_LANGUAGE : String = 'ADD_LANGUAGE' ;
		public static const REMOVE_LANGUAGE : String = 'REMOVE_LANGUAGE' ;
		public static const GET_PROJECT_LANGUAGE : String = 'GET_PROJECT_LANGUAGE' ;
		public static const SELECT_PROJECT : String = 'SELECT_PROJECT' ;
		public var projectVO : ProjectVO ;

		public function ProjectEvent($type : String, $projectVO : ProjectVO = null) {
			projectVO = $projectVO ;
			super($type) ;
		}

		override public function clone() : Event {
			return new ProjectEvent(ProjectEvent.UPDATE_PROJECT, projectVO) ;
		}
	}
}
