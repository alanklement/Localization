package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class CreateLabelPhraseResp implements IResponder {
		public function CreateLabelPhraseResp() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if ( serviceResult.result.success ) {
				var a : Array = ArrayUtil.toArray(serviceResult.result.queryResult);

				ModelLocator.getInstance().selectedPhrase.phrase_edited = a[0].phrase_edited;
				ModelLocator.getInstance().selectedPhrase.phrase_translation_id = a[0].phrase_translation_id ;
			} else if ( !serviceResult.result.success ) {
				Alert.show("Translation was not created sucessfully");
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not\n\nCreate Translation\n")
		}
	}
}