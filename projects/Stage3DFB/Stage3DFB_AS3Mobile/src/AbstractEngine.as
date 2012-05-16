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
package 
{
	
	import com.bit101.components.Window;
	import com.rmc.errors.AbstractMethodError;
	import com.rmc.projects.stage3dfb.data.types.EngineConfiguration;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.display.Sprite;
	import flash.events.TransformGestureEvent;

	// --------------------------------------
	// Imports
	// --------------------------------------
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>AbstractEngine</code> represents one 3D renderer which will load external models.</p>
	 * 
	 */
	public class AbstractEngine extends Sprite
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		private var _engineConfiguration : EngineConfiguration;
		public function get engineConfiguration () 					: EngineConfiguration 	{ return _engineConfiguration; }
		public function set engineConfiguration (aValue : EngineConfiguration) 	: void 		{ _engineConfiguration = aValue; }
		/**
		 * Describe this member.
		 * 
		 */
		protected var _isCurrentlyLoadingANewModel_boolean : Boolean;
		public function get isCurrentlyLoadingANewModel () 					: Boolean 	{ return _isCurrentlyLoadingANewModel_boolean; }
		public function set isCurrentlyLoadingANewModel (aValue : Boolean) 	: void 		{ _isCurrentlyLoadingANewModel_boolean = aValue; }
		
		
		// PRIVATE CONST
		/**
		 * Describe this member.
		 * 
		 */
		protected static var _MODEL_SPIN_ROTATION_AMOUNT:Number;
		
		//PUBLIC
		/**
		 * Describe this member.
		 * 
		 */
		protected static const _DEGREES_TO_RADIANS:Number = Math.PI / 180;
		
		// PRIVATE GETTTERS
		
		// PUBLIC CONST
		
		// PRIVATE CONST
		
		// PRIVATE
		/**
		 * Get the current <code>ModelLoadingData</code> 
		 * 
		 * @return ModelLoadingData
		 * 
		 */
		protected var _currentModelLoadingData : ModelData;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AbstractEngine()
		{
			
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			//	SETTINGS
			
			// METHODS
			
			
			
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Do Initial Construction
		 * 
		 * @return void
		 * 
		 */
		public function doSetup () : void
		{
			_doSetupWorld			();
			_doSetupBackground   	();
			_doSetupInput 			();
			_doFirstModelSetup		();	
			_doDispatchSetupComplete	();	
		}

		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		public function doRotateModel (aRotation_num : Number):void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
		}
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		public function doZoomModel (aZoomAmount_num : Number):void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
			
		}
		
		
		/**
		 * Reset settings
		 * 
		 * @param aEngineConfiguration : EngineConfiguration
		 * 
		 * @return void
		 * 
		 */
		public function setEngineConfiguration(aEngineConfiguration : EngineConfiguration) :void
		{
			_engineConfiguration = aEngineConfiguration;
		}
		
		/**
		 * Reset layout
		 * 
		 * @param aX_num : Number
		 * @param aY_num : Number
		 * 
		 * @return void
		 * 
		 */
		public function setViewPosition (aX_num : Number, aY_num : Number):void
		{
			throw new AbstractMethodError();
			
			
		}
		
		/**
		 * Reset layout
		 * 
		 * @param aX_num : Number
		 * @param aY_num : Number
		 * 
		 * @return void
		 * 
		 */
		public function setViewSize (aWidth_num : Number, aHeight_num : Number):void
		{
			throw new AbstractMethodError();
			
		}
		
		
		// PRIVATE
		/**
		 * SETUP: 
		 * 
		 * @return void
		 * 
		 */
		
		protected function _doSetupWorld ():void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
		}
		/**
		 * SETUP: 
		 * 
		 * @return void
		 * 
		 */
		protected function _doSetupBackground ():void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
		}
		/**
		 * SETUP: 
		 * 
		 * @return void
		 * 
		 */
		protected function _doSetupInput ():void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
		}
		/**
		 * SETUP: 
		 * 
		 * @return void
		 * 
		 */
		protected function _doFirstModelSetup ():void
		{
			//OVERRIDE THIS
			throw new AbstractMethodError();
		}
		
		/**
		 * DISPATCH EVENT: Mark that the setup is complete
		 * 
		 */
		protected function _doDispatchSetupComplete	():void
		{
			//
			dispatchEvent( new EngineEvent (EngineEvent.SETUP_COMPLETE, _currentModelLoadingData, true));
		}
		
		/**
		 * DISPATCH EVENT: Mark that the setup is complete
		 * 
		 */
		protected function _doDispatchModelLoad	():void
		{
			//
			dispatchEvent( new EngineEvent (EngineEvent.MODEL_LOAD, _currentModelLoadingData, true));

		}
		
		/**
		 * DISPATCH EVENT: Mark that the setup is complete
		 * 
		 */
		protected function _doDispatchModelProgress	(aPercentLoaded_num : Number):void
		{
			//
			_currentModelLoadingData.percentLoaded = aPercentLoaded_num;
			//
			dispatchEvent( new EngineEvent (EngineEvent.MODEL_LOAD_PROGRESS, _currentModelLoadingData, true));
		}
		
		/**
		 * DISPATCH EVENT: Mark that the setup is complete
		 * 
		 */
		protected function _doDispatchModelLoaded ():void
		{
			//
			dispatchEvent( new EngineEvent (EngineEvent.MODEL_LOADED, _currentModelLoadingData,  true));
		}
		
		
		/**
		 * DISPATCH EVENT: Mark that the setup is errored
		 * 
		 */
		protected function _doDispatchModelLoadError ():void
		{
			//
			dispatchEvent( new EngineEvent (EngineEvent.MODEL_LOAD_ERROR, _currentModelLoadingData,  true));
		}
		
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		///////////////
		//	3D EVENTS
		///////////////
		/**
		 * Handles the Event: <code>LoaderEvent.RESOURCE_COMPLETE</code>.
		 * 
		 * @param aEvent <code>LoaderEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onExternalModelLoadingProgress (aEvent : *) : void
		{
			throw new AbstractMethodError();
		}
		
		/**
		 * Handles the Event: <code>LoaderEvent.RESOURCE_COMPLETE</code>.
		 * 
		 * @param aEvent <code>LoaderEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onExternalModelLoadingCompleted (aEvent : *) : void
		{
			//SHOW SOME UNIVERSAL SUCCESS UI?
			_doDispatchModelLoaded();
			
			//SUBCLASS SHOULD OVERRIDE BUT CALL SUPER ON THIS
		}
		
		
		/**
		 * Handles the Event: <code>LoaderEvent.LOAD_ERROR</code>.
		 * 
		 * @param aEvent <code>LoaderEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onExternalModelLoadingError(aEvent : *) : void
		{
			//SHOW SOME UNIVERSAL FAILURE UI?
			_doDispatchModelLoadError();
			
			//SUBCLASS SHOULD OVERRIDE BUT CALL SUPER ON THIS
		}
		
		
	}
}