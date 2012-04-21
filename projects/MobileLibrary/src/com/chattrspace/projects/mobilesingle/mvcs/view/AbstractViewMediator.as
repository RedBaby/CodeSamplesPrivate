/**
 * Copyright (C) 2011-2012 Chattrspace Inc.                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:                                            
 *                                                                      
 * The above copyright notice and this permission notice shall be       
 * included in all copies or substantial portions of the Software.      
 *                                                                      
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,      
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF   
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR    
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.                                      
 */
//Marks the right margin of code *******************************************************************
package com.chattrspace.projects.mobilesingle.mvcs.view
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.views.AbstractView;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.ViewNavigatorEvent;
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Mediator</code> managing the I/O to the UI: MainUI</p>
	 * 
	 */
	public class AbstractViewMediator extends Mediator
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AbstractViewMediator()
		{
			//NOTHING HAPPENS HERE
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Robotlegs Requirement: Handles Event of Registration
		 * 
		 * @return void
		 *
		 */
		override public function onRegister():void
		{
			
			//	VIEW
			(getViewComponent() as AbstractView).viewActivatedSignal.add (_onViewActivatedSignal);
			
			
		}
		
		/**
		 * Robotlegs Requirement: Handles Event of Removal
		 * 
		 * @return void
		 *
		 */
		override public function onRemove():void
		{
			
			//	VIEW
			(getViewComponent() as AbstractView).viewActivatedSignal.remove (_onViewActivatedSignal);
			
		}
		
		/**
		 * Handles the Event: <code>ViewNavigatorEvent.VIEW_ACTIVATE</code>.
		 * 
		 * @param aEvent <code>ViewNavigatorEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onViewActivatedSignal (aEvent : ViewNavigatorEvent):void
		{
			
			//OVERRIDE AS NEEDED...
			
		}
		
		
	}
}