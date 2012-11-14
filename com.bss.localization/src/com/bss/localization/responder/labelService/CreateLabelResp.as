package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class CreateLabelResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function CreateLabelResp() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if ( serviceResult.result.success ) {
				Alert.show("Label Created");

				if ( _modelLocator.itemForConfirmation.project_id == _modelLocator.currentProjectSearch || _modelLocator.itemForConfirmation.project_id == 0 || _modelLocator.currentProjectSearch == 0) {
					_modelLocator.itemForConfirmation.label_id = serviceResult.result.label_id;
					_modelLocator.itemForConfirmation.label_created = serviceResult.result.timeStamp;
					unescape(_modelLocator.itemForConfirmation.phrase_original);

					_modelLocator.returnedLabels.addItem(_modelLocator.itemForConfirmation);
				}
			} else if ( !serviceResult.result.success ) {
				Alert.show("Label was not created sucessfully\n\n" + serviceResult.result.message);
			}
		}

		public function fault(info : Object) : void {
			var serviceResult : FaultEvent = info as FaultEvent;

			Alert.show("The server could not process your \n\nCreate Label\nrequest" + serviceResult.message);
		}
	}
}