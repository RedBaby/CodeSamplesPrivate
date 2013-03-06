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
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadedLocationsModelSignal;
	import com.rmc.projects.racecardz.robotlegs.model.LocationsModel;
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * <p>Handles the loading of all display text from XML</p>
	 * 
	 */
	public class LoadLocationsModelService extends Actor implements ILoadService
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------

		/**
		 *  RL REFERENCE: MODEL
		 */	
		[Inject]
		public var locationModel : LocationsModel;

		/**
		 *  RL REFERENCE: SIGNAL
		 */	
		[Inject]
		public var loadedLocationsModelSignal : LoadedLocationsModelSignal;
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------

		/**
		 * This is the constructor.
		 * 
		 */
		public function LoadLocationsModelService()
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
			urlLoader.addEventListener(Event.COMPLETE, 			_onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, 	onIOError);
			
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
			
			/*
			
				LOAD SERVICE: EXAMPLE OF 'EXTERNAL DATA' (XML, CALLING A SERVER, ETC...)
			
			
			*/
			
			//CONVERT FOREIGN DATA to app-specific usable data (bogus xml->string example here)
			var xmlDoc : XML = XML (aEvent.target.data);
			var countries_xmllist : XMLList = xmlDoc.continents.continent.country
			var node : XML ;
			
			var locations_vector: Vector.<LocationVO>;
			locations_vector = new Vector.<LocationVO>();
			
			var countryName_str : String;
			var continentName_str : String;
			var locationVO : LocationVO;
			
			//if the localized version doesn't exist, use the english one
			for each (node in countries_xmllist) {
				
				countryName_str 		= node.@name 
				continentName_str 	= node.parent().@name
				trace ("yeah" + continentName_str + " : " + countryName_str);
				locations_vector.push ( new LocationVO (countryName_str, continentName_str));
			}
			
			locationModel.locations = locations_vector;
			
			//
			loadedLocationsModelSignal.dispatch();
			
		};
		
			
		/**
		 * Handles the aEvent: <code>IOErrorEvent.IO_ERROR</code>.
		 * 
		 * @param aEvent <code>IOErrorEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		public function onIOError (aEvent : IOErrorEvent) : void 
		{
			throw new IOError ("PhrasesLoadService() " + aEvent);
			
		};
	}
}

