package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetLabelProjectPhraseTrans implements IResponder {
		public function GetLabelProjectPhraseTrans() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				var returnedLabels : ArrayCollection = new ArrayCollection(ArrayUtil.toArray(serviceResult.result.queryResult));

				for (var i : int = 0;i < returnedLabels.length;i++) {
					returnedLabels[i].phrase_original = unescape(returnedLabels[i].phrase_original);
					returnedLabels[i].phrase_translation = unescape(returnedLabels[i].phrase_translation);

					if ( returnedLabels[i].phrase_translation == "null" ) {
						returnedLabels[i].phrase_translation = null ;
					}
				}

				var sortLanguages : Sort = new Sort();
				sortLanguages.fields = [new SortField("label_name", true)];
				returnedLabels.sort = sortLanguages;

				returnedLabels.refresh();

				if ( ModelLocator.getInstance().currentState == ModelLocator.ADMIN_STATE ) {
					ModelLocator.getInstance().returnedPhraseProjectLang = returnedLabels ;
				} else if ( ModelLocator.getInstance().currentState == ModelLocator.CLIENT_STATE ) {
					ModelLocator.getInstance().clientReturnedPhrases = returnedLabels ;
				}
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your \n\nProject's labels' translation\nrequest");
		}
	}
}