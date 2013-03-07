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
	import com.rmc.projects.racecardz.robotlegs.view.ui.AnswerScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.QuestionScreen;
	import com.rmc.projects.racecardz.robotlegs.RaceCardzContext;
	import com.rmc.projects.racecardz.robotlegs.view.ui.MainMenuScreen;
	import com.rmc.projects.shardz.controls.ShardzScreenNavigator;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.animation.Transitions;
	
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
			addChild(_shardzScreenNavigator);
			//
			var screenSlidingStackTransitionManager : ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager (_shardzScreenNavigator);
			screenSlidingStackTransitionManager.delay 		= 0.0;
			screenSlidingStackTransitionManager.duration 	= 1;
			screenSlidingStackTransitionManager.ease 		= Transitions.EASE_IN_OUT;
			//
			var mainMenuScreenNavigatorItem : ScreenNavigatorItem = new ScreenNavigatorItem (new MainMenuScreen());
			_shardzScreenNavigator.addScreen(MainMenuScreen.ID, mainMenuScreenNavigatorItem);
			(mainMenuScreenNavigatorItem.screen as MainMenuScreen).addEventListener(ShardzEvent.HEADER_NEXT_BUTTON_CLICK, 	_onHeaderButtonClick);
			
			
			////////////////////////////////////////////
			////////////////////////////////////////////
			//
			var testQuestionScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new QuestionScreen ());
			//(testQuestionScreenItem.screen as ListMenuScreen).addEventListener(ShardzEvent.HEADER_PREVIOUS_BUTTON_CLICK, 		_onHeaderButtonClick);
			_shardzScreenNavigator.addScreen(QuestionScreen.ID, testQuestionScreenItem);
			
			//
			var testAnswerScreenItem : ScreenNavigatorItem = new ScreenNavigatorItem (new AnswerScreen ());
			//(testQuestionScreenItem.screen as ListMenuScreen).addEventListener(ShardzEvent.HEADER_PREVIOUS_BUTTON_CLICK, 		_onHeaderButtonClick);
			_shardzScreenNavigator.addScreen(AnswerScreen.ID, testAnswerScreenItem);

			
		}	
		/**
		 * 
		 * 
		 */		
		public function showScreen (aScreen_class : Class) : void
		{
			_shardzScreenNavigator.showScreen(aScreen_class["ID"]);
			
		}	
		
		
		/**
		 * 
		 * @param aEvent
		 * 
		 */		
		private function _onHeaderButtonClick(aEvent : ShardzEvent):void
		{
			if (aEvent.currentTarget is MainMenuScreen) {
				if (aEvent.type == ShardzEvent.HEADER_NEXT_BUTTON_CLICK) {
					_shardzScreenNavigator.showScreen(QuestionScreen.ID);
				}
			} else {
				//TODO, MAKE ERROR
				throw new Error ("TODO: Switchstatement");
			}
		}
		
		// --------------------------------------
		// Events
		// --------------------------------------
		
		
		
		
	}
}
