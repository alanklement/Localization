package com.bss.localization.events {
	import com.adobe.cairngorm.control.CairngormEvent;

	import flash.events.Event;

	public class LabelReportEvent extends CairngormEvent {
		public static const GET_LABEL_REPORT : String = 'GET_LABEL_REPORT' ;
		public var labels : Array ;
		public var typeStr : String ;

		public function LabelReportEvent($type : String, $labels : Array) {
			typeStr = $type ;
			labels = $labels ;
			super($type) ;
		}

		override public function clone() : Event {
			return new LabelReportEvent(typeStr, labels);
		}
	}
}
