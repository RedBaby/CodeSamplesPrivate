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
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadConfigurationModelSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadPhrasesModelSignal;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	
	
	/**
	 * <p>Command: Starting up the application this kicks off the whole RL experience</p>
	 * 
	 */
	public class StartupCommand extends StarlingCommand
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		
		/**
		 * Signal: Marks a request to load the <code>LoadConfigurationModelSignal</code>
		 * 
		 */	
		[Inject]
		public var loadConfigurationModelSignal : LoadConfigurationModelSignal;
		
		/**
		 * Signal: Marks a request to load the <code>PhrasesModel</code>
		 * 
		 */	
		[Inject]
		public var loadPhrasesModelSignal : LoadPhrasesModelSignal;

		

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

			loadConfigurationModelSignal.dispatch();
			
			//	Load All Phrases (Must happen last in this method!)
			loadPhrasesModelSignal.dispatch ();
		}

	}
}