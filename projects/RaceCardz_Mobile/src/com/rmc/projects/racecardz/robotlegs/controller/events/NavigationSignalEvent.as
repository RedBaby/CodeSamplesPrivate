package com.rmc.projects.racecardz.robotlegs.controller.events
{
	import starling.events.Event;
	
	
	public class NavigationSignalEvent extends Event
	{
		public static const SHOW_SCREEN : String = "showScreen";
		
		public function NavigationSignalEvent(type:String, data:Class)
		{
			super (type, false, data);
		}
		
		
		public function clone():NavigationSignalEvent
		{
			return new NavigationSignalEvent(type, data as Class)
		}
	}
}