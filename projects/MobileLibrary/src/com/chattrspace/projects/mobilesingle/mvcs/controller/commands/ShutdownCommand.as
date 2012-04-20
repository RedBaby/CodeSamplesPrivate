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
	import com.chattrspace.projects.mobilesingle.mvcs.model.HappyBirthdayModel;
	import com.chattrspace.projects.mobilesingle.mvcs.model.PhrasesModel;
	import com.chattrspace.projects.mobilesingle.mvcs.services.ILoadService;
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.ApplicationUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.views.MainViewUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.views.SongViewUI;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * <p>Command: Handles the shutdown of the application. (Importance is TBD)</p>
	 * 
	 */
	public class ShutdownCommand extends Command
	{
		
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
			/*
			
				REGULARLY CHECK THAT THIS MATCHES 
					(DOING HERE WHAT IS THE REVERSE OF WHAT IS SETUP IN) THE STARTUP COMMAND
			
			*/

			// Model
			injector.unmap (PhrasesModel);
			injector.unmap (HappyBirthdayModel);

			// View
			mediatorMap.unmapView (MainViewUI);
			mediatorMap.unmapView (SongViewUI);
			mediatorMap.unmapView (ApplicationUI);
			
			// Controller
			commandMap.unmapEvent 		(ContextEvent.STARTUP,  StartupCommand);
			commandMap.unmapEvent 		(ContextEvent.SHUTDOWN, ShutdownCommand);
			
			// Services
			injector.unmap (ILoadService, "PhrasesLoadService");

		}
	}
}