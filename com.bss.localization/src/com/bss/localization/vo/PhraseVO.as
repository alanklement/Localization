package com.bss.localization.vo {
	[Bindable]
	[RemoteClass(alias="PhraseVO")]
	public class PhraseVO {
		public var label_id : int ;
		public var label_name : String ;
		public var label_char_limit : int ;
		public var label_edited : String ;
		public var phrase_original : String ;
		public var phrase_edited : String ;
		public var phrase_created : String ;
		public var phrase_translation : String ;
		public var phrase_translation_id : int ;
		public var lang_eng_name : String ;

		public function PhraseVO() {
		}
	}
} 