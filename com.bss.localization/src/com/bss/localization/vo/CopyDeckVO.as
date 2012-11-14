package com.bss.localization.vo {
	[RemoteClass(alias="CopyDeckVO")]
	[Bindable]
	public class CopyDeckVO {
		public var label_id : int ;
		public var label : String ;
		public var char_limit : int ;
		public var original : String ;
		public var translation : String ;
		public var edited : String ;
		public var phrase_id : int ;

		public function CopyDeckVO() {
		}
	}
}