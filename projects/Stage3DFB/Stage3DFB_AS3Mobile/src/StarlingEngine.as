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
	import com.rmc.data.types.ModelType;
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;

	
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>StarlingEngine</code> represents one 3D renderer which will load external models.</p>
	 * 
	 */
	public class StarlingEngine extends AbstractEngine implements IEngine
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PRIVATE GETTTERS
		
		// PUBLIC CONST
		
		// PRIVATE
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _starlingEngineGame : StarlingEngineGame;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theExternallyLoadedChildOfTheModel : Sprite;

		/**
		 * Describe this member.
		 * 
		 */
		private var _theModel : Sprite
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _thePrimitiveChildOfTheModel:Sprite;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _statsWidget:MrDoobStats;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		private var Game:Class;

		private var _starling:Starling;

		/**
		 * This is the constructor.
		 * 
		 */
		public function StarlingEngine()
		{
			
			// SUPER
			super("Starling");//TITLE FOR DISPLAY PURPOSES ONLY
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			//	SETTINGS
			AbstractEngine._MODEL_SPIN_ROTATION_AMOUNT = 1;
			_isCurrentlyLoadingANewModel_boolean 	= false;
			
			// METHODS
			
			
			
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Can this engine use a given model?
		 * 
		 * @param aModelLoadingData : ModelLoadingData
		 * 
		 * @return Boolean
		 * 
		 */
		public function isCompatibleWithModelData ( aModelLoadingData : ModelData) : Boolean
		{
			return aModelLoadingData.isStarlingCompatible;
		}
		
		
		/**
		 * DO Final destruction
		 * 
		 * @return void
		 * 
		 */
		public function dispose () : void
		{
			UIManager.getDashboardContents().removeChild(_statsWidget);
			//removeChild(_starlingEngineGame);
			//_view3D.dispose();
		}

		
		/**
		 * Load the next model in the list. Remove the current model
		 * 
		 * @param aIsTraversingForward_boolean : Boolean, true means show the next in order
		 * 
		 * @return void
		 * 
		 */
		public function doLoadModel (aModelLoadingData : ModelData):void
		{
			
			if (!_isCurrentlyLoadingANewModel_boolean) {
				
				//STORE THE NEW
				_currentModelLoadingData = aModelLoadingData;
				
				//REMOVE OLD LOADER
				if (_theModel.contains(_theExternallyLoadedChildOfTheModel)) {
					_theModel.removeChild(_theExternallyLoadedChildOfTheModel);
					_theExternallyLoadedChildOfTheModel.dispose();
				}
				//REMOVE OLD PRIMITIVE
				if (_theModel.contains(_thePrimitiveChildOfTheModel)) {
					_theModel.removeChild(_thePrimitiveChildOfTheModel);
					_thePrimitiveChildOfTheModel.dispose();
				}
				
				//CREATE NEW
				switch (_currentModelLoadingData.modelType) {
					case ModelType.EMBEDDED_FILE:
						//	EVENTS
						_doDispatchModelLoad();
						//	SETUP
						_isCurrentlyLoadingANewModel_boolean = true; //SINCE WE ARE DOING ASYNC LOAD, FLAG THAT
						
						//_starlingEngineGame.doRender_FromEmbeddedSWFSymbol();

						break;
					default:
						throw new SwitchStatementDefaultError();
						break;
				}
				
			}
			
		}	
		
		
		/**
		 * Handle ticking
		 * 
		 * @return void
		 * 
		 */
		public function doTick ():void
		{
			//don't spin automatically
			//_theModel.rotation += AbstractEngine._MODEL_SPIN_ROTATION_AMOUNT;
			
			//TODO, CALL MANUALLY
			//_starlingEngineGame.render();
			
		}
		
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doRotateModel (aRotation_num : Number):void
		{
			_theModel.rotation += aRotation_num;
		}
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doZoomModel (aZoomAmount_num : Number):void
		{
			/*
			//	'MOVE' A PROXY CAMERA, THIS IS SO WE CAN USE THE 'moveForward' method, but just to measure distance
			//	only for a legal move do we truely update the camera
			//	TODO - is there  a more optimized way to do this?
			var temporaryCamera : Camera3D	   = new Camera3D();
			temporaryCamera.position		   = _theCamera.position;
			
			//	MOVE
			var moveForwardAmount_num : Number = 20*Math.pow(aZoomAmount_num,1);
			if (aZoomAmount_num > 1) {
				temporaryCamera.moveForward(-moveForwardAmount_num);
			} else {
				temporaryCamera.moveForward(moveForwardAmount_num);
			}
			
			//DISTANCE TO MODEL
			var distance : Number = Vector3D.distance(temporaryCamera.position, _theModel.position);
			
			if (distance > engineConfiguration.modelDistanceNear &&
				distance < engineConfiguration.modelDistanceFar) {
				//LEGAL DISTANCE - UPDATE THE CAMERA FOR REAL
				_theCamera.position = temporaryCamera.position;
				
			}
		*/	
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
		override public function setViewPosition (aX_num : Number, aY_num : Number):void
		{
			if (_starlingEngineGame) {
				_starlingEngineGame.x = aX_num;
				_starlingEngineGame.y = aY_num;
			}
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
		override public function setViewSize (aWidth_num : Number, aHeight_num : Number):void
		{
			if (_starlingEngineGame) {
				_starlingEngineGame.width 	= aWidth_num;
				_starlingEngineGame.height 	= aHeight_num;
			}
			
		}
		
		
		
		
		//	PRIVATE
		private function _onRootCreated(event:Event):void 
		{
			_starling.removeEventListener(Event.CONTEXT3D_CREATE, _onRootCreated);
			_starlingEngineGame = Starling.current.stage.getChildAt(0) as StarlingEngineGame;
			
			trace ("_starlingEngineGame: " + _starlingEngineGame);
		}
		
		/**
		 * Build the 3D world, the camera, and the group to hold the model
		 * 
		 * @return void
		 * 
		 */
		override protected function _doSetupWorld () : void
		{
			_starling = new Starling (StarlingEngineGame, stage);
			_starling.addEventListener(Event.CONTEXT3D_CREATE, _onRootCreated);
			_starling.enableErrorChecking = false;	//true is slower, but may help debugging
			_starling.antiAliasing = engineConfiguration.antiAlias
			_starling.start();
			
			
			/*
			setViewPosition(0,0);
			setViewSize(engineConfiguration.viewWidth, engineConfiguration.viewHeight);
			_starlingEngineGame.backgroundColor = engineConfiguration.cameraBackgroundColor;
			addChild(_starlingEngineGame);
			//
			_theCamera = _starlingEngineGame.camera;
			_theCamera.position 	= engineConfiguration.cameraPosition;
			_theCamera.lens 		= new PerspectiveLens (engineConfiguration.cameraFieldOfView);
			_theCamera.lens.near 	= engineConfiguration.cameraNear; 
			_theCamera.lens.far 	= engineConfiguration.cameraFar; 
			*/
			//
		}
		
		
		/**
		 * SETUP: Background
		 * 
		 * @return void
		 * 
		 */
		override protected function _doSetupBackground () : void
		{
			//
			//var bitmap : Bitmap = new AssetManager.BACKGROUND ();
			//_starlingEngineGame.background = new BitmapTexture (bitmap.bitmapData);
		}
		
		
		/**
		 * Listen for input
		 * 
		 * @return void
		 * 
		 */
		override protected function _doSetupInput () : void
		{
			//the stats
			 _statsWidget = new MrDoobStats();
			 UIManager.getDashboardContents().addChild(_statsWidget);
			
		}
		
		/**
		 * Build the holder for the first model and load it.
		 * 
		 * @return void
		 * 
		 */
		override protected function _doFirstModelSetup () : void
		{
			
			//CREATE A GROUP, WE WILL ONLY EDIT THE GROUP AS WE ROTATE/ZOOM/ETC...
			//	THIS LET'S THE MODEL WITHIN HAVE ANY ONE-TIME OFFSETS WE WANT, BUT THEN NOT BE 'TOUCHED'
			_theModel = new Sprite ();
			
			//_starlingEngineGame.scene.addChild(_theModel);
			
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
		override protected function _onExternalModelLoadingCompleted (aEvent : *) : void
		{
			/*
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingCompleted(aEvent);
			
			//MORE STUFF
			
			//STRONG TYPE SINCE SUPERCLASS CANNOT. COOL.
			var event : LoaderEvent = aEvent as LoaderEvent;
			
			_isCurrentlyLoadingANewModel_boolean = false;
			_theExternallyLoadedChildOfTheModel.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, _onExternalModelLoadingCompleted );
			_theExternallyLoadedChildOfTheModel.removeEventListener(LoaderEvent.LOAD_ERROR, _onExternalModelLoadingError);
			_theModel.addChild(_theExternallyLoadedChildOfTheModel);
			
			//POSITION THE MODEL (JUST ONE TIME WITHIN LOADER, THEN DON'T 'TOUCH' IT)
			_theExternallyLoadedChildOfTheModel.scaleX 		= _currentModelLoadingData.originalScale.x;
			_theExternallyLoadedChildOfTheModel.scaleY 		= _currentModelLoadingData.originalScale.y;
			_theExternallyLoadedChildOfTheModel.scaleZ 		= _currentModelLoadingData.originalScale.z;
			_theExternallyLoadedChildOfTheModel.position 	= _currentModelLoadingData.originalPosition;
			_theExternallyLoadedChildOfTheModel.rotationX 	= _currentModelLoadingData.originalRotation.x;
			_theExternallyLoadedChildOfTheModel.rotationY 	= _currentModelLoadingData.originalRotation.y;
			_theExternallyLoadedChildOfTheModel.rotationZ 	= _currentModelLoadingData.originalRotation.z;
*/
		}
		
		
		/**
		 * Handles the Event: <code>LoaderEvent.LOAD_ERROR</code>.
		 * 
		 * @param aEvent <code>LoaderEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		override protected function _onExternalModelLoadingError(aEvent : *) : void
		{
			/*
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingError(aEvent);
			
			//MORE STUFF
			
			//STRONG TYPE SINCE SUPERCLASS CANNOT. COOL.
			var event : LoaderEvent = aEvent as LoaderEvent;
			
			trace('Could not find', event.url);
			_theExternallyLoadedChildOfTheModel.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, _onExternalModelLoadingCompleted );
			_theExternallyLoadedChildOfTheModel.removeEventListener(LoaderEvent.LOAD_ERROR, 		_onExternalModelLoadingError);
			_theExternallyLoadedChildOfTheModel = null;
			
			*/
		}
		
		
	}
}