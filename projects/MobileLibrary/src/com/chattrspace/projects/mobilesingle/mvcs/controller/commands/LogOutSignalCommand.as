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
package com.chattrspace.projects.mobilesingle.mvcs.controller.commands
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.managers.AssetManager;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.events.LogInSignalEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.events.LogOutSignalEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.events.ViewNavigatorEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.ViewNavigatorPushViewSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.views.MainViewUI;
	
	import org.robotlegs.mvcs.Command;
	
	
	/**
	 * <p><code>Command</code>: Executes the log in</p>
	 * 
	 */
	public class LogOutSignalCommand extends Command
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * Signal: Change the View
		 * 
		 */
		[Inject]
		public var logOutSignalEvent : LogOutSignalEvent;
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Robotlegs Requirement: Execute the command
		 * 
		 * @return void
		 *
		 */
		override public function execute():void
		{
			
			//	TODO
			//.....LOGOUT VIA SERVICE, UPON RESPONSE, UPDATE THE UI
			
			
			//	HACK FOR NOW
			//.....debug trace
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
			trace ("LogOutSuccessfull");
		}
	}
}

