package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.UserVO;

	import flash.events.Event;

	public class UserEvent extends CairngormEvent {
		public static const GET_ADMINS : String = 'GET_ADMINS'	;
		public static const GET_CLIENTS : String = 'GET_CLIENTS'	;
		public static const UPDATE_USER : String = 'UPDATE_USER'	;
		public static const CREATE_USER : String = 'CREATE_USER'	;
		public static const DELETE_USER : String = 'DELETE_USER'	;
		public var userVO : UserVO ;
		public var id : int ;
		public var username : String ;
		public var password : String ;
		public var last_login : String ;
		public var user_id : int ;
		public var usertype_id : int ;
		public var project_id : int ;

		public function UserEvent($type : String, $userVO : UserVO = null) {
			userVO = $userVO ;
			super($type) ;
		}

		override public function clone() : Event {
			return new UserEvent(UserEvent.GET_ADMINS, userVO) ;
		}
	}
}