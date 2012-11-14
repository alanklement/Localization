package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class DeleteLabelResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance() ;

		public function DeleteLabelResp() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if ( serviceResult.result.success ) {
				_modelLocator.returnedLabels.removeItemAt(_modelLocator.removeFromDGIndex) ;
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message);
			}
		}

		public function fault(info : Object) : void {
			var serviceResult : FaultEvent = info as FaultEvent;

			Alert.show("The server could not process your \n\nDelete Label\nrequest" + serviceResult.message);
		}
	}
}