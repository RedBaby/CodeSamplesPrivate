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
package com.chattrspace.projects.mobiledemos.mvcs.view.mediators
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobiledemos.mvcs.view.components.ui.views.DemoUsersSocialContentViewUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.views.AbstractViewMediator;
	
	import flash.events.Event;
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Mediator</code> managing its sole <code>UI</code>.</p>
	 * 
	 */
	public class DemoUsersSocialContentViewUIMediator extends AbstractViewMediator
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		/**
		 * Reference: The sole <code>UI</code> being mediated
		 * 
		 */	
		[Inject]
		public var demoUsersSocialContentViewUI : DemoUsersSocialContentViewUI;
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function DemoUsersSocialContentViewUIMediator()
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
			//  SUPER
			super.onRegister();
			
			//	VIEW
			demoUsersSocialContentViewUI.phrasesVOChanged.add(_onPhrasesVOChanged);
			demoUsersSocialContentViewUI.usersSocialContentUI.addedToStageSignal.add(_onUsersSocialContentUIAddedToStage);
			
			//	CONTEXT
			
			
			//	UPDATE
			
			
			//	USE FAKE DATA
			
		}
		
		/**
		 * Robotlegs Requirement: Handles Event of Removal
		 * 
		 * @return void
		 *
		 */
		override public function onRemove():void
		{
			//  SUPER
			super.onRemove();
			
			//	VIEW
			
			//	CONTEXT
			
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		//	VIEW
		/**
		 * Handles the Signal: <code>phrasesVOChanged</code>.
		 * 
		 * @return void
		 * 
		 */
		protected function _onPhrasesVOChanged ():void
		{
			//	SET TITLE - USING DYNAMIC TOKEN REPLACEMENT (DTR)
			var title_str : String = demoUsersSocialContentViewUI.phrasesVO.demoViewTitle;
			title_str = title_str.replace("{DEMO_NAME}","Users");
			demoUsersSocialContentViewUI.title = title_str;
		}
		
		
		/**
		 * Handles the Signal: <code>addedToStageSignal</code>.
		 * 
		 * @param Event
		 * 
		 * @return void
		 * 
		 */
		protected function _onUsersSocialContentUIAddedToStage (aEvent : Event ):void
		{
			//	TODO: POPULATE WITH FAKE DATA
			
		}
		
		
		//	CONTEXT
		
		
	}
}