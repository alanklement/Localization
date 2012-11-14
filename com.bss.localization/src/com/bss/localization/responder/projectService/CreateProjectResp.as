package com.bss.localization.responder.projectService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class CreateProjectResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function CreateProjectResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent;

			if ( serviceResult.result.success ) {
				var project : ArrayCollection = new ArrayCollection(ArrayUtil.toArray(serviceResult.result.queryResult));
				_modelLocator.projects.addItem(project[0])
				// Alert.show("Project Created");
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message.toString());
			}
		}

		public function fault($obj : Object) : void {
			var  serviceResult : FaultEvent = $obj as FaultEvent ;

			Alert.show("There was an unknown fault error.\ncheck server. \n\n" + serviceResult.fault) ;
		}
	}
}