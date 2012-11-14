package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.CopyDeckDelegate;
	import com.bss.localization.events.CopyDeckEvent;
	import com.bss.localization.responder.copyDeckService.CopyDeckResponder;

	// This class is not in use.  If the copy deck grows, then this can be added and expanded
	public class CopyDeckCommand implements ICommand {
		private var _getAllResponder : CopyDeckResponder = new CopyDeckResponder();

		public function CopyDeckCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var copyDeckEvent : CopyDeckEvent = $evt as CopyDeckEvent ;

			switch( copyDeckEvent.type ) {
				case 'GET_ORIGINAL_TRANSLATION':
					var _getOriginalTranslation : CopyDeckDelegate = new CopyDeckDelegate(_getAllResponder) ;
					_getOriginalTranslation.getOriginalTranslation(copyDeckEvent.projectID, copyDeckEvent.langID, copyDeckEvent.copyDeckVO);
					// projectEvent.projectVO
					break;
			}
		}
	}
}