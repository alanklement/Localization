package com.bss.localization.vo {
	[Bindable]
	[RemoteClass(alias="UserVO")]
	public class UserVO {
		public var id : int		;
		public var username : String	;
		public var password : String	;
		public var last_login : String	;
		public var user_id : int		;
		public var usertype_id : int		;
		public var project_name : String  ;
		public var project_id : int     ;

		public function UserVO() {
		}
	}
}