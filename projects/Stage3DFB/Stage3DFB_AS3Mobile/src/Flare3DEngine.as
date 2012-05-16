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
	
	import flare.basic.Scene3D;
	import flare.core.Camera3D;
	import flare.core.Pivot3D;
	import flare.loaders.Flare3DLoader1;
	import flare.primitives.Cube;
	import flare.primitives.SkyBox;
	import flare.primitives.Sphere;
	
	import flash.display.Bitmap;
	import flash.geom.Vector3D;
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>Flare3DEngine</code> represents one 3D renderer which will load external models.</p>
	 * 
	 */
	public class Flare3DEngine extends AbstractEngine implements IEngine
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
		private var _view3D : Scene3D;
		
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theCamera : Camera3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theModel : Pivot3D
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _thePrimitiveChildOfTheModel:Pivot3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theExternallyLoadedChildOfTheModel:Pivot3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _statsWidget:Flare3DStats;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var axis:Pivot3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var floor:Pivot3D;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function Flare3DEngine()
		{
			
			// SUPER
			super();
			
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
			return aModelLoadingData.isFlare3DCompatible
		}
		
		/**
		 * DO Final destruction
		 * 
		 * @return void
		 * 
		 */
		public function dispose () : void
		{
			removeChild(_statsWidget);
			_view3D.dispose();
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
				if (_theModel && _theExternallyLoadedChildOfTheModel && _theModel.getChildByName(_theExternallyLoadedChildOfTheModel.name) ) {
					_theModel.removeChild(_theExternallyLoadedChildOfTheModel);
					_theExternallyLoadedChildOfTheModel.dispose();
				}
				
				//REMOVE OLD PRIMITIVE
				if (_theModel && _thePrimitiveChildOfTheModel && _theModel.getChildByName(_thePrimitiveChildOfTheModel.name)  ) {
					_theModel.removeChild(_thePrimitiveChildOfTheModel);
					_thePrimitiveChildOfTheModel.dispose();
				}
				
				//CREATE NEW
				switch (_currentModelLoadingData.modelType) {
					case ModelType.EXTERNAL_MODEL:
						// add global scene progress and complete events.
						_view3D.addEventListener( Scene3D.PROGRESS_EVENT, _onExternalModelLoadingProgress );
						_view3D.addEventListener( Scene3D.COMPLETE_EVENT, _onExternalModelLoadingCompleted );
						_theExternallyLoadedChildOfTheModel = _view3D.addChildFromFile( _currentModelLoadingData.modelURL );
						_theExternallyLoadedChildOfTheModel.visible = false; //hide until loaded and sized to prevent flicker
						_theModel.addChild(_theExternallyLoadedChildOfTheModel);
						break;
					case ModelType.WIREFRAME_CUBE:
						_thePrimitiveChildOfTheModel = new Cube ("Cube", 
							_currentModelLoadingData.originalScale.x,
							_currentModelLoadingData.originalScale.y,
							_currentModelLoadingData.originalScale.z,
							1, 
							null
						);
						_theModel.addChild(_thePrimitiveChildOfTheModel);
						
						break;
					case ModelType.WIREFRAME_SPHERE:
						_thePrimitiveChildOfTheModel = new Sphere ("Sphere",
							_currentModelLoadingData.originalScale.x,
							24,
							null
						);
						_theModel.addChild(_thePrimitiveChildOfTheModel);
						
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
			_theModel.rotateY(AbstractEngine._MODEL_SPIN_ROTATION_AMOUNT, true);
			//_theCamera.lookAt(
			//_view3D.render();
			_theCamera.lookAt(0,0,0); //_theModel.x,_theModel.y,_theModel.z);
			
			
			//I WANT TO CONTROL THIS MANUALLY
			if ( !_view3D.context ) return;
			//Input3D.update(); // if you want to use the Input3D class.
			//NOT NEEDED_view3D.camera.update(); // updates all the scene animations.
			_view3D.update(); // updates all the scene animations.
			_view3D.setupFrame(); // sets some global variables to use during the frame render..
			_view3D.clearColor = new Vector3D (0xFF0000, 0xFF0000, 0xFF0000, 0xFF0000);
			_view3D.context.clear(); // clear the back buffer.
			_view3D.render(); // render the entire scene (you can draw here individual objects)
			_view3D.context.present(); // shows the result on the screen.
			
		}
		
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doRotateModel (aRotation_num : Number):void
		{
			_theModel.rotateZ(aRotation_num, false);
		}
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doZoomModel (aZoomAmount_num : Number):void
		{
			
			//	'MOVE' A PROXY CAMERA, THIS IS SO WE CAN USE THE 'moveForward' method, but just to measure distance
			//	only for a legal move do we truely update the camera
			//	TODO - is there  a more optimized way to do this?
			var temporaryNewPosition : Camera3D	 = new Camera3D ();
			temporaryNewPosition.setPosition(_theCamera.x, _theCamera.y, _theCamera.z);
			
			//	MOVE IN DIRECTION TO/FROM MODEL
			var moveForwardAmount_num : Number = 20*Math.pow(aZoomAmount_num,1);
			if (aZoomAmount_num > 1) {
				temporaryNewPosition.translateAxis(-moveForwardAmount_num, _theCamera.getBackward(false));
			} else {
				temporaryNewPosition.translateAxis(moveForwardAmount_num, _theCamera.getBackward(false));
			}
			
			//DISTANCE TO MODEL
			var distance : Number = Vector3D.distance(temporaryNewPosition.getPosition(false), _theModel.getPosition(false));
			//
			if (distance > engineConfiguration.modelDistanceNear &&
				distance < engineConfiguration.modelDistanceFar) {
				//LEGAL DISTANCE - UPDATE THE CAMERA FOR REAL
				_theCamera.setPosition(temporaryNewPosition.x,temporaryNewPosition.y,temporaryNewPosition.z);
				
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
		override public function setViewPosition (aX_num : Number, aY_num : Number):void
		{
			if (_view3D) {
				_view3D.x = aX_num;
				_view3D.y = aY_num;
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
			if (_theCamera) {
				_view3D.setViewport(0,0,aWidth_num, aHeight_num);
			}
		}
		
		
		//	PRIVATE
		
		
		/**
		 * Build the 3D world, the camera, and the group to hold the model
		 * 
		 * @return void
		 * 
		 */
		override protected  function _doSetupWorld () : void
		{
			Flare3DLoader1; // force to include the old f3d loader.
			
			
			_view3D = new Scene3D (this);
			_view3D.name = "CustomScene3D";
			_view3D.showLogo = false;
			setViewPosition(0,0);
			setViewSize(engineConfiguration.viewWidth, engineConfiguration.viewHeight);
			_view3D.enableUpdateAndRender = false; //manually call 'update' each frame for more control
			_view3D.antialias = engineConfiguration.antiAlias;
			//
			_theCamera = _view3D.camera = new Camera3D( "CustomCamera3D" );
			_theCamera.setPosition(
				engineConfiguration.cameraPosition.x,
				engineConfiguration.cameraPosition.y,
				engineConfiguration.cameraPosition.z
			);
			_theCamera.fieldOfView 	= engineConfiguration.cameraFieldOfView;
			_theCamera.near 		= engineConfiguration.cameraNear; 
			_theCamera.far 			= engineConfiguration.cameraFar; 
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
			var image : Bitmap =  new AssetManager.BACKGROUND ();
			var skyBox:SkyBox = new SkyBox( [image, image, image, image, image, image], SkyBox.BITMAP_DATA_ARRAY );
			_view3D.scene.addChild(skyBox);
		}
		
		
		/**
		 * Listen for input
		 * 
		 * @return void
		 * 
		 */
		override protected  function _doSetupInput () : void
		{
			//the stats
			_statsWidget = new Flare3DStats();
			addChild(_statsWidget);
			
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
			_theModel = new Pivot3D("CustomTheModel");
			_view3D.addChild(_theModel);
			
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
		override protected function _onExternalModelLoadingProgress (aEvent : *) : void
		{
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingProgress(aEvent);
			
			//MORE STUFF
			
		}
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
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingCompleted(aEvent);
			
			//MORE STUFF
			_theExternallyLoadedChildOfTheModel.setPosition(
				_currentModelLoadingData.originalPosition.x,
				_currentModelLoadingData.originalPosition.y,
				_currentModelLoadingData.originalPosition.z
			);
			//MORE STUFF
			_theExternallyLoadedChildOfTheModel.setScale(
				_currentModelLoadingData.originalScale.x,
				_currentModelLoadingData.originalScale.y,
				_currentModelLoadingData.originalScale.z
			);
			_theExternallyLoadedChildOfTheModel.visible = true; //show only after loaded and sized to prevent flicker
			
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
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingCompleted(aEvent);
			
			//MORE STUFF
			
		}
		
		
	}
}