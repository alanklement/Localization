package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.LabelDelegate;
	import com.bss.localization.events.LabelEvent;
	import com.bss.localization.responder.labelService.*;

	public class LabelCommand implements ICommand {
		// public var _modelLocator:ModelLocator = ModelLocator.getInstance();
		// responders
		private var _getAllLabel : GetAllLabelsResp = new GetAllLabelsResp();
		private var _getProjectLabel : GetLabelProject = new GetLabelProject();
		private var _getLabelPhrase : GetLabelPhraseResp = new GetLabelPhraseResp();
		private var _getLabelByString : GetLabelByStringResp = new GetLabelByStringResp();
		private var _updateLabel : UpdateLabel = new UpdateLabel();
		private var _createLabel : CreateLabelResp = new CreateLabelResp();
		private var _getProjectPhrase : GetLabelProjectPhraseTrans = new GetLabelProjectPhraseTrans();
		private var _createLabelPhrase : CreateLabelPhraseResp = new CreateLabelPhraseResp();
		private var _updateLabelPhrase : UpdatePhrase = new UpdatePhrase();
		private var _addLabelToProject : AddLabelToProjectResp = new AddLabelToProjectResp();
		private var _removeLabelFromProject : RemoveLabelFromProjectResp = new RemoveLabelFromProjectResp();
		private var _deleteLabel : DeleteLabelResp = new DeleteLabelResp();

		public function LabelCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var labelEvent : LabelEvent = $evt as LabelEvent;

			switch(labelEvent.type) {
				case 'GET_ALL_LABEL':
					var getAllLabelDelegate : LabelDelegate = new LabelDelegate(_getAllLabel);
					getAllLabelDelegate.getAllLabel(labelEvent.projectID, labelEvent.langID);
					// projectEvent.projectVO
					break;
				case 'GET_LABEL_PROJECT':
					var labelProjectDelegate : LabelDelegate = new LabelDelegate(_getProjectLabel);
					labelProjectDelegate.getLabelProject(labelEvent.labelVO);
					break;
				case 'GET_LABEL_BY_STRING':
					var getLabelByString : LabelDelegate = new LabelDelegate(_getLabelByString);
					getLabelByString.getLabelByString(labelEvent.projectID, labelEvent.langID, labelEvent.searchString);
					break;
				case 'GET_LABEL_PHRASE':
					var labelPhraseDelegate : LabelDelegate = new LabelDelegate(_getLabelPhrase);
					labelPhraseDelegate.getLabelPhrase(labelEvent.labelVO);
					break;
				case 'UPDATE_LABEL':
					var updateLabelDelegate : LabelDelegate = new LabelDelegate(_updateLabel);
					updateLabelDelegate.updateLabel(labelEvent.labelVO);
					break;
				case 'CREATE_LABEL':
					var createLabelDelegate : LabelDelegate = new LabelDelegate(_createLabel);
					createLabelDelegate.createLabel(labelEvent.labelVO);
					break;
				case 'CREATE_LABEL_PHRASE':
					var createLabelPhraseDelegate : LabelDelegate = new LabelDelegate(_createLabelPhrase) ;
					createLabelPhraseDelegate.createLabelPhrase(labelEvent.labelVO) ;
					break;
				case 'UPDATE_LABEL_PHRASE' :
					var updateLabelPhraseDelegate : LabelDelegate = new LabelDelegate(_updateLabelPhrase) ;
					updateLabelPhraseDelegate.updateLabelPhrase(labelEvent.labelVO) ;
					break;
				case 'GET_LABEL_PROJECT_PHRASE_TRANS':
					var getPorjectPhraseDelegate : LabelDelegate = new LabelDelegate(_getProjectPhrase) ;
					getPorjectPhraseDelegate.getLabelProjectPhraseTrans(labelEvent.projectID, labelEvent.langID) ;
					break;
				case 'ADD_LABEL_TO_PROJECT':
					var addLabelToProject : LabelDelegate = new LabelDelegate(_addLabelToProject);
					addLabelToProject.addLabelToProject(labelEvent.labelVO);
					break;
				case 'REMOVE_LABEL_FROM_PROJECT':
					var removeLabelFromProject : LabelDelegate = new LabelDelegate(_removeLabelFromProject);
					removeLabelFromProject.removeLabelFromProject(labelEvent.labelVO);
					break;
				case 'DELETE_LABEL':
					var deleteLabel : LabelDelegate = new LabelDelegate(_deleteLabel);
					deleteLabel.deleteLabel(labelEvent.projectID);
					break;
			}
		}
	}
}