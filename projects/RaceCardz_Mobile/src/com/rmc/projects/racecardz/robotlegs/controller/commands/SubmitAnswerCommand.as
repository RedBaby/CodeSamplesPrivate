/**
 * Copyright (C) 2005-2013 by Rivello Multimedia Consulting (RMC).                    
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
package com.rmc.projects.racecardz.robotlegs.controller.commands
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.errors.ToDoError;
	import com.rmc.projects.racecardz.robotlegs.controller.events.NavigationEvent;
	import com.rmc.projects.racecardz.robotlegs.controller.events.SubmitAnswerEvent;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.NavigationSignal;
	import com.rmc.projects.racecardz.robotlegs.model.TestModel;
	import com.rmc.projects.racecardz.robotlegs.view.ui.QuestionScreen;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	
	/**
	 * <p>Command: Loading core model data</p>
	 * 
	 */
	public class SubmitAnswerCommand extends StarlingCommand
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * RL REFERENCE: SIGNAL 
		 */		
		[Inject]
		public var navigationSignal:NavigationSignal;
		
		/**
		 * RL REFERENCE: MODEL 
		 */		
		[Inject]
		public var testModel:TestModel;
		
		
		/**
		 * RL REFERENCE: EVENT 
		 */		
		[Inject]
		public var submitAnswerEvent:SubmitAnswerEvent;
		
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
			testModel.currentAnswerLocation = submitAnswerEvent.locationVO;
			navigationSignal.dispatch( new NavigationEvent (NavigationEvent.SHOW_SCREEN, QuestionScreen));
			
			
		}
	}
}