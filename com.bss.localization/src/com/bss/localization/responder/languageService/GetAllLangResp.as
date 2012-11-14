package com.bss.localization.responder.languageService {
	import com.bss.localization.model.ModelLocator;
	import com.bss.localization.utils.PromptArrayCollection;
	import com.bss.localization.vo.LanguageVO;

	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetAllLangResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance() ;

		public function GetAllLangResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				var languages : ArrayCollection = new ArrayCollection(ArrayUtil.toArray(serviceResult.result.queryResult)) ;
				var reinsertEnglish : LanguageVO ;

				for ( var i : int = 0 ; i < languages.length ; i++ ) {
					if ( languages[i].language_eng_name == "English" ) {
						reinsertEnglish = languages[i] ;
						languages.removeItemAt(i) ;
						break ;
					}
				}

				var sortLanguages : Sort = new Sort() ;
				sortLanguages.fields = [new SortField("language_eng_name", true)] ;
				languages.sort = sortLanguages ;

				languages.refresh() ;
				var sortedLangauges : ArrayCollection = new PromptArrayCollection([reinsertEnglish], languages) ;

				_modelLocator.allLanguages = sortedLangauges ;
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			}
		}

		public function fault(info : Object) : void {
			Alert.show("An unknown Error has occurred") ;
		}
	}
}