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
// Marks the right margin of code *******************************************************************
package 
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.events.Event;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	/**
	 * Dispatched when the screen starts to show
	 * 
	 * @aEventType com.rmc.events.EngineEvent.SETUP_COMPLETE
	 * 
	 */
	[Event( name="SETUP_COMPLETE", type="flash.events.Event" )]
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This is designed to...</p>
	 * 
	 *
	 */
	public class EngineEvent extends Event
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		private var _modelData : ModelData;
		public function get modelData () 					: ModelData 	{ return _modelData; }
		public function set modelData (aValue : ModelData) 	: void 		{ _modelData = aValue; }
		
		// PUBLIC CONST
		/**
		 * 
		 * The <code>EngineEvent.SETUP_COMPLETE</code> constant defines the aValue of the <code>type</code> 
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
		public static const SETUP_COMPLETE : String = "setupComplete";
		
		
		/**
		 * 
		 * The <code>EngineEvent.MODEL_LOAD</code> constant defines the aValue of the <code>type</code> 
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
		 * @aEventType modelLoad
		 * 
		 */
		public static const MODEL_LOAD : String = "modelLoad";
		
		
		/**
		 * 
		 * The <code>EngineEvent.MODEL_LOAD_PROGRESS</code> constant defines the aValue of the <code>type</code> 
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
		 * @aEventType modelLoadProgress
		 * 
		 */
		public static const MODEL_LOAD_PROGRESS : String = "modelLoadProgress";
		
		
		/**
		 * 
		 * The <code>EngineEvent.MODEL_LOADED</code> constant defines the aValue of the <code>type</code> 
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
		 * @aEventType modelLoaded
		 * 
		 */
		public static const MODEL_LOADED : String = "modelLoaded";
		
		/**
		 * 
		 * The <code>EngineEvent.MODEL_LOAD_ERROR</code> constant defines the aValue of the <code>type</code> 
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
		 * @aEventType modelLoadError
		 * 
		 */
		public static const MODEL_LOAD_ERROR : String = "modelLoadError";
		
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function EngineEvent (	aType_str 			: String, 
										aModelData			: ModelData,
										aBubbles_boolean 	: Boolean = false, 
										aCancelable_boolean : Boolean = false)
		{
			
			//SUPER
			super(aType_str, aBubbles_boolean, aCancelable_boolean); 
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			_modelData = aModelData;
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Clones this object. Must be overridden by the subclass.
		 * 
		 * @return Event
		 * 
		 */
		public override function clone() : Event 
		{
			return new EngineEvent(type, modelData, bubbles, cancelable);
			
		}
		
		// PRIVATE
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
	}
}
