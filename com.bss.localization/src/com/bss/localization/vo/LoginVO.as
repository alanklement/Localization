package com.bss.localization.vo {
	[RemoteClass(alias="LoginVO")]
	[Bindable]
	public class LoginVO {
		public var username : String ;
		public var password : String ;
		public var projectID : int ;
		public var group : String ;

		public function LoginVO() {
		}
	}
}