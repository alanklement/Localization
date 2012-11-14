package com.bss.localization.responder.languageService
{
	import com.bss.localization.events.LanguageEvent;
	import com.bss.localization.model.ModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class CreateLanguageResp implements IResponder
	{
		private var _modelLocator:ModelLocator = ModelLocator.getInstance();
		
		public function CreateLanguageResp() {}

		public function result( $obj:Object ):void
		{
			var serviceResult:ResultEvent = $obj as ResultEvent ;
		
			if( serviceResult.result.success )
			{
				var languageEvent:LanguageEvent = new LanguageEvent( LanguageEvent.GET_ALL_LANGUAGE ) ;
				languageEvent.dispatch() ;
				Alert.show( "LanguageCreated" ) ;
			}
			else if( !serviceResult.result.success )
			{
				Alert.show( serviceResult.result.message ) ;
			}
		}
		
		public function fault(info:Object):void
		{
			Alert.show("The server could now process your Create Language request");
		}
	}
}