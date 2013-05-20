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
	import com.rmc.errors.AbstractMethodError;
	import com.rmc.projects.racecardz.robotlegs.model.PhrasesModel;
	import com.rmc.projects.shardz.controls.ShardzScreen;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import org.osflash.signals.Signal;
	
	import starling.events.Event;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>AbstractScreen</code> class is meant to help localization. </p>
	 * 
	 */
	public class AbstractScreen extends ShardzScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		private var _transitionOnCompleteSignal : Signal;
		public function get transitionOnCompleteSignal () 					: Signal 	{ return _transitionOnCompleteSignal; }
		
		/**
		 *  
		 */		
		private var _transitionOnStartSignal : Signal;
		public function get transitionOnStartSignal () 					: Signal 	{ return _transitionOnStartSignal; }
		
		/**
		 * RL REFERENCE: MODEL 
		 */		
		public function get phrasesModel () 					: PhrasesModel 	{ return _phrasesModel; }
		public function set phrasesModel (aValue : PhrasesModel) 	: void 		{ 
			_phrasesModel = aValue; 
			_doLayoutWithLocalization();
			
		}
		private var _phrasesModel : PhrasesModel;

		
		// PUBLIC CONST
		
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AbstractScreen()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			_transitionOnCompleteSignal 	= new Signal();
			_transitionOnStartSignal		= new Signal();
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// PRIVATE

		protected function _doLayoutWithLocalization () : void
		{
			throw new AbstractMethodError();
			
		}
		
		/**
		 * SHARDZ: Destroy
		 * 
		 * @return void
		 */	
		override public function destroy () : void 
		{
			//OVERRIDE AS NEEDED
			super.destroy(); 
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the Event: <code>ShardzEvent.SCREEN_TRANSITION_ON_START</code>.
		 * 
		 * @param aEvent <code>ShardzEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		override protected function _onTransitionOnStart(aEvent: Event):void
		{
			transitionOnStartSignal.dispatch(aEvent);
		}
		
		/**
		 * Handles the Event: <code>ShardzEvent.SCREEN_TRANSITION_ON_COMPLETE</code>.
		 * 
		 * @param aEvent <code>ShardzEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		override protected function _onTransitionOnComplete(aEvent: Event):void
		{
			transitionOnCompleteSignal.dispatch(aEvent);
			
		}
		
		
	}
}

