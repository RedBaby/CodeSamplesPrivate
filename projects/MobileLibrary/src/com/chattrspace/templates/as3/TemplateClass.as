/**
 * Copyright (C) 2011-2012 Chattrspace Inc.                    
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
// Marks the right margin of code *******************************************************************
package com.chattrspace.templates.as3
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	/**
	 * Dispatched when ...
	 * 
	 * @aEventType com.rmc.templates.TemplateClass.SAMPLE_LOADED
	 * 
	 */
	[Event( name="sampleLoaded", type="flash.events.Event" )]
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>TemplateClass</code> is designed to...</p>
	 * 
	 */
	public class TemplateClass extends EventDispatcher
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 * Describe this member.
		 * 
		 */
		public function get sample() 					: String 	{ return _aSample_str; }
		public function set sample(aValue : String) 	: void 		{ _aSample_str = aValue; }
		private var _aSample_str : String;
		
		
		// PUBLIC CONST
		/**
		 * 
		 * The <code>TemplateClass.SAMPLE_LOADED</code> constant defines the aValue of the <code>type</code> 
		 * property of the aEvent object of type <code>aEvent</code>.
		 *
		 * <p>The properties of the aEvent object have the following aValues:</p>
		 * <table class='innertable'>
		 * <tr><th>Property</th><th>aValue</th></tr>
		 * <tr><td>bubbles</td><td>false</td></tr>
		 * <tr><td>cancelable</td><td>false</td></tr>
		 * <tr><td>currentTarget</td><td>The object that is actively processing the aEvent object with an aEvent listener.</td></tr>
		 * <tr><td>target</td><td>Any DisplayObject instance with a listener registered for this aEvent.</td></tr>
		 * ...
		 * </table>
		 * 
		 * @aEventType sampleLoaded
		 * 
		 */
		public static const SAMPLE_LOADED : String = "sampleLoaded";
		
		
		/**
		 * Describe this member.
		 * 
		 * @default SAMPLE_STATIC_CONSTANT 
		 * 
		 */
		public static const SAMPLE_STATIC_CONSTANT : String = "SAMPLE_STATIC_CONSTANT";
		
		
		// PRIVATE
		/**
		 * Describe this member.
		 * 
		 */
		private var _sample2_str : String;
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function TemplateClass()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Describe this member.
		 * 
		 * @param aSample_str Describe this parameter.
		 * 
		 * @return String Describe this return.
		 * 
		 */
		public function sampleMethod(aSample_str : String) : String
		{
			return "sample";
		}
		
		
		// PRIVATE
		/**
		 * Describe this member.
		 * 
		 * @param aSample_str Describe this parameter.
		 * 
		 * @return String Describe this return.
		 * 
		 */
		private function _sampleMethod2(aSample_str : String) : String
		{
			return "sample";
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the Event: <code>TemplateEvent.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>TemplateEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onSampleProcessComplete(aEvent : TemplateEvent) : void
		{
			
		}
		
	}
}