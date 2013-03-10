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
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	
	import org.robotlegs.mvcs.Actor;
	
	
	
	/**
	 * <p>Model managing data: Locations</p>
	 * 
	 **/
	public class LocationsModel extends Actor
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		//PUBLIC SETTER/GETTER
		/**
		 *  
		 */		
		private var _locations_vector : Vector.<LocationVO>;
		public function get locations () 					: Vector.<LocationVO> 	{ return _locations_vector; }
		public function set locations (aValue : Vector.<LocationVO>) 	: void 		{ _locations_vector = aValue; }		
		
		
		//PUBLIC
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function LocationsModel()
		{
			//SIGNALS
			
			//PROPERTIES
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		//PUBLIC
		/**
		 * 
		 * @param locationData_str
		 * @return 
		 * 
		 */		
		public function getLocationByLocationData(aLocationData_str:String):LocationVO
		{
			var foundLocationVO : LocationVO = null;
			//
			for each (var locationVO : LocationVO in locations) {
				
				if (locationVO.data == aLocationData_str) {
					foundLocationVO = locationVO;
					break;
				}
			}
			
			return foundLocationVO;
		}
		
		
		
		

	}
}



