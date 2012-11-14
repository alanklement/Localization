package com.bss.localization.responder.labelService {
	import com.bss.localization.events.LabelEvent;
	import com.bss.localization.model.ModelLocator;
	import com.bss.localization.vo.LabelVO;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class RemoveLabelFromProjectResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function RemoveLabelFromProjectResp() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			if ( serviceResult.result ) {
				// ak: this checks the response, if the label is no longer assigned to a project - then it is assigned to the 'unassigned lables list'
				if ( serviceResult.result.queryResult.length == 0) {
					var unassignedLabel : LabelVO = _modelLocator.selectedLabel;
					unassignedLabel.project_id = -1;

					var labelEvent : LabelEvent = new LabelEvent(LabelEvent.ADD_LABEL_TO_PROJECT, 0, 0, unassignedLabel);
					labelEvent.dispatch();

					_modelLocator.selectedLabel = null ;
					Alert.show("Label moved to unassigned.");
				}
				;

				// This is part of the workaround to the datagrid 'bug'? on Line 187 @ 'Label' view
				if (  _modelLocator.removeFromView ) {
					_modelLocator.returnedLabels.removeItemAt(_modelLocator.removeFromDGIndex) ;
					_modelLocator.selectedLabel = null ;
					_modelLocator.returnedLabelPhrase = null ;
					_modelLocator.returnedLabelProject = null ;
				}
			} else if (!serviceResult.result) {
				Alert.show("Label was not updated sucessfully");
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not remove label from project");
		}
	}
}