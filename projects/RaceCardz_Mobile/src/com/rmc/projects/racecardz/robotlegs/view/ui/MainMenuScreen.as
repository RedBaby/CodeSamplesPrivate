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
	import com.rmc.projects.racecardz.robotlegs.controller.events.CoreEvent;
	import com.rmc.projects.shardz.controls.ShardzScreen;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	
	import starling.events.Event;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>MainMenuScreen</code> class is ...</p>
	 * 
	 */
	public class MainMenuScreen extends ShardzScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		/**
		 *  
		 */		
		private var _dataProvider_listcollection : ListCollection;
		public function get dataProvider () 					: ListCollection 	{ return _dataProvider_listcollection; }
		public function set dataProvider (aValue : ListCollection) 	: void 		
		{ 
			//
			_dataProvider_listcollection = aValue;
			//
			if (_buttonGroup) {
				_buttonGroup.dataProvider = _dataProvider_listcollection
			}
		}
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "MainMenuScreen";

		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------


		private var _buttonGroup:ButtonGroup;

		/**
		 * This is the constructor.
		 * 
		 */
		public function MainMenuScreen()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
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
			
			//
			title = "Menu";
			//
			//shardzHeader.visible = false;
			shardzHeader.previousButton.visible = false;
			shardzHeader.nextButton.visible = false;
			
			//ATTACH THINGS
			_buttonGroup = new ButtonGroup();
			_buttonGroup.direction		= ButtonGroup.DIRECTION_VERTICAL;
			//
			if (_dataProvider_listcollection) {
				_buttonGroup.dataProvider = _dataProvider_listcollection
			}
			this.addChild(_buttonGroup);
			
			
			//SET FROM OUTSIDE
			var listCollection : ListCollection 	= new ListCollection(
				[
					{ label: "Play Game", triggered: _onMenuItemClick },
					{ label: "Other", triggered: _onMenuItemClick },
				]);
			dataProvider = listCollection;
			
		}
		
		private function _onMenuItemClick(aEvent:Event):void
		{
			const button:Button = (aEvent.currentTarget as Button);
			trace(button.label + " triggered!");
			dispatchEvent( new CoreEvent (CoreEvent.CHANGE_SCREEN));
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

			//
			_buttonGroup.validate();
			_buttonGroup.x = (this.actualWidth - _buttonGroup.width) / 2;
			_buttonGroup.y = -shardzHeader.height + (this.actualHeight - shardzHeader.height - _buttonGroup.height) / 2;

			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}