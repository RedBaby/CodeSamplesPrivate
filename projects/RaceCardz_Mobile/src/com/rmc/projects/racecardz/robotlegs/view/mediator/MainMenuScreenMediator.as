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
package com.rmc.projects.racecardz.robotlegs.view.mediator
{
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AnswerScreen;
	import com.rmc.projects.racecardz.robotlegs.controller.events.NavigationSignalEvent;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.NavigationSignal;
	import com.rmc.projects.racecardz.robotlegs.model.PhrasesModel;
	import com.rmc.projects.racecardz.robotlegs.view.ui.MainMenuScreen;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.StarlingMediator;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>MainMenuScreenMediator</code> is designed to...</p>
	 * 
	 */
	public class MainMenuScreenMediator extends AbstractMediator implements IMediator
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 * RL REFERENCE: VIEW 
		 */		
		public function get mainMenuScreen () 					: MainMenuScreen 	{ return viewComponent as MainMenuScreen; }
		
		/**
		 * RL REFERENCE: SIGNAL 
		 */		
		[Inject]
		public var navigationSignal:NavigationSignal;

		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function MainMenuScreenMediator()
		{
			super();
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		override public function onRegister():void
		{
			mainMenuScreen.menuButtonClickSignal.add(_onMenuButtonClickSignal);
			mainMenuScreen.phrasesModel = phrasesModel;
		}
		
		[PostConstruct]
		public function _onPostConstruct () : void
		{
			trace ("_onPostConstruct");
		}
		
		override public function onRemove():void
		{
			trace("MainMenuScreenMediator.onRemove()");
		}
		

		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onMenuButtonClickSignal(aButtonType_str : String):void
		{
			switch (aButtonType_str) {
				case MainMenuScreen.BUTTON_PLAY_GAME:
					navigationSignal.dispatch( new NavigationSignalEvent (NavigationSignalEvent.SHOW_SCREEN, AnswerScreen));
					break;
				case MainMenuScreen.BUTTON_OTHER:
					break;
				default:
					throw new SwitchStatementDefaultError();
					break;
			}
			
		}

	}
}

