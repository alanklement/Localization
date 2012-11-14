package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.LoginVO;

	import mx.rpc.IResponder;

	public class LoginDelegate {
		private var _responder : IResponder;
		private var _service : Object;

		public function LoginDelegate($responder : IResponder) {
			_responder = $responder
			_service = ServiceLocator.getInstance().getRemoteObject("loginService");
		}

		public function login($loginVO : LoginVO) : void {
			var call : Object = _service.login($loginVO);
			call.addResponder(_responder);
		}
	}
}