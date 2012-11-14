package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetAllLabelsResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function GetAllLabelsResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				var a : Array = ArrayUtil.toArray(serviceResult.result.queryResult);
				for (var i : int = 0;i < a.length;i++) {
					a[ i ].phrase_original = unescape(a [ i ].phrase_original);
					a[ i ].phrase_translation = unescape(a [ i ].phrase_translation);
				}
				ModelLocator.getInstance().returnedLabels = new ArrayCollection(ArrayUtil.toArray(a));
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			} else {
				Alert.show("An unknown error has occoured") ;
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your\n\n GetAllLabel \n\nrequest");
		}
	}
}