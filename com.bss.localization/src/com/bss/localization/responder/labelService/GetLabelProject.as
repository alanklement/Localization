package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class GetLabelProject implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance() ;
		private var _projectsToRemove : Array ;
		private var _returnedProjects : Array ;

		public function GetLabelProject() {
		}

		public function result(data : Object) : void {
			var serviceResult : ResultEvent = data as ResultEvent;

			_modelLocator.addLabelToProjectCB_DP = new ArrayCollection(_modelLocator.projects.toArray())  ;

			if ( serviceResult.result.success ) {
				_returnedProjects = ArrayUtil.toArray(serviceResult.result.queryResult)

				_modelLocator.returnedLabelProject = new ArrayCollection(_returnedProjects) ;

				// All of this  is to update those comboboxes to 'add' and 'remove' a label to / from a project
				if ( _modelLocator.returnedLabelProject.length > 0 ) {
					_modelLocator.removeLabelFromProjectCBEnabled = true ;
				} else {
					_modelLocator.removeLabelFromProjectCBEnabled = false ;
				}

				_removeDuplicatesFromCB() ;
				_enable_disableCB();
				// finished updationg comboboxes

				// This is part of the workaround to the datagrid 'bug' on Line 187 @ 'Label' view
				if (  _modelLocator.removeFromView ) {
					_modelLocator.returnedLabelProject = null ;
					_modelLocator.removeFromView = false ;
				}
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			}
		}

		public function fault(info : Object) : void {
			Alert.show("The server could not process your \n\nGet label projects request");
		}

		private function _enable_disableCB() : void {
			if ( _modelLocator.addLabelToProjectCB_DP.length == 0 ) {
				_modelLocator.addLabelToProjectCBEnabled = false ;
			} else if ( _modelLocator.addLabelToProjectCB_DP.length != 0 ) {
				_modelLocator.addLabelToProjectCBEnabled = true ;
			}

			if ( _modelLocator.returnedLabelProject.length > 0 ) {
				_modelLocator.removeLabelFromProjectCBEnabled = true ;
			} else {
				_modelLocator.removeLabelFromProjectCBEnabled = false ;
			}
		}

		private function _removeDuplicatesFromCB() : void {
			ModelLocator.getInstance().removeLabelFromProjectCBEnabled = false ;

			for ( var i : uint = 0 ; i < _returnedProjects.length ; i++ ) {
				for ( var ii : uint = 0; ii < _modelLocator.addLabelToProjectCB_DP.length ; ii++ ) {
					if ( _returnedProjects[i].project_id == _modelLocator.addLabelToProjectCB_DP[ii].project_id ) {
						_modelLocator.addLabelToProjectCB_DP.removeItemAt(ii) ;
					}
				}
			}
		}
	}
}




