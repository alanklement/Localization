package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.LanguageDelegate;
	import com.bss.localization.events.LanguageEvent;
	import com.bss.localization.responder.languageService.CreateLanguageResp;
	import com.bss.localization.responder.languageService.GetAllLangResp;

	public class LanguageCommand implements ICommand {
		private var _getAllResponder : GetAllLangResp = new GetAllLangResp() ;
		private var _createLanguage : CreateLanguageResp = new CreateLanguageResp() ;

		public function LanguageCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var languageEvent : LanguageEvent = $evt as LanguageEvent;

			switch( languageEvent.type ) {
				case 'GET_ALL_LANGUAGE':
					var getAllLanguageDelegate : LanguageDelegate = new LanguageDelegate(_getAllResponder);
					getAllLanguageDelegate.getAllLanguage();
					break;
				case 'CREATE_LANGUAGE':
					var createDelegate : LanguageDelegate = new LanguageDelegate(_createLanguage);
					createDelegate.createLanguage(languageEvent.languageVO);
					break;
			}
		}
	}
}