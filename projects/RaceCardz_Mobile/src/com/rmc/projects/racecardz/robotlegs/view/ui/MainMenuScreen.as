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
	import com.rmc.projects.racecardz.managers.AssetManager;
	import com.rmc.projects.racecardz.robotlegs.model.PhrasesModel;
	import com.rmc.projects.shardz.controls.ShardzScreen;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>MainMenuScreen</code> class is ...</p>
	 * 
	 */
	public class MainMenuScreen extends AbstractScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		/**
		 *  
		 */		
		private var _settingsButtonClickSignal : Signal;
		public function get settingsButtonClickSignal () 					: Signal 	{ return _settingsButtonClickSignal; }
		
		
		/**
		 *  
		 */		
		private var _menuButtonClickSignal : Signal;
		public function get menuButtonClickSignal () 					: Signal 	{ return _menuButtonClickSignal; }
		
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
		
		private var _buttonGroup:ButtonGroup;
		private var listCollection:ListCollection;
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "MainMenuScreen";
		public static const BUTTON_OTHER: String = "BUTTON_OTHER";
		public static const BUTTON_PLAY_GAME: String = "BUTTON_PLAY_GAME";
		
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		private var _logo_image:Image;
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
			_menuButtonClickSignal 		= new Signal ();
			_settingsButtonClickSignal 	= new Signal();
			
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
			
			_doLayoutContainer(VerticalLayout);
			
			//
			//shardzHeader.visible = false;
			shardzHeader.previousButton.visible 	= false;
			shardzHeader.nextButton.visible 		= true;
			
			//LISTEN
			addEventListener(ShardzEvent.HEADER_NEXT_BUTTON_CLICK, _onSettingsButtonClick);
			
			//ATTACH THINGS
			
			_logo_image = new Image (Texture.fromBitmap( new AssetManager.IMAGE_APP_LOGO ()));
			container.addChild(_logo_image);
			
			
			
			_buttonGroup = new ButtonGroup();
			_buttonGroup.direction		= ButtonGroup.DIRECTION_VERTICAL;
			_buttonGroup.gap = 50;
			//
			if (_dataProvider_listcollection) {
				_buttonGroup.dataProvider = _dataProvider_listcollection
			}
			container.addChild(_buttonGroup);
			
			
			
		}
		
		
		
		override protected function _doLayoutWithLocalization () : void
		{
			//
			title = phrasesModel.phrasesVO.titleMainMenuScreen_str;
			shardzHeader.nextButton.label = phrasesModel.phrasesVO.buttonSettings_str
			
			//SET FROM OUTSIDE
			listCollection 	= new ListCollection(
				[
					{ 
						
						label: phrasesModel.phrasesVO.buttonPlayGame_str,
						triggered: function(event:Event):void
						{
							_onMenuItemClick(event, BUTTON_PLAY_GAME);
						}
						
					},
					{ 
						label: phrasesModel.phrasesVO.buttonOther_str, 
						triggered: function(event:Event):void
						{
							_onMenuItemClick(event, BUTTON_OTHER);
						}
						
					},
				]);
			dataProvider = listCollection;
			
		}
		
		private function _onMenuItemClick(aEvent:Event, aButtonData_str : String):void
		{
			const button:Button = (aEvent.currentTarget as Button);
			_menuButtonClickSignal.dispatch(aButtonData_str);
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
			
			
			//_logo_image.width = container.minWidth;
			//_logo_image.height = actualWidth; //square
			
			//
			_buttonGroup.validate();
			_buttonGroup.x = (this.actualWidth - _buttonGroup.width) / 2;
			_buttonGroup.y = -shardzHeader.height + (this.actualHeight - shardzHeader.height - _buttonGroup.height) / 2;
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onSettingsButtonClick(aEvent : ShardzEvent):void
		{
			_settingsButtonClickSignal.dispatch(aEvent);
			
		}
		
	}
}
