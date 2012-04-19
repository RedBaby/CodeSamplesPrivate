/**
 * Copyright (C) 2005-2012 by Rivello Multimedia Consulting (RMC).                    
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
package com.rmc.projects.flexmobilecustomizationdemo.model
{

	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.projects.flexmobilecustomizationdemo.model.vo.PhrasesVO;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>Holds the data: For UI display </p>
	 * 
	 * NOTE: For demo the PhrasesVO is exposed as a static property
	 * 
	 * NOTE: In production phrasesVo will be exposed as a instance property
	 * 
	 */
	[Bindable]
	public class PhrasesModel	
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		
		//PUBLIC STATIC GETTER/SETTER
		
		/**
		 *  Contains reference to all display phrases.
		 */		
		private static var _PHRASES_VO : PhrasesVO;
		public static function get PHRASES_VO () 					: PhrasesVO 	{ 
			
			if (!PhrasesModel._PHRASES_VO) {
				PhrasesModel._PHRASES_VO = new PhrasesVO();
			}
			return PhrasesModel._PHRASES_VO; 
		}
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function PhrasesModel ()
		{
			//SUPER
			super(); 
			
		}
		
		
		
	}
}
