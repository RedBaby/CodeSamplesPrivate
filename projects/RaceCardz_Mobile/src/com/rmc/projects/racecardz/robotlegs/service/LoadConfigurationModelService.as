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
package com.rmc.projects.racecardz.robotlegs.service
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.projects.racecardz.managers.AssetManager;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadedConfigurationModelSignal;
	import com.rmc.projects.racecardz.robotlegs.model.ConfigurationModel;
	import com.rmc.projects.racecardz.robotlegs.service.ILoadService;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * <p>Handles the loading of all TRT core data</p>
	 * 
	 */
	public class LoadConfigurationModelService extends Actor implements ILoadService
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 * Reference to the Model
		 * 
		 */
		[Inject]
		public var configurationModel:ConfigurationModel;
		
		/**
		 * Signal: Marks completion of load of model <code>ConfigurationModel</code>
		 * 
		 */	
		[Inject]
		public var loadedConfigurationModelSignal : LoadedConfigurationModelSignal;
		
		private static const _TYPE_BOOLEAN:String = "BOOLEAN";
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function LoadConfigurationModelService()
		{
			
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Load data from XML
		 * 
		 * @return void
		 *
		 */
		public function load (aURL_str : String) : void
		{
			//SETUP
			var xmlDoc:XML = new XML();
			var urlLoader:URLLoader = new URLLoader();
			var urlRequest:URLRequest = new URLRequest(aURL_str);
			
			//LISTEN
			urlLoader.addEventListener(Event.COMPLETE, 			_onComplete, false, 0, true);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, 	_onIOError, false, 0, true);
			
			//LOAD
			urlLoader.load(urlRequest);
			
		}
		
		/**
		 * Handles the aEvent: <code>Event.COMPLETE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onComplete (aEvent : Event) : void 
		{
			
			//CONVERT DATA TO XML FORMAT
			var xml : XML = XML (aEvent.target.data);
			//trace ("xml : " + xml.children()[0].children()[0].variables.variable);
			
			//CONVERT languages to objects
			var variables_xmllist 	: XMLList = xml.children()[0].children()[0].variables.variable;
			//
			var name_str 			: String;
			var type_str 			: String;
			var default_str 		: String;
			var childValue_str		: String; 
			var valueConverted		: *;
			//
			for each (var variable_xml:XML in variables_xmllist) {
				
				//
				name_str 			= variable_xml.@name;
				type_str 			= variable_xml.@type;
				default_str 			= variable_xml.attribute("default");
				childValue_str 		= variable_xml.children().toString();
				
				//
				if (childValue_str && childValue_str.length > 0) {
					valueConverted = childValue_str;
				} else if (default_str && default_str.length > 0) {
					valueConverted = default_str;
				} else {
					throw new Error ("LoadConfigurationModelService() - No value exists for '" +name_str+ "' and there is no default.");
				}
				
				//SET VALUE ON MODEL, TODO - CONVERT THE VALUES PROPERLY BASED ON THE XML TYPE
				switch (type_str.toUpperCase()) {
					case _TYPE_BOOLEAN:
						valueConverted = Boolean ((valueConverted.toUpperCase() == "TRUE"))
						configurationModel[name_str] = valueConverted;
						break;
					default:
						configurationModel[name_str] = valueConverted;
						break;
				}
				
				//
				//trace ("	VAR name_str: [" + name_str + "], type_str : [" + type_str + "], default_str : [" + default_str + "], childValue_str : [" + childValue_str + "], valueConverted: [" + valueConverted + "]" );
				//trace ("	" + name_str + " = " + configurationModel[name_str]);
				//trace ("");
				//trace ("");
			}
			
			//trace ("Configuration Load Service Complete");
			loadedConfigurationModelSignal.dispatch();
			
		};
		
		
		/**
		 * Handles the aEvent: <code>IOErrorEvent.IO_ERROR</code>.
		 * 
		 * @param aEvent <code>IOErrorEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		public function _onIOError (aEvent : IOErrorEvent) : void 
		{
			throw new IOError ("LoadConfigurationModelService Error () " + aEvent);
			
		};
	}
}