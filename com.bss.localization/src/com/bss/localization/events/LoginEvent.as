package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.LoginVO;

	import flash.events.Event;

	public class LoginEvent extends CairngormEvent {
		public static const LOGIN : String = "LOGIN" ;
		public var loginVO : LoginVO ;

		public function LoginEvent($type : String, $loginVO : LoginVO) {
			loginVO = $loginVO ;
			super($type) ;
		}

		override public function clone() : Event {
			return new LoginEvent(type, loginVO) ;
		}
	}
}