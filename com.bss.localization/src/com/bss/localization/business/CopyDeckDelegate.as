package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.CopyDeckVO;

	import mx.rpc.IResponder;

	public class CopyDeckDelegate {
		private var _responder : IResponder;
		private var _service : Object;

		public function CopyDeckDelegate($responder : IResponder) {
			_responder = $responder
			_service = ServiceLocator.getInstance().getRemoteObject("copyDeckService");
		}

		public function getOriginalTranslation($projectID : int, $langID : int, $copyDeckVO : CopyDeckVO) : void {
			var call : Object = _service.getOriginalTranslation($projectID, $langID, $copyDeckVO);
			call.addResponder(_responder);
		}
	}
}