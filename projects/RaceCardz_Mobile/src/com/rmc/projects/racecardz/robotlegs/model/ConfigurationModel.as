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
package com.rmc.projects.racecardz.robotlegs.model
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * <p>Model managing data: Configuration data for app</p>
	 * 
	 */
	public class ConfigurationModel extends Actor
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 *  Config: Toggles the visibility for configuration prompt visible. Confirms load of configuration.xml upon application start.
		 */		
		private var _isConfigurationPromptVisible_boolean : Boolean;
		public function get isConfigurationPromptVisible () 					: Boolean 	{ return _isConfigurationPromptVisible_boolean; }
		public function set isConfigurationPromptVisible (aValue : Boolean) 	: void 		{ _isConfigurationPromptVisible_boolean = aValue; }
		
			
		/**
		 *  Config: Toggles the visibility for a debug window that shows when 
		 * images fail
		 */		
		private var _isDebugPromptVisible_boolean : Boolean;
		public function get isDebugPromptVisible () 					: Boolean 	{ return _isDebugPromptVisible_boolean; }
		public function set isDebugPromptVisible (aValue : Boolean) 	: void 		{ _isDebugPromptVisible_boolean = aValue; }
		
			
		/**
		 *  Config: Toggles the session’s mouse cursor visibility.
		 */		
		private var _isDebugPanelVisible_boolean : Boolean;
		public function get isDebugPanelVisible () 					: Boolean 	{ return _isDebugPanelVisible_boolean; }
		public function set isDebugPanelVisible (aValue : Boolean) 	: void 		{ _isDebugPanelVisible_boolean = aValue; }
		
		/**
		 *  Config: Toggles the apps use of MonsterDebugger. A free 3rd party debugger app for 'Debug...', 'Run...', and 'Export AIR Release Build...'
		 */		
		private var _isUsingMonsterDebugger_boolean : Boolean;
		public function get isUsingMonsterDebugger () 					: Boolean 	{ return _isUsingMonsterDebugger_boolean; }
		public function set isUsingMonsterDebugger (aValue : Boolean) 	: void 		{ _isUsingMonsterDebugger_boolean = aValue; }
		
		/**
		 *  	 	Toggles the visibility of an overlay of tick lines in the LifeBar 
		 * area showing days/months.
		 */		
		private var _isLifeBarGuideVisible_boolean : Boolean;
		public function get isLifeBarGuideVisible () 				: Boolean 	{ return _isLifeBarGuideVisible_boolean; }
		public function set isLifeBarGuideVisible (aValue : Boolean) 	: void 		{ _isLifeBarGuideVisible_boolean = aValue; }
			
		/**
		 *  Config: Toggles the session’s mouse cursor visibility.
		 */		
		private var _isMouseVisible_boolean : Boolean;
		public function get isMouseVisible () 					: Boolean 	{ return _isMouseVisible_boolean; }
		public function set isMouseVisible (aValue : Boolean) 	: void 		{ _isMouseVisible_boolean = aValue; }
		
		/**
		 *  Config: Toggle the fullscreen. If false, the app is in a window (for 
		 * easier debugging/development)
		 */		
		private var _isFullScreen_boolean : Boolean;
		public function get isFullScreen () 					: Boolean 	{ return _isFullScreen_boolean; }
		public function set isFullScreen (aValue : Boolean) 	: void 		{ _isFullScreen_boolean = aValue; }
		
		/**
		 *  Config: This URL is called for the session data immediately after the 
		 * config is loaded.
		 */		
		private var _backendDataURL_str : String;
		public function get backendDataURL () 					: String 	{ return _backendDataURL_str; }
		public function set backendDataURL (aValue : String) 	: void 		{ _backendDataURL_str = aValue; }
		
		/**
		 *  NOTE: THis is never loaded unless the debug panel requests it be loaded 
		 * by clicking 'reset with KS'
		 */		
		private var _backendDataURLKitchenSink_str : String;
		public function get backendDataURLKitchenSink () 					: String 	{ return _backendDataURLKitchenSink_str; }
		public function set backendDataURLKitchenSink (aValue : String) 	: void 		{ _backendDataURLKitchenSink_str = aValue; }
		
		
		/**
		 *  Config: When the application starts or resets the app simulates a ´click´ 
		 * to the main menu button of this index, showing the content for that menu item. The default value will show the top menu item´s content. 
		 */		
		private var _defaultMenuItemIndex_uint : uint;
		public function get defaultMenuItemIndex () 					: uint 	{ return _defaultMenuItemIndex_uint; }
		public function set defaultMenuItemIndex (aValue : uint) 	: void 		{ _defaultMenuItemIndex_uint = aValue; }
		

		/**
		 *  Config: This value in milliseconds. When the application sits idle with 
		 * no user interactivity for this duration, it resets to display the content of the default menu item as defined by defaultMenuItemIndex. The reset has no transition. The default time is 120000 milliseconds, which is 2 minutes. 
		 */		
		private var _idleDurationMS_uint : uint;
		public function get idleDurationMS () 					: uint 	{ return _idleDurationMS_uint; }
		public function set idleDurationMS (aValue : uint) 	: void 		{ _idleDurationMS_uint = aValue; }
		
		/**
		 *  Toggles the visibility of an overlay showing text for every successful 
		 * tracking event sent to the servers.
		 */		
		private var _isTrackingPanelVisible_boolean : Boolean;
		public function get isTrackingPanelVisible () 					: Boolean 	{ return _isTrackingPanelVisible_boolean; }
		public function set isTrackingPanelVisible (aValue : Boolean) 	: void 		{ _isTrackingPanelVisible_boolean = aValue; }
		
		
		/**
		 *    The trackingID sent to GoogleAnalytics. Default is UA-34181128-1 as 
		 * provided by Matthew Tarr <mtarr@amnh.org> on 08/18/2012.
		 */		
		private var _trackingID_str : String;
		public function get trackingID () 					: String 	{ return _trackingID_str; }
		public function set trackingID (aValue : String) 	: void 		{ _trackingID_str = aValue; }
			
		
		/**
		 *  NOTE: This is not defined by xml, its false and toggled by debugpanel 
		 * during debugging
		 */		
		private var _isUsingKitchenSinkURL_boolean : Boolean;
		public function get isUsingKitchenSinkURL () 					: Boolean 	{ return _isUsingKitchenSinkURL_boolean; }
		public function set isUsingKitchenSinkURL (aValue : Boolean) 	: void 		{ _isUsingKitchenSinkURL_boolean = aValue; }			
		
		
		//PUBLIC SETTER/GETTER

		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function ConfigurationModel()
		{
			//SIGNALS

			
			//PROPERTIES (FROM XML)
			isConfigurationPromptVisible 	= undefined;
			isDebugPromptVisible 			= undefined;
			isDebugPanelVisible 				= undefined;
			isUsingMonsterDebugger			= undefined;
			isLifeBarGuideVisible 			= undefined;
			isMouseVisible 					= undefined;
			isFullScreen 					= undefined;
			backendDataURL 					= undefined;
			backendDataURLKitchenSink 		= undefined;
			defaultMenuItemIndex 			= undefined;
			idleDurationMS 					= undefined;
			isTrackingPanelVisible 			= undefined;
			trackingID 						= undefined;
			isUsingKitchenSinkURL 			= undefined;
			
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		//PUBLIC
		/**
		 * Describe this member.
		 * 
		 * @param aSample_str Describe this parameter.
		 * 
		 * @return String Describe this return.
		 * 
		 */
		public function getConfigurationsBodyText():String
		{
			// TODO Auto Generated method stub
			var text_str : String = "";

			text_str += _getConfigurationBodyTextLine ("isConfigurationPromptVisible");
			text_str += _getConfigurationBodyTextLine ("isDebugPromptVisible");
			text_str += _getConfigurationBodyTextLine ("isDebugPanelVisible");
			text_str += _getConfigurationBodyTextLine ("isUsingMonsterDebugger");
			text_str += _getConfigurationBodyTextLine ("isTrackingPanelVisible");
			text_str += _getConfigurationBodyTextLine ("isLifeBarGuideVisible");
			text_str += _getConfigurationBodyTextLine ("isMouseVisible");
			text_str += _getConfigurationBodyTextLine ("isFullScreen");
			text_str += _getConfigurationBodyTextLine ("backendDataURL");
			text_str += _getConfigurationBodyTextLine ("backendDataURLKitchenSink");
			text_str += _getConfigurationBodyTextLine ("trackingID");
			text_str += _getConfigurationBodyTextLine ("idleDurationMS");
			text_str += _getConfigurationBodyTextLine ("defaultMenuItemIndex");
			
			return text_str;
		}
		
		//PRIVATE
		/**
		 * Describe this member.
		 * 
		 * @param aSample_str Describe this parameter.
		 * 
		 * @return String Describe this return.
		 * 
		 */
		private function _getConfigurationBodyTextLine(aPropertyName_str : String):String
		{
			return "	* " + aPropertyName_str + " = " + this[aPropertyName_str] + "<br/>";//must be lower case br
		}
	}
}