package com.bss.localization.responder.projectService {
	import com.bss.localization.model.ModelLocator;
	import com.bss.localization.utils.PromptArrayCollection;
	import com.bss.localization.vo.LanguageVO;

	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetProjectLangResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function GetProjectLangResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent ;

			if ( serviceResult.result.success ) {
				var languages : ArrayCollection = new ArrayCollection(ArrayUtil.toArray(serviceResult.result.queryResult)) ;

				if ( _modelLocator.currentState == ModelLocator.ADMIN_STATE ) {
					switch ( _modelLocator.currentAdminView ) {
						case ModelLocator.ADMIN_VIEW_PROJECT 	:
							_modelLocator.projectLanguage = languages;
							break ;
						case ModelLocator.ADMIN_VIEW_LABEL 		:
							_modelLocator.projectLanguageSearch = _resortForAdminLabelView(languages)/* _resortForAdminView(languages) */ ;
							break ;
						case ModelLocator.ADMIN_VIEW_COPYDECK 	:
							_modelLocator.copyDeckProjectLang = _resortForAdminView(languages) ;
							break ;
					}
				} else if (  _modelLocator.currentState == ModelLocator.CLIENT_STATE ) {
					_modelLocator.clientLanguages = _resortForClientView(languages) ;
				}
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message.toString()) ;
			} else {
				Alert.show("An Unknown error has occured, check if server has fault") ;
			}
		}

		private function _resortForAdminLabelView($array : ArrayCollection) : ArrayCollection {
			var ac : ArrayCollection = $array ;

			var allLanguagePrompt : LanguageVO = new LanguageVO() ;
			allLanguagePrompt.language_eng_name = "All Languages" ;
			allLanguagePrompt.language_id = 0 ;

			var reinsertEnglish : LanguageVO ;

			for ( var i : int = 0 ; i < ac.length ; i++ ) {
				if (ac[i].language_eng_name == "English") {
					reinsertEnglish = ac[i]
					ac.removeItemAt(i);
					break;
				}
			}

			return new PromptArrayCollection([allLanguagePrompt, reinsertEnglish], ac);
		}

		private function _resortForAdminView($array : ArrayCollection) : ArrayCollection {
			var ac : ArrayCollection = $array ;

			var reinsertEnglish : LanguageVO;

			for ( var i : int = 0 ; i < ac.length ; i++ ) {
				if (ac[i].language_eng_name == "English") {
					reinsertEnglish = ac[i]
					ac.removeItemAt(i);
					break;
				}
			}

			return new PromptArrayCollection([reinsertEnglish], ac);
		}

		private function _resortForClientView($array : ArrayCollection) : ArrayCollection {
			var ac : ArrayCollection = $array ;

			for ( var i : int = 0 ; i < ac.length ; i++ ) {
				if (ac[i].language_eng_name == "English") {
					ac.removeItemAt(i);
					break;
				}
			}
			return ac ;
		}

		public function fault($obj : Object) : void {
			var  serviceResult : FaultEvent = $obj as FaultEvent ;

			Alert.show("There was an unknown error. \n" + serviceResult.fault) ;
		}
	}
}