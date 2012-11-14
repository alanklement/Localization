package com.bss.localization.vo {
	[RemoteClass(alias="LabelVO")]
	[Bindable]
	public class LabelVO {
		public var project_id : int ;
		public var project_name : String ;
		public var label_id : int ;
		public var label_name : String ;
		public var label_char_limit : int ;
		public var phrase_original : String ;
		public var phrase_translation_id : int ;
		public var phrase_translation : String ;
		public var label_created : String ;
		public var label_edited : String ;
		public var edited_by : String ;

		public function LabelVO() {
		}
	}
}