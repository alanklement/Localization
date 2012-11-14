package com.bss.localization.model {
	import com.adobe.cairngorm.model.IModelLocator;
	import com.bss.localization.events.LabelEvent;
	import com.bss.localization.vo.LabelVO;
	import com.bss.localization.vo.LanguageVO;
	import com.bss.localization.vo.PhraseVO;
	import com.bss.localization.vo.ProjectVO;
	import com.bss.localization.vo.UserVO;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class ModelLocator implements IModelLocator {
		public static const EXPORT_SERVICE_URL : String = "http://localize.bigspaceship.com/php/export.php" ;
		// Navigation
		public static const ADMIN_STATE : uint = 1	;
		public static const CLIENT_STATE : uint = 4	;
		public static const ADMIN_VIEW_PROJECT : int = 0 ;
		public static const ADMIN_VIEW_LABEL : int = 1 ;
		public static const ADMIN_VIEW_COPYDECK : int = 2 ;
		public var currentState : uint = 0	;
		public var userLoggedIn : Boolean = false ;
		public var showLinkBar : Boolean = false ;
		public var currentAdminView : int	;
		// Data accessed by multiple views:
		public var projects : ArrayCollection ;
		public var selectedProject : ProjectVO ;
		public var selectedProjectIndex : int ;
		public var selectedPhrase : PhraseVO ;
		public var allLanguages : ArrayCollection ;
		public var projectLanguage : ArrayCollection = new ArrayCollection() ;
		// Data accessed by LABEL view only:
		public var lastLabelQuery : LabelEvent ;
		public var projectLanguageSearch : ArrayCollection = new ArrayCollection() ;
		public var projectToBeDeletedFrom : ProjectVO ;
		public var returnedLabelProject : ArrayCollection ;
		public var returnedLabelPhrase : ArrayCollection ;
		public var removeFromView : Boolean ;
		// LabelReport as well
		public var returnedLabels : ArrayCollection = new ArrayCollection() ;
		// For Label Report Only:
		public var longestLabel : ArrayCollection ;
		// Copy Deck Data
		public var copyDeckVisible : Boolean ;
		public var copyDeckProjectLang : ArrayCollection ;
		public var selectedCopyDeckProject : ProjectVO
		public var gridEditable : Boolean ;
		// Data for CLIENT DECK
		public var clientProject : ProjectVO ;
		public var clientLanguages : ArrayCollection ;
		public var clientReturnedPhrases : ArrayCollection ;
		public var selectedClientLanguage : LanguageVO ;
		// TODO: Sort this in above catagories
		// public var labelTranslation							:	ArrayCollection ;
		public var selectedLanguage : LanguageVO ;
		public var selectedLabel : LabelVO ;
		public var returnedPhraseProjectLang : ArrayCollection ;
		public var copyDeckData : ArrayCollection ;
		public var currentUser : String ;
		public var itemForConfirmation : Object ;
		public var itemForConfirmationIndex : int ;
		public var currentProjectSearch : int ;
		public var removeFromDGIndex : int ;
		public var removeLabelFromUnassigned : Boolean ;
		public var addLabelToProjectCBEnabled : Boolean ;
		public var removeLabelFromProjectCBEnabled : Boolean;
		public var addLabelToProjectCB_DP : ArrayCollection ;
		// Data accessed by USERS only:
		public var admins : ArrayCollection ;
		public var clients : ArrayCollection ;
		public var selectedUser : UserVO ;
		private static var _instance : ModelLocator ;

		public static function getInstance() : ModelLocator {
			if ( _instance == null ) {
				_instance = new ModelLocator() ;
			}
			return _instance ;
		}

		public function ModelLocator() {
			if ( _instance != null ) throw new Error("Error: Use getInstance() method");
			ModelLocator._instance = this ;
		}
	}
}