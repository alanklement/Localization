package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetLabelPhraseResp implements IResponder {
		public function GetLabelPhraseResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent ;

			if ( serviceResult.result.success ) {
				var a : Array = ArrayUtil.toArray(serviceResult.result.queryResult) ;

				if ( a.length == 0 ) {
					ModelLocator.getInstance().returnedLabelPhrase = null ;
				}

				var sortLang : Sort = new Sort() ;

				sortLang.fields = [new SortField("lang_eng_name", true)] ;
				sortLang.sort(a) ;

				for (var i : int = 0;i < a.length;i++) {
					a[i].phrase_translation = unescape(a[i].phrase_translation) ;
					// this checks to see if an entry in the database is the string 'null'  if so it converts it to null
					if ( a[i].phrase_translation == "null" ) {
						a[i].phrase_translation = null ;
					}

					ModelLocator.getInstance().returnedLabelPhrase = new ArrayCollection(a) ;
				}
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your\n\nLabel phrase\n\n request");
		}
	}
}