package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.vo.CopyDeckVO;

	public class CopyDeckEvent extends CairngormEvent {
		public static const GET_ORIGINAL_TRANSLATION : String = 'GET_ORIGINAL_TRANSLATION' ;
		public var projectID : int ;
		public var langID : int ;
		public var copyDeckVO : CopyDeckVO ;

		public function CopyDeckEvent($type : String, $projectID : int, $langID : int, $copyDeckVO : CopyDeckVO) {
			projectID = $projectID ;
			langID = $langID ;
			copyDeckVO = $copyDeckVO ;
			super(type) ;
		}
	}
}