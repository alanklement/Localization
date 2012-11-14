package com.bss.localization.responder.userService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetAdminsResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function GetAdminsResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				_modelLocator.admins = new ArrayCollection(ArrayUtil.toArray(serviceResult.result.queryResult));
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message);
			}
		}

		public function fault($evt : Object) : void {
			var  serviceResult : FaultEvent = $evt as FaultEvent;

			Alert.show("Connection Refused\n\n" + serviceResult.fault, 'Connection Error');
		}
	}
}