package com.bss.localization.responder.projectService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class UpdateProjectResp implements IResponder {
		public function UpdateProjectResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				ModelLocator.getInstance().selectedProject.project_edited = String(serviceResult.result.queryResult)
				Alert.show("Project Updated");
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