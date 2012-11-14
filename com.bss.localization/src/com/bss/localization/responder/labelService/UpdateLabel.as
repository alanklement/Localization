package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class UpdateLabel implements IResponder {
		public function UpdateLabel() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if (serviceResult.result) {
				// returns date
				ModelLocator.getInstance().selectedLabel.label_edited = serviceResult.result.toString();
			} else if (!serviceResult.result) {
				Alert.show("Label was not update sucessfully");
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your \n\nUpdate Label\nrequest");
		}
	}
}