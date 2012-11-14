package com.bss.localization.responder.labelReport
{
	import com.bss.localization.model.ModelLocator;
	import com.bss.localization.vo.LabelReportVO;
	
	import flash.text.TextField;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;

	public class LabelReportResp implements IResponder
	{
		public function LabelReportResp() {}

		public function result( $obj:Object ):void
		{
			var serviceResult:ResultEvent = $obj as ResultEvent ;
			var textField : TextField ; 
			
			if ( serviceResult.result.success )
			{
				var a:Array = ArrayUtil.toArray( serviceResult.result.queryResult ) ;
				var resultData:ArrayCollection = new ArrayCollection ( a ) ;
				var longestItem:Array = new Array() ;
				textField = new TextField() ;
				// ak: this loops through and finds the longest phrase after unescaping characters.
				// I had a nice solution serverside; however, couldn't get it to work.
				
				for each ( var array:Array in resultData ) 
				{
					var i:uint = 0 ;
					var l:uint = array.length ;
					var count:int = 0 ;
					var longest:LabelReportVO ;
					textField.text = '' ;
					
					for ( i ; i < l ; i ++ )
					{
						array[ i ].original = unescape ( array[ i ].original ) ;
						array[ i ].phrase = unescape ( array[ i ].phrase ) ;
						textField.text = array[ i ].phrase ;
											
						if  (textField.textWidth > count )
						{
							longest = array[ i ] ;
							count = textField.textWidth ;
							array[ i ].count = count ;
						}
					}				
					longestItem.push( longest ) ;
				}	
				ModelLocator.getInstance().longestLabel = new ArrayCollection( longestItem ) ;
			}
			else
			{
				Alert.show( serviceResult.result.message ) ;
			}			
		}
		
		public function fault( $obj:Object ):void
		{
			var serviceFault:FaultEvent = $obj as FaultEvent ;
			Alert.show( "An Unknown error has occoured" ) ;			
		}
	}
}