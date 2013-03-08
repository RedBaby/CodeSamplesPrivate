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
package com.rmc.projects.racecardz.robotlegs.model.vo
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>Holds the data: For UI in the spinner list </p>
	 * 
	 */
	public class LocationVO	
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		/**
		 *  
		 */		
		private var _title_str : String;
		public function get title () 					: String 	{ return _title_str; }
		public function set title (aValue : String) 		: void 		{ _title_str = aValue; }
		
		/**
		 *  
		 */		
		private var _data_str : String;
		public function get data () 					: String 	{ return _data_str; }
		public function set data (aValue : String) 	: void 		{ _data_str = aValue; }
		
		/**
		 *  
		 */		
		private var _continentVO : ContinentVO;
		public function get continent () 						: ContinentVO 	{ return _continentVO; }
		public function set continent (aValue : ContinentVO) 	: void 		{ _continentVO = aValue; }
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function LocationVO (aTitle_str : String, aData_str : String, aContinent: ContinentVO)
		{
			//SUPER
			super(); 
			_title_str 		= aTitle_str;
			_data_str 		= aData_str;
			_continentVO 	= aContinent;

		}

		//--------------------------------------
		//  Method
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function toString () : String 
		{
			return "[LocationVO "+_title_str+"]";
		}
		
	}
}
