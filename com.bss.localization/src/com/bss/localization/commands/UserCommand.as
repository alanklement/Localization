package com.bss.localization.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.bss.localization.business.UserDelegate;
	import com.bss.localization.events.UserEvent;
	import com.bss.localization.responder.userService.GetAdminsResp;
	import com.bss.localization.responder.userService.GetClientsResp;

	public class UserCommand implements ICommand {
		private var _getAdmins : GetAdminsResp = new GetAdminsResp() ;
		private var _getClients : GetClientsResp = new GetClientsResp() ;

		public function UserCommand() {
		}

		public function execute($evt : CairngormEvent) : void {
			var userEvent : UserEvent = $evt as UserEvent;

			switch ( userEvent.type ) {
				case 'GET_ADMINS':
					var getAdminsDelegate : UserDelegate = new UserDelegate(_getAdmins) ;
					getAdminsDelegate.getAdmins() ;
					break;
				case 'GET_CLIENTS':
					var getClientsDelegate : UserDelegate = new UserDelegate(_getClients) ;
					getClientsDelegate.getClients() ;
					break;
			}
		}
	}
}