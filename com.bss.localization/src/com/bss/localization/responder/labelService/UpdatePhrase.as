package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class UpdatePhrase implements IResponder {
		public function UpdatePhrase() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if (serviceResult.result) {
				ModelLocator.getInstance().selectedPhrase.phrase_edited = serviceResult.result.toString();
			} else if (!serviceResult.result) {
				Alert.show("Phrase was not updated sucessfully");
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not \n\nUpdate Phrase\n");
		}
	}
}