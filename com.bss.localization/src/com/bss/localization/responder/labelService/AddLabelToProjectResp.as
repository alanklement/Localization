package com.bss.localization.responder.labelService {
	import com.bss.localization.model.ModelLocator;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class AddLabelToProjectResp implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function AddLabelToProjectResp() {
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent ;

			if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			}

			if (  _modelLocator.removeFromView ) {
				_modelLocator.returnedLabels.removeItemAt(_modelLocator.removeFromDGIndex) ;
				_modelLocator.selectedLabel = null ;
				_modelLocator.returnedLabelPhrase = null ;
				_modelLocator.returnedLabelProject = null ;
			}
		}

		public function fault($obj : Object) : void {
			var fault : FaultEvent = $obj as FaultEvent ;

			Alert.show(fault.message.toString());
		}
	}
}