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
package 
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.racecardz.robotlegs.RaceCardzContext;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AfterQuestionScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AfterTestScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AnswerScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.MainMenuScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.QuestionScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.SettingsScreen;
	import com.rmc.projects.shardz.controls.ShardzScreenNavigator;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import feathers.controls.ScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.events.Event;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Game</code> class.</p>
	 * 
	 */
	public class RaceCardzGame extends AbstractShardzGame
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		
		
		// PRIVATE
		/**
		 * 
		 */		
		private var _shardzScreenNavigator:ShardzScreenNavigator;
		
		
		/**
		 * 
		 */		
		public var starlingContext:StarlingContext;
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		private var _screenSlidingStackTransitionManager:ScreenSlidingStackTransitionManager;
		
		/**
		 * This is the constructor.
		 * 
		 */ 
		public function RaceCardzGame(){
			
			// SUPER
			super();
			
			starlingContext = new RaceCardzContext(this);
			
			
		}
		
		
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		/**
		 * 
		 * 
		 */		
		override protected function _doLayout () : void
		{
			//
			super._doLayout();
			
			
			//
			_setThemeClass (MetalWorksMobileTheme);
			
			
		}	
		/**
		 * 
		 * 
		 */		
		public function doLayoutScreens () : void
		{
			
			//
			_shardzScreenNavigator = new ShardzScreenNavigator ();
			_shardzScreenNavigator.addEventListener(FeathersEventType.TRANSITION_COMPLETE, _onScreenNavigatorTransitionComplete);
			addChild(_shardzScreenNavigator);
			//
			_screenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager (_shardzScreenNavigator);
			
			_screenSlidingStackTransitionManager.delay 		= 0.25;
			_screenSlidingStackTransitionManager.duration 	= 0.75;
			_screenSlidingStackTransitionManager.ease 		= Transitions.EASE_IN_OUT;
			
			
			//
			var mainMenuScreenNavigatorItem : ScreenNavigatorItem = new ScreenNavigatorItem (new MainMenuScreen());
			_shardzScreenNavigator.addScreen(MainMenuScreen.ID, mainMenuScreenNavigatorItem);
			(mainMenuScreenNavigatorItem.screen as MainMenuScreen).addEventListener(ShardzEvent.HEADER_NEXT_BUTTON_CLICK, 	_onHeaderButtonClick);
			//
			var settingsScreenScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new SettingsScreen ());
			_shardzScreenNavigator.addScreen(SettingsScreen.ID, settingsScreenScreenItem);
			//
			var testQuestionScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new QuestionScreen ());
			_shardzScreenNavigator.addScreen(QuestionScreen.ID, testQuestionScreenItem);
			//
			var testAnswerScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new AnswerScreen ());
			_shardzScreenNavigator.addScreen(AnswerScreen.ID, testAnswerScreenItem);
			//
			var afterQuestionScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new AfterQuestionScreen ());
			_shardzScreenNavigator.addScreen(AfterQuestionScreen.ID, afterQuestionScreenItem);
			//
			var afterTestScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new AfterTestScreen ());
			_shardzScreenNavigator.addScreen(AfterTestScreen.ID, afterTestScreenItem);
			
			
		}	
		/**
		 * 
		 * 
		 */		
		public function showScreen (aScreen_class : Class) : void
		{
			
			
			//SHOW A DIFFERENT SCREEN THAN THE CURRENT 
			if (_shardzScreenNavigator.activeScreenID != aScreen_class["ID"]) {
				_shardzScreenNavigator.showScreen(aScreen_class["ID"]); 
			} else {
				//SHOW CURRENT SCREEN AGAIN (I.E. QUESTION 1 -> QUESTION 2);
				/*
				I TRIED TO REMOVE/RE-ADD THE SAME SCREEN AND IT DOESN'T WORK
				
				SO FOR NOW JUST DO THE SAME THING (REGARDLESS OF THIS IF STATEMENT)
				
				*/
				_shardzScreenNavigator.showScreen(aScreen_class["ID"]);
				
			}
			
		}	
		
		
		/**
		 * 
		 * @param aEvent
		 * 
		 */		
		private function _onHeaderButtonClick(aEvent : ShardzEvent):void
		{
			//TRIGGERED, BUT DO NOTHING HERE NOW
			//WE HANDLE THIS IN EACH MEDIATOR
		}
		
		// --------------------------------------
		// Events
		// --------------------------------------
		private function _onScreenNavigatorTransitionComplete (aEvent : Event) : void
		{
			if ( _shardzScreenNavigator.previousScreenInTransition != null &&
				_shardzScreenNavigator.previousScreenInTransition is AfterQuestionScreen) {
				trace ("_shardzScreenNavigator: " + _shardzScreenNavigator.previousScreenInTransition);
				//_shardzScreenNavigator.removeScreen(AfterQuestionScreen.ID);
			}
		}
		
		
		
	}
}
