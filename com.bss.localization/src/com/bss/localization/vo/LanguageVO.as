package com.bss.localization.vo {
	[RemoteClass(alias="LanguageVO")]
	[Bindable]
	public class LanguageVO {
		public var language_id : int ;
		public var language_local_name : String ;
		public var language_code : String ;
		public var language_eng_name : String ;

		public function LanguageVO() {
		}
	}
}