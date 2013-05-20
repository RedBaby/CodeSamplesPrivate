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
package com.rmc.projects.racecardz.robotlegs.view.ui
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import feathers.controls.ScrollText;
	import feathers.layout.VerticalLayout;
	
	import org.osflash.signals.Signal;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>AfterTestScreen</code> class is ...</p>
	 * 
	 */
	public class AfterTestScreen extends AbstractScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		/**
		 *  
		 */		
		private var _quitButtonClickSignal : Signal;
		public function get quitButtonClickSignal () 					: Signal 	{ return _quitButtonClickSignal; }
		
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "AfterTestScreen";
		
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------

		private var _scrollText:ScrollText;
		/**
		 * This is the constructor.
		 * 
		 */
		public function AfterTestScreen()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			_quitButtonClickSignal 	= new Signal();
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// PRIVATE
		/**
		 * FEATHERS: Initialize
		 * 
		 * @return void
		 */	
		override protected function initialize () : void 
		{
			//SUPER
			super.initialize();
			
			//LAYOUT
			_doLayoutContainer(VerticalLayout);
			
			//
			//shardzHeader.visible = false;
			shardzHeader.previousButton.visible 	= true;
			shardzHeader.nextButton.visible 		= false;
			
			//LISTEN
			addEventListener(ShardzEvent.HEADER_PREVIOUS_BUTTON_CLICK, _onQuitButtonClick);
			
			//ATTACH THINGS
			_scrollText = new ScrollText();
			container.addChild(_scrollText);
			
			
		}
		

		
		override protected function _doLayoutWithLocalization () : void
		{
			//
			title 								= phrasesModel.phrasesVO.titleAfterTestScreen_str;
			shardzHeader.previousButton.label 	= phrasesModel.phrasesVO.buttonQuit_str
			_scrollText.text 					= phrasesModel.phrasesVO.scrollTextAfterTest_str;
				

			
		}
		
		/**
		 * FEATHERS: Draw
		 * 
		 * @return void
		 */		
		override protected function draw () : void 
		{
			
			//SUPER
			super.draw();
			
			_scrollText.height = container.height/2;
			
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onQuitButtonClick(aEvent : ShardzEvent):void
		{
			_quitButtonClickSignal.dispatch(aEvent);
			
		}
		
	}
}
