package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.UserVO;

	import mx.rpc.IResponder;

	public class UserDelegate {
		private var _responder : IResponder;
		private var _service : Object;

		public function UserDelegate($responder : IResponder) {
			_responder = $responder;
			_service = ServiceLocator.getInstance().getRemoteObject("userService");
		}

		public function getAdmins() : void {
			var call : Object = _service.getAdmins();
			call.addResponder(_responder);
		}

		public function getClients() : void {
			var call : Object = _service.getClients();
			call.addResponder(_responder);
		}
	}
}