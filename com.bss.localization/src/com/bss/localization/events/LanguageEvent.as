package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.LanguageVO;

	import flash.events.Event;

	public class LanguageEvent extends CairngormEvent {
		public static const GET_ALL_LANGUAGE : String = 'GET_ALL_LANGUAGE';
		// public static const GET_LANGUAGE				:String='GET_LANGUAGE';
		public static const CREATE_LANGUAGE : String = 'CREATE_LANGUAGE';
		// public static const UPDATE_LANGUAGE				:String='UPDATE_LANGUAGE';
		// public static const DELETE_LANGUAGE				:String='DELETE_LANGUAGE';
		// public static const SELECT_LANGUAGE				:String='SELECT_LANGUAGE';
		public var languageVO : LanguageVO;

		public function LanguageEvent($type : String, $languageVO : LanguageVO = null) {
			languageVO = $languageVO ;
			super($type) ;
		}

		override public function clone() : Event {
			return new LanguageEvent(LanguageEvent.GET_ALL_LANGUAGE, languageVO) ;
		}
	}
}
