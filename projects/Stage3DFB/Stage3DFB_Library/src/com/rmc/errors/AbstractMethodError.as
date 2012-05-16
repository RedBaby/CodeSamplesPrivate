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
package com.rmc.errors
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
	 * <p>This Error is to be used in every method in a Abstract class.  
	 * Such methods should never be called.  Only overrritten.</p>
	 * 
	 */
	public class AbstractMethodError extends Error
	{		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AbstractMethodError(aMessage_str : String="AbstractMethodError.  This method must be overridden before it is used.", aID_int : int=0)
		{
			// SUPER
			super(aMessage_str, aID_int);
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			// METHODS
		}
		
	}
}