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
package com.rmc.projects.racecardz.managers
{
	import com.gskinner.utils.Rndm;
	import com.rmc.projects.racecardz.robotlegs.model.LocationsModel;
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>DataMagic</code> is designed to encapsulate reusable possibly-hacky solutions 
	 * so we can correct them once here, not in many places.</p>
	 * 
	 *
	 */
	public class DataMagic
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC STATIC
		
		
		// PRIVATE STATIC
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC STATIC
		
		
		// --------------------------------------
		// 
		// 
		// RELATED TO: Dates
		// 
		// 
		// 
		// --------------------------------------
		/**
		 * Convert string date to strong type date
		 * 
		 * @param aYYYYMMDDDate_str : String
		 * 
		 * @return Date
		 * 
		 */
		private static function _SortByAlphabet (aString1_str : String, aString2_str : String) : int
		{
			if (aString1_str > aString2_str) {
				return 1;
			} else {
				return -1;
				
			}
		}
		public static function GetGroupsArrayFromLocationsModel(aLocationsModel : LocationsModel):Array
		{
			
			var groups_array:Array = new Array();
			var continents_vector : Vector.<String> = new Vector.<String>();
			//
			for each (var aLocationVO : LocationVO in aLocationsModel.locations) {
				
				if (continents_vector.indexOf(aLocationVO.continent.title) == -1) {
					continents_vector.push(aLocationVO.continent.title);
				}
			}
			continents_vector.sort(_SortByAlphabet);
			
			var countriesWithinContinent_array:Array;
			for each (var continent_str : String in continents_vector) {
				
				//
				countriesWithinContinent_array = DataMagic.GetCountriesWithinContinentArray (aLocationsModel, continent_str);
				//PUSH
				groups_array.push(
					{
						header: continent_str,
						children: countriesWithinContinent_array
					}
				);
			}
			trace ("continents_vector: " + continents_vector);
			
			groups_array.fixed = true;
			
			return groups_array;
		}
		
		
		public static function GetCountriesWithinContinentArray(aLocationsModel : LocationsModel, aContinentTitle_str:String):Array
		{
			var countries_array : Array = new Array ();
			
			for each (var aLocationVO : LocationVO in aLocationsModel.locations) {
				
				if (aLocationVO.continent.title == aContinentTitle_str) {
					countries_array.push ({text : aLocationVO.title, data : aLocationVO });
				}
			}
			return countries_array;
		}
		
		public static function ShuffleVector(vec:Vector.<*>):void
		{
			
			//COMMENT *OUT* IF YOU WANT TO USE THE SAME SEED (SAME RESULTS), COMMENT-IN FOR LAUNCH
			Rndm.seed = Math.random()*100000;
			
				
			//RANDOMIZE
			if (vec.length > 1){
				var i:int = vec.length - 1;
				while (i > 0) {
					var s:Number = Rndm.integer(0, vec.length);
					var temp:* = vec[s];
					vec[s] = vec[i];
					vec[i] = temp;
					i--;
				}
			}
		}
	}
	
	
	
	
}

