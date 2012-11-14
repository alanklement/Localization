package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetLabelByStringResp implements IResponder {
		public function GetLabelByStringResp() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if ( serviceResult.result.success ) {
				var a : Array = ArrayUtil.toArray(serviceResult.result.queryResult);
				for (var i : int = 0;i < a.length;i++) {
					a[ i ].phrase_original = unescape(a [ i ].phrase_original);
					a[ i ].phrase_translation = unescape(a [ i ].phrase_translation);
				}

				ModelLocator.getInstance().returnedLabels = new ArrayCollection(ArrayUtil.toArray(a));
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your\n\n GetLabelByString \n\nrequest");
		}
	}
}
