package com.bss.localization.responder.copyDeckService {
	import com.bss.localization.model.ModelLocator;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	// This class is not in use.  If the copy deck grows, then this can be added and expanded
	public class CopyDeckResponder implements IResponder {
		private var _modelLocator : ModelLocator = ModelLocator.getInstance();

		public function CopyDeckResponder() {
		}

		public function result(data : Object) : void {
			// var serviceResult:ResultEvent = data as ResultEvent;
			
			// var copyDeckData:ArrayCollection = new ArrayCollection( ArrayUtil.toArray( serviceResult.result ) );
			
			
			// public function result( $obj:Object ):void
			// {			
			// var serviceResult:ResultEvent = $obj as ResultEvent ;
			//		
			// if ( serviceResult.result.success ) 
			// {	
			// var a:Array = ArrayUtil.toArray( serviceResult.result.queryResult ) ;
			//				
			// for(var i:int=0;i<a.length;i++)
			// {
			// a[i].phrase_translation = unescape(a[i].phrase_translation) ;
			//	 				//  this checks to see if an entry in the database is the string 'null'  if so it converts it to null			
			// if( a[i].phrase_translation == "null" )
			// {
			// a[i].phrase_translation = null ;
			// }
			//					
			// //					disabled 
			// //		 			var sortLang:Sort = new Sort() ;
			// //					sortLang.fields = [new SortField("project_name", true)] ;
			// //					sortLang.sort ( a ) ;
			// //						  
			// ModelLocator.getInstance().returnedLabelPhrase = new ArrayCollection( a  ) ;		
			// }
			// }
			// }
		}

		public function fault(info : Object) : void {
			Alert.show("The server could now process your CopyDeck request") ;
		}
	}
}