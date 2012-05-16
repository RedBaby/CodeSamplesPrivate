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
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	import away3d.errors.AbstractMethodError;
	
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.stage3dfb.data.types.EngineConfiguration;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import mx.events.ResizeEvent;
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>AbstractEngineBrowser</code> loads exactly one <code>IEngine</code> at a time from a list.</p>
	 * 
	 */
	[SWF (frameRate="60")]
	public class AbstractEngineBrowser extends Sprite
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PRIVATE GETTTERS
		/**
		 * Load the current <code>ModelLoadingData</code> from the list
		 * 
		 * @return ModelLoadingData
		 * 
		 */
		private function _getCurrentModelLoadingData (): ModelData
		{
			return (_modelsVector_modelloadingdata[_currentModelIndex_int] as ModelData);
		}
		
		/**
		 * Load the next <code>ModelLoadingData</code> from the list
		 * 
		 * @param aIsTraversingForward_boolean : Boolean
		 * 
		 * @return ModelLoadingData
		 * 
		 */
		private function _getNextModelLoadingData (aIsTraversingForward_boolean : Boolean): ModelData
		{
			if (aIsTraversingForward_boolean) {
				_currentModelIndex_int++;
			} else {
				_currentModelIndex_int--;
			}
			
			if (_currentModelIndex_int >= _modelsVector_modelloadingdata.length) {
				_currentModelIndex_int = 0;
			} else if (_currentModelIndex_int < 0) {
				_currentModelIndex_int = _modelsVector_modelloadingdata.length-1;
			}
			
			//CAN CURRENT ENGINE RUN THAT MODEL?
			if (_current_iEngine.isCompatibleWithModelData (_getCurrentModelLoadingData())) {
				return _getCurrentModelLoadingData();
			} else {
				//not compatible? Call for the next one
				return _getNextModelLoadingData(aIsTraversingForward_boolean);
			}
			
		}
		
		/**
		 * Settings data for the engine
		 * 
		 */
		protected var _engineConfiguration:EngineConfiguration;
		
		/**
		 * Load the current <code>IEngine</code> from the list
		 * 
		 * @return IEngine
		 * 
		 */
		private function _getCurrentIEngine (): IEngine
		{
			return (_ienginesVector_iengine[_currentIEngineIndex_int]);
		}
		
		/**
		 * Load the next <code>IEngine</code> from the list
		 * 
		 * @param aIsTraversingForward_boolean : Boolean
		 * 
		 * @return ModelLoadingData
		 * 
		 */
		protected function _getNextIEngine (aIsTraversingForward_boolean : Boolean): IEngine
		{
			if (aIsTraversingForward_boolean) {
				_currentIEngineIndex_int++;
			} else {
				_currentIEngineIndex_int--;
			}
			
			if (_currentIEngineIndex_int >= _ienginesVector_iengine.length) {
				_currentIEngineIndex_int = 0;
			} else if (_currentIEngineIndex_int < 0) {
				_currentIEngineIndex_int = _ienginesVector_iengine.length-1;
			}
			return _getCurrentIEngine();
		}
		
		
		// PUBLIC CONST
		
		// PRIVATE CONST
		/**
		 * Describe this member.
		 * 
		 */
		//private static var _MODEL_SPIN_ROTATION_AMOUNT:Number;
		
		
		// PRIVATE
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _ienginesVector_iengine:Vector.<IEngine>;
		public function get ienginesVector () 					: Vector.<IEngine> 	{ return _ienginesVector_iengine; }
		public function set ienginesVector (aValue : Vector.<IEngine>) 	: void 		{ _ienginesVector_iengine = aValue; }
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _modelsVector_modelloadingdata:Vector.<ModelData>;
		public function get modelLoadingDataVector () 					: Vector.<ModelData> 	{ return _modelsVector_modelloadingdata; }
		public function set modelLoadingDataVector (aValue : Vector.<ModelData>) 	: void 		{ _modelsVector_modelloadingdata = aValue; }
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _currentIEngineIndex_int: int = -1;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _currentModelIndex_int: int = 0; //WILL BE DECREMENTED PROPERLY DURING USE
		
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _current_iEngine : IEngine;
		public function get currentIEngine () 					: IEngine 	{ return _current_iEngine; }
		
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _isPaused_boolean:Boolean;
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		/**
		 * This is the constructor.
		 * 
		 */
		public function AbstractEngineBrowser()
		{
			
			// SUPER
			super();
			
			// EVENTS
			stage.addEventListener(ResizeEvent.RESIZE,	_onResize);
			addEventListener(Event.ADDED_TO_STAGE,	_onAddedToStage);
			
			// VARIABLES
			
			// PROPERTIES
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE
			
			// METHODS
			//override the _onAddedToStage and call super._doSetupInput();
			
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Build the 3D world, the camera, and the group to hold the model
		 * 
		 * @return void
		 * 
		 */
		protected function _doLoadEngine (aNextEngine_iengine : IEngine) : void
		{
			if ( (_current_iEngine as DisplayObject) != null) {
				//NOT SURE WHAT'S UP HERE, SOMETIMES AN ERROR
				if (_current_iEngine is Away3DEngine) {
					//DON'T REMOVE FLARE3D, NOT SURE WHY - THROWS ERROR
					removeChild(_current_iEngine as DisplayObject);
				}
				
				//	EVENTS
				if ((_current_iEngine as EventDispatcher).hasEventListener(EngineEvent.SETUP_COMPLETE) ) {
					(_current_iEngine as EventDispatcher).removeEventListener(EngineEvent.SETUP_COMPLETE, _onEngineSetupComplete)
				}
				
				_current_iEngine.dispose();
			}
			
			//	SET THE ENGINE
			_current_iEngine = aNextEngine_iengine;
			
			//	SET THE SETTINGS
			_current_iEngine.setEngineConfiguration (_engineConfiguration);
			
			//	PUT ON STAGE
			addChild(_current_iEngine as DisplayObject);
			
			//	EVENTS
			(_current_iEngine as EventDispatcher).addEventListener(EngineEvent.SETUP_COMPLETE, _onEngineSetupComplete)
			
			//CALL SETUP, upon setup complete we call load-model on the engine
			_current_iEngine.doSetup();
			
		}
		
		
		/**
		 * Listen for input
		 * 
		 * @return void
		 * 
		 */
		protected function _doSetupInput () : void
		{
			Multitouch.mapTouchToMouse = true;
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			//
			addEventListener(Event.ENTER_FRAME, 							_onEnterFrame);
			addEventListener(MouseEvent.DOUBLE_CLICK, 						_onDoubleClick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, 					_onKeyDown);
			stage.addEventListener(TransformGestureEvent.GESTURE_ROTATE, 	_onGestureRotate);
			stage.addEventListener(TransformGestureEvent.GESTURE_ZOOM, 		_onGestureZoom);
			stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, 	_onGestureSwipe);
			
		}
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		private function _doTick ():void
		{
			_current_iEngine.doTick();
			
		}
		
		//	PRIVATE
		/**
		 * Navigate Menu: 
		 * 
		 * @return void
		 * 
		 */
		private function _doNavigateMenuUp (): void
		{
			_current_iEngine.doLoadModel(_getNextModelLoadingData(true));
		}
		
		
		/**
		 * Navigate Menu: 
		 * 
		 * @return void
		 * 
		 */
		private function _doNavigateMenuDown():void
		{
			_current_iEngine.doLoadModel(_getNextModelLoadingData(false));
		}
		
		
		/**
		 * Navigate Menu: 
		 * 
		 * @return void
		 * 
		 */
		private function _doNavigateMenuRight():void
		{
			if (!_current_iEngine.isCurrentlyLoadingANewModel) {
				_doLoadEngine (_getNextIEngine(true));
			}
		}
		
		
		/**
		 * Navigate Menu: 
		 * 
		 * @return void
		 * 
		 */
		private function _doNavigateMenuLeft():void
		{
			if (!_current_iEngine.isCurrentlyLoadingANewModel) {
				_doLoadEngine (_getNextIEngine(false));
			}
		}
		
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		///////////////
		//  ENGINE EVENTS
		///////////////
		/**
		 * Handles the Event: <code>EngineEvent.SETUP_COMPLETE</code>.
		 * 
		 * @param aEvent <code>EngineEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onEngineSetupComplete (aEvent : EngineEvent):void
		{
			//	DECREMENT THE MODEL INDEX SO WE ALWAYS SHOW THE SAME MODEL WHEN WE CHANGE ENGINES
			_currentModelIndex_int--;
			_current_iEngine.doLoadModel(_getNextModelLoadingData(true));
		}	
		
		
		///////////////
		//	FLASH EVENTS
		///////////////
		/**
		 * Handles the Event: <code>Event.ADDED_TO_STAGE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onAddedToStage (aEvent : Event):void
		{
			throw new AbstractMethodError();
			
		}	
		
		
		/**
		 * Handles the Event: <code>ResizeEvent.RESIZE</code>.
		 * 
		 * @param aEvent <code>ResizeEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onResize (aEvent : *):void
		{
			throw new AbstractMethodError();
			
		}	
		
		
		///////////////
		//	MOUSE EVENTS
		///////////////
		/**
		 * Handles the Event: <code>Event.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onDoubleClick (aEvent : MouseEvent):void
		{
			_isPaused_boolean = !_isPaused_boolean;
			if (_isPaused_boolean) {
				this.addEventListener(Event.ENTER_FRAME, 		_onEnterFrame);
			} else {
				this.removeEventListener(Event.ENTER_FRAME, 	_onEnterFrame);
			}
			
		}	
		
		
		
		///////////////
		//	KEYBOARD EVENTS
		///////////////
		/**
		 * Handles the Event: <code>Event.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onKeyDown(aEvent : KeyboardEvent):void
		{
			switch (aEvent.keyCode) {
				case Keyboard.RIGHT:
					_doNavigateMenuRight();
					break;
				case Keyboard.LEFT:
					_doNavigateMenuLeft();
					break;
				case Keyboard.UP:
					_doNavigateMenuUp();
					break;
				case Keyboard.DOWN:
					_doNavigateMenuDown();
					break;
			}
			
		}	
		
		
		///////////////
		//	GESTURE EVENTS
		///////////////
		/**
		 * Handles the Event: <code>Event.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onGestureZoom(aEvent : TransformGestureEvent):void
		{
			//	REGARD X AND Y ZOOM JUST AS NON-DIRECTIONAL ZOOM
			var averageZoom : Number = Math.max(aEvent.scaleX, aEvent.scaleY);
			_current_iEngine.doZoomModel (averageZoom);
		}
		
		/**
		 * Handles the Event: <code>Event.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		protected function _onGestureRotate(aEvent : TransformGestureEvent):void
		{
			_current_iEngine.doRotateModel(aEvent.rotation);
		}
		
		/**
		 * 
		 * Handles the Event: <code>Event.SAMPLE_LOADED</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onGestureSwipe(aEvent : TransformGestureEvent):void
		{
			if (aEvent.offsetX == 1) {
				//right
				_doNavigateMenuRight();
			} else if (aEvent.offsetX == -1) {
				_doNavigateMenuLeft();
			} else if (aEvent.offsetY == 1) {
				_doNavigateMenuUp();
			} else if (aEvent.offsetY == -1) {
				_doNavigateMenuDown();
			}
			
		}
		
		///////////////
		//	ENTERFRAME EVENTS
		///////////////
		/**
		 * Handles the Event: <code>Event.ENTER_FRAME</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		public function _onEnterFrame(aEvent : Event) : void
		{
			_doTick();
		}
	}
}