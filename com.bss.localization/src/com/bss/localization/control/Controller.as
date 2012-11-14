package com.bss.localization.control {
	import com.adobe.cairngorm.control.FrontController;
	import com.bss.localization.commands.*;
	import com.bss.localization.events.*;

	public class Controller extends FrontController {
		public function Controller() {
			super();
			this.init();
		}

		public function init() : void {
			this.addCommand(LoginEvent.LOGIN, LoginCommand);

			this.addCommand(ProjectEvent.CREATE_PROJECT, ProjectCommand);
			this.addCommand(ProjectEvent.UPDATE_PROJECT, ProjectCommand);
			this.addCommand(ProjectEvent.DELETE_PROJECT, ProjectCommand);
			this.addCommand(ProjectEvent.ADD_LANGUAGE, ProjectCommand);
			this.addCommand(ProjectEvent.REMOVE_LANGUAGE, ProjectCommand);
			this.addCommand(ProjectEvent.GET_PROJECT_LANGUAGE, ProjectCommand);

			this.addCommand(LanguageEvent.CREATE_LANGUAGE, LanguageCommand);
			this.addCommand(LanguageEvent.GET_ALL_LANGUAGE, LanguageCommand);

			this.addCommand(LabelEvent.GET_ALL_LABEL, LabelCommand);
			this.addCommand(LabelEvent.GET_LABEL_PROJECT, LabelCommand);
			this.addCommand(LabelEvent.GET_LABEL_PHRASE, LabelCommand);
			this.addCommand(LabelEvent.GET_LABEL_BY_STRING, LabelCommand);
			this.addCommand(LabelEvent.UPDATE_LABEL, LabelCommand);
			this.addCommand(LabelEvent.CREATE_LABEL, LabelCommand);
			this.addCommand(LabelEvent.CREATE_LABEL_PHRASE, LabelCommand);
			this.addCommand(LabelEvent.UPDATE_LABEL_PHRASE, LabelCommand);
			this.addCommand(LabelEvent.GET_LABEL_PROJECT_PHRASE_TRANS, LabelCommand);
			this.addCommand(LabelEvent.ADD_LABEL_TO_PROJECT, LabelCommand);
			this.addCommand(LabelEvent.REMOVE_LABEL_FROM_PROJECT, LabelCommand);
			this.addCommand(LabelEvent.DELETE_LABEL, LabelCommand);

			this.addCommand(LabelReportEvent.GET_LABEL_REPORT, LabelReportCommand) ;

			// this.addCommand ( CopyDeckEvent.GET_ORIGINAL_TRANSLATION,		CopyDeckCommand) ;

			this.addCommand(UserEvent.GET_ADMINS, UserCommand);
			this.addCommand(UserEvent.GET_CLIENTS, UserCommand);
		}
	}
}