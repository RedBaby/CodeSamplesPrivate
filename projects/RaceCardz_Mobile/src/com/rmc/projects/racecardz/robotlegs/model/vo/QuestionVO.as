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
	public class QuestionVO
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		/**
		 *  
		 */		
		private var _locationVO : LocationVO;
		public function get locationVO () 					: LocationVO 	{ return _locationVO; }
		public function set locationVO (aValue : LocationVO) 	: void 		{ _locationVO = aValue; }
		
		/**
		 *  
		 */		
		private var _imageURL_str : String;
		public function get imageURL () 					: String 	{ return _imageURL_str; }
		public function set imageURL (aValue : String) 	: void 		{ _imageURL_str = aValue; }
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function QuestionVO (aLocationVO : LocationVO, aImageURL_str)
		{
			//SUPER
			super(); 
			_locationVO 		= aLocationVO;
			_imageURL_str 	= aImageURL_str;

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
			return "[QuestionVO "+_locationVO+"]";
		}
		
	}
}
