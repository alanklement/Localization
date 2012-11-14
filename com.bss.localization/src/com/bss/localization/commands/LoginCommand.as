package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.LoginDelegate;
	import com.bss.localization.events.LanguageEvent;
	import com.bss.localization.events.LoginEvent;
	import com.bss.localization.events.ProjectEvent;
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class LoginCommand implements ICommand, IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance() ;

		public function LoginCommand() {
		}

		public function execute(event : CairngormEvent) : void {
			var loginEvent : LoginEvent = event as LoginEvent ;

			var delegate : LoginDelegate = new LoginDelegate(this) ;
			delegate.login(loginEvent.loginVO) ;
		}

		public function result($obj : Object) : void {
			var serviceResult : ResultEvent = $obj as ResultEvent ;

			if ( serviceResult.result.success ) {
				var a : Array = ArrayUtil.toArray(serviceResult.result.queryResult);

				var i : uint = 0 ;
				var l : uint = a.length ;

				for ( i ; i < l ; i++ ) {
					a[ i ].project_notes = unescape(a [ i ].project_notes);
				}

				var projects : ArrayCollection = new ArrayCollection(ArrayUtil.toArray(a));
				_modelLocator.projects = projects ;

				// clients return only one project
				if ( projects.length == 1 ) {
					_modelLocator.currentState = ModelLocator.CLIENT_STATE ;
					_modelLocator.clientProject = projects [ 0 ]
					var projectEvent : ProjectEvent = new ProjectEvent(ProjectEvent.GET_PROJECT_LANGUAGE, _modelLocator.clientProject) ;

					projectEvent.dispatch() ;
				} else {
					_modelLocator.currentState = ModelLocator.ADMIN_STATE ;
					var languageEvent : LanguageEvent = new LanguageEvent(LanguageEvent.GET_ALL_LANGUAGE) ;
					languageEvent.dispatch() ;
				}
			} else if ( !serviceResult.result.success ) {
				Alert.show(serviceResult.result.message) ;
			} else {
				Alert.show("An Unknown error has occured, check if server has fault") ;
			}
		}

		public function fault($obj : Object) : void {
			var  serviceResult : FaultEvent = $obj as FaultEvent ;

			Alert.show("Connection Refused: Server May Be Down.\n\n" + serviceResult.fault, 'Connection Error') ;
		}
	}
}