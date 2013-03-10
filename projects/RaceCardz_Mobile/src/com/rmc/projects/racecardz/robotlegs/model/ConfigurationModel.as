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
		 *  Config: This value in milliseconds. Duration of a question.
		 */		
		private var _questionTimerDurationMS_uint : uint;
		public function get questionTimerDurationMS () 					: uint 	{ return _questionTimerDurationMS_uint; }
		public function set questionTimerDurationMS (aValue : uint) 	: void 		{ _questionTimerDurationMS_uint = aValue; }
		
		/**
		 *    The trackingID sent to GoogleAnalytics. Default is UA-34181128-1 as 
		 * provided by Matthew Tarr <mtarr@amnh.org> on 08/18/2012.
		 */		
		private var _trackingID_str : String;
		public function get trackingID () 					: String 	{ return _trackingID_str; }
		public function set trackingID (aValue : String) 	: void 		{ _trackingID_str = aValue; }
			
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