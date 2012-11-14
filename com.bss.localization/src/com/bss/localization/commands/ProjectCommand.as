package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand ;
	import com.adobe.cairngorm.control.CairngormEvent ;
	import com.bss.localization.business.ProjectDelegate ;
	import com.bss.localization.events.ProjectEvent ;
	import com.bss.localization.responder.projectService.* ;

	public class ProjectCommand implements ICommand {
		private var _updateResp : UpdateProjectResp = new UpdateProjectResp() ;
		private var _createResp : CreateProjectResp = new CreateProjectResp() ;
		private var _deleteResp : DeleteProjectResp = new DeleteProjectResp() ;
		private var _addRemoveLangResp : Add_RemoveLangResp = new Add_RemoveLangResp() ;
		private var _getProjectLangResp : GetProjectLangResp = new GetProjectLangResp() ;

		public function ProjectCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var projectEvent : ProjectEvent = $evt as ProjectEvent;

			switch( projectEvent.type ) {
				case 'UPDATE_PROJECT':
					var updateDelegate : ProjectDelegate = new ProjectDelegate(_updateResp) ;
					updateDelegate.updateProject(projectEvent.projectVO) ;
					break ;
				case 'CREATE_PROJECT':
					var createDelegate : ProjectDelegate = new ProjectDelegate(_createResp) ;
					createDelegate.createProject(projectEvent.projectVO) ;
					break ;
				case 'DELETE_PROJECT':
					var deleteDelegate : ProjectDelegate = new ProjectDelegate(_deleteResp) ;
					deleteDelegate.deleteProject(projectEvent.projectVO) ;
					break ;
				case 'GET_PROJECT_LANGUAGE':
					var projectLanguageDelegate : ProjectDelegate = new ProjectDelegate(_getProjectLangResp) ;
					projectLanguageDelegate.getProjectLanguage(projectEvent.projectVO) ;
					break ;
				case 'ADD_LANGUAGE':
					var addLanguageDelegate : ProjectDelegate = new ProjectDelegate(_addRemoveLangResp) ;
					addLanguageDelegate.addLanguage(projectEvent.projectVO) ;
					break ;
				case 'REMOVE_LANGUAGE':
					var removeLanguageDelegate : ProjectDelegate = new ProjectDelegate(_addRemoveLangResp) ;
					removeLanguageDelegate.removeLanguage(projectEvent.projectVO) ;
					break ;
			}
		}
	}
}