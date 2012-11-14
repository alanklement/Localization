package com.bss.localization.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	
	public class LabelReportDelegate
	{
		private var _responder:IResponder;
		private var _service:Object;
		
		public function LabelReportDelegate( $responder:IResponder )
		{
			_responder = $responder;
			_service = ServiceLocator.getInstance().getRemoteObject( "labelReportService" );
		}
		
		public function getLabelReport( $labels:Array ):void
		{
			var call:Object = _service.getLabelReport( $labels ) ;
			call.addResponder( _responder );			
		}	
	}
}