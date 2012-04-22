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
	import com.chattrspace.projects.mobiledemos.mvcs.view.components.ui.views.DemoCommentsSocialContentViewUI;
	
	import com.chattrspace.projects.mobilesingle.mvcs.controller.events.LogInSignalEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.LogInSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.model.HappyBirthdayModel;
	
	import flash.events.MouseEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.view.AbstractViewMediator;
	
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
	public class DemoCommentsSocialContentViewUIMediator extends AbstractViewMediator
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
		public var demoCommentsSocialContentViewUI : DemoCommentsSocialContentViewUI;
		
		
		/**
		 * Signal: Marks a request to log in or log out depending on the passed event.
		 * 
		 */	
		[Inject]
		public var logInSignal : LogInSignal;
		
		
		/**
		 * Reference: <code>Model</code>
		 * 
		 */	
		[Inject]
		public var happyBirthdayModel : HappyBirthdayModel;
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function DemoCommentsSocialContentViewUIMediator()
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
			demoCommentsSocialContentViewUI.loginWithFacebookButtonClickedSignal.add  			(_onLogInWithFacebookButtonClicked);
			demoCommentsSocialContentViewUI.notAMemberButtonClickedSignal.add  					(_onNotAMemberButtonClicked);
			
			//	CONTEXT

			
			//	UPDATE
			
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
			demoCommentsSocialContentViewUI.loginWithFacebookButtonClickedSignal.remove  			(_onLogInWithFacebookButtonClicked);
			demoCommentsSocialContentViewUI.notAMemberButtonClickedSignal.remove  				(_onNotAMemberButtonClicked);
			
			//	CONTEXT
			
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		//	VIEW
		/**
		 * Handles the aEvent: <code>MouseEvent.CLICK</code>.
		 * 
		 * @param aEvent <code>MouseEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onLogInWithFacebookButtonClicked (aEvent : MouseEvent):void
		{
			//	NOTE
			//		An event is really not needed for now, but its used. We can pack in more data if login situations change.
			logInSignal.dispatch(	new LogInSignalEvent (LogInSignalEvent.LOG_IN) );
			
		}
		
		/**
		 * Handles the aEvent: <code>MouseEvent.CLICK</code>.
		 * 
		 * @param aEvent <code>MouseEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onNotAMemberButtonClicked (aEvent : MouseEvent):void
		{
			trace ("_onNotAMemberButtonClicked() aEvent: " + aEvent);
		}
		
		//	CONTEXT
		
		
	}
}