package com.bss.localization.business {
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.bss.localization.vo.ProjectVO;

	import mx.rpc.IResponder;

	public class ProjectDelegate {
		private var _responder : IResponder;
		private var _service : Object;

		public function ProjectDelegate($responder : IResponder) {
			_responder = $responder;
			_service = ServiceLocator.getInstance().getRemoteObject("projectService");
		}

		public function updateProject($projectVO : ProjectVO) : void {
			$projectVO.project_notes = escape($projectVO.project_notes);
			var call : Object = _service.updateProject($projectVO);
			$projectVO.project_notes = unescape($projectVO.project_notes);
			call.addResponder(_responder);
		}

		public function createProject($projectVO : ProjectVO) : void {
			var call : Object = _service.createProject($projectVO);
			call.addResponder(_responder);
		}

		public function deleteProject($projectVO : ProjectVO) : void {
			var call : Object = _service.deleteProject($projectVO);
			call.addResponder(_responder);
		}

		public function getProjectLanguage($projectVO : ProjectVO) : void {
			var call : Object = _service.getProjectLang($projectVO);
			call.addResponder(_responder);
		}

		public function addLanguage($projectVO : ProjectVO) : void {
			var call : Object = _service.addLanguage($projectVO);
			call.addResponder(_responder);
		}

		public function removeLanguage($projectVO : ProjectVO) : void {
			var call : Object = _service.removeLanguage($projectVO);
			call.addResponder(_responder);
		}
	}
}