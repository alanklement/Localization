package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.LabelReportDelegate;
	import com.bss.localization.events.LabelReportEvent;
	import com.bss.localization.responder.labelReport.LabelReportResp;

	public class LabelReportCommand implements ICommand {
		// responders
		private var _labelReport : LabelReportResp = new LabelReportResp();

		public function LabelReportCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var labelReportEvent : LabelReportEvent = $evt as LabelReportEvent ;

			switch ( labelReportEvent.type ) {
				case 'GET_LABEL_REPORT':
					var getLabelReportDelegate : LabelReportDelegate = new LabelReportDelegate(_labelReport) ;
					getLabelReportDelegate.getLabelReport(labelReportEvent.labels) ;
					// projectEvent.projectVO
					break;
			}
		}
	}
}