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
package com.rmc.projects.flexmobilecustomizationdemo.model.vo
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>Holds the data: For UI display </p>
	 * 
	 * NOTE: For demo the values are hardcoded here;
	 * 
	 * NOTE: In production, these values are loaded at run-time from external, local, phrases.xml
	 * 
	 */
	[Bindable]
	public class PhrasesVO	
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		/**
		 * Display Text For App
		 * 
		 */		
		public var homeViewTitle : String 			= "Home View";
		public var label1Text : String 				= "Label 1";
		public var label2Text : String 				= "Label 2";
		public var textArea1BodyText : String 		= "text area 1 body text";
		public var textArea2BodyText : String 		= "text area 2 body text";
		public var button1Label : String 			= "button 1 label";
		public var button2Label : String 			= "button 2 label";
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function PhrasesVO ()
		{
			//SUPER
			super(); 
			
		}
		
		
		
	}
}
