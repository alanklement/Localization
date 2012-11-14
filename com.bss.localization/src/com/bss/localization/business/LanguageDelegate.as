package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.LanguageVO;

	import mx.rpc.IResponder;

	public class LanguageDelegate {
		private var _responder : IResponder ;
		private var _service : Object ;

		public function LanguageDelegate($responder : IResponder) {
			_responder = $responder;
			_service = ServiceLocator.getInstance().getRemoteObject("languageService");
		}

		public function getAllLanguage() : void {
			var call : Object = _service.getAllLanguage();
			call.addResponder(_responder);
		}

		public function createLanguage($languageVO : LanguageVO) : void {
			var call : Object = _service.createLanguage($languageVO);
			call.addResponder(_responder);
		}
	}
}