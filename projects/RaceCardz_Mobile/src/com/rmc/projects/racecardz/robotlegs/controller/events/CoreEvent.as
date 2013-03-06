package com.rmc.projects.racecardz.robotlegs.controller.events
{
	import starling.events.Event;
	
	
	public class CoreEvent extends Event
	{
		public static const CHANGE_SCREEN : String = "changeScreen";
		
		public function CoreEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super (type, bubbles, data);
		}
		
		
		public function clone():CoreEvent
		{
			return new CoreEvent(type, bubbles, data)
		}
	}
}