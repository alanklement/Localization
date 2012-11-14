package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.LabelVO;

	import mx.rpc.IResponder;

	public class LabelDelegate {
		private var _responder : IResponder;
		private var _service : Object;

		public function LabelDelegate($responder : IResponder) {
			_responder = $responder;
			_service = ServiceLocator.getInstance().getRemoteObject("labelService");
		}

		public function getAllLabel($projectID : int, $langID : int) : void {
			var call : Object = _service.getAllLabel($projectID, $langID);
			call.addResponder(_responder);
		}

		public function getLabelByString($projectID : int, $langID : int, $searchString : String) : void {
			var call : Object = _service.getLabelByString($projectID, $langID, $searchString);
			call.addResponder(_responder);
		}

		public function getLabelProject($labelVO : LabelVO) : void {
			var call : Object = _service.getLabelProject($labelVO);
			call.addResponder(_responder);
		}

		public function getLabelPhrase($labelVO : LabelVO) : void {
			var call : Object = _service.getLabelPhrase($labelVO);
			call.addResponder(_responder);
		}

		public function updateLabel($labelVO : LabelVO) : void {
			var call : Object = _service.updateLabel($labelVO);
			call.addResponder(_responder);
		}

		public function deleteLabel($labelID : int) : void {
			var call : Object = _service.deleteLabel($labelID);
			call.addResponder(_responder);
		}

		public function updateLabelPhrase($labelVO : LabelVO) : void {
			var call : Object = _service.updatePhrase($labelVO);
			call.addResponder(_responder);
		}

		public function createLabel($labelVO : LabelVO) : void {
			var call_2 : Object = _service.createLabel($labelVO);
			$labelVO.phrase_original = unescape($labelVO.phrase_original);
			call_2.addResponder(_responder);
		}

		public function createLabelPhrase($labelVO : LabelVO) : void {
			var call : Object = _service.createLabelPhrase($labelVO);
			call.addResponder(_responder);
		}

		public function getLabelProjectPhraseTrans($projectID : int, $langID : int) : void {
			var call : Object = _service.getLabelProjectPhraseTrans($projectID, $langID);
			call.addResponder(_responder);
		}

		public function addLabelToProject($labelVO : LabelVO) : void {
			var call : Object = _service.addLabelToProject($labelVO);
			call.addResponder(_responder);
		}

		public function removeLabelFromProject($labelVO : LabelVO) : void {
			var call : Object = _service.removeLabelFromProject($labelVO);
			call.addResponder(_responder);
		}
	}
}