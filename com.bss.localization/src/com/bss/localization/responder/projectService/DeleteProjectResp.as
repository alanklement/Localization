package com.bss.localization.responder.projectService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class DeleteProjectResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function DeleteProjectResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent ;

			if ( serviceResult.result.success ) {
				_modelLocator.projects.removeItemAt(_modelLocator.selectedProjectIndex) ;
				Alert.show("Project Deleted");
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message.toString());
			}
		}

		public function fault($obj : Object) : void {
			var  serviceResult : FaultEvent = $obj as FaultEvent ;

			Alert.show("There was an unknown error. \n" + serviceResult.fault) ;
		}
	}
}