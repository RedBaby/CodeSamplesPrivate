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
	
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.debug.AwayStats;
	import away3d.errors.AbstractMethodError;
	import away3d.events.LoaderEvent;
	import away3d.loaders.Loader3D;
	import away3d.loaders.parsers.Parsers;
	import away3d.primitives.WireframeCube;
	import away3d.primitives.WireframeSphere;
	import away3d.textures.BitmapTexture;
	
	import com.rmc.data.types.ModelType;
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.stage3dfb.data.types.EngineConfiguration;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.display.Bitmap;
	import flash.geom.Vector3D;
	import flash.net.URLRequest;
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>Away3DEngine</code> represents one 3D renderer which will load external models.</p>
	 * 
	 */
	public class Away3DEngine extends AbstractEngine implements IEngine
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
		private var _view3D : View3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _loader3D : Loader3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theCamera : Camera3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theModel : ObjectContainer3D
		
		private var _thePrimitive:ObjectContainer3D;
		private var _statsWidget:AwayStats;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------

		/**
		 * This is the constructor.
		 * 
		 */
		public function Away3DEngine()
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
			return aModelLoadingData.isAway3DCompatible
		}
		
		
		/**
		 * DO Final destruction
		 * 
		 * @return void
		 * 
		 */
		public function dispose () : void
		{
			_statsWidget.unregisterView(_view3D);
			removeChild(_statsWidget);
			removeChild(_view3D);
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
				if (_theModel.contains(_loader3D)) {
					_theModel.removeChild(_loader3D);
					_loader3D.dispose();
				}
				//REMOVE OLD PRIMITIVE
				if (_theModel.contains(_thePrimitive)) {
					_theModel.removeChild(_thePrimitive);
					_thePrimitive.dispose();
				}
				
				//CREATE NEW
				switch (_currentModelLoadingData.modelType) {
					case ModelType.EXTERNAL_MODEL:
						_isCurrentlyLoadingANewModel_boolean = true; //SINCE WE ARE DOING ASYNC LOAD, FLAG THAT
						_loader3D = new Loader3D();
						_loader3D.addEventListener(LoaderEvent.RESOURCE_COMPLETE, _onExternalModelLoadingCompleted );
						_loader3D.addEventListener(LoaderEvent.LOAD_ERROR, _onExternalModelLoadingError);
						_loader3D.load( new URLRequest(_currentModelLoadingData.modelURL) );
						break;
					case ModelType.WIREFRAME_CUBE:
						_thePrimitive = new WireframeCube(_currentModelLoadingData.originalScale.x,_currentModelLoadingData.originalScale.y,_currentModelLoadingData.originalScale.z,_currentModelLoadingData.originalColor, _currentModelLoadingData.originalLineThickness) ;
						_theModel.addChild(_thePrimitive);
						break;
					case ModelType.WIREFRAME_SPHERE:
						_thePrimitive = new WireframeSphere(_currentModelLoadingData.originalScale.x, 16, 12,_currentModelLoadingData.originalColor, _currentModelLoadingData.originalLineThickness) ;
						_theModel.addChild(_thePrimitive);
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
			_theModel.yaw(AbstractEngine._MODEL_SPIN_ROTATION_AMOUNT)
			_theCamera.lookAt(_theModel.position);
			_view3D.render();
			
		}
		
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doRotateModel (aRotation_num : Number):void
		{
			_theModel.rotationZ += (aRotation_num);
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
			if (_view3D) {
				_view3D.width 	= aWidth_num;
				_view3D.height 	= aHeight_num;
			}
			
		}
		
		
		
		
		//	PRIVATE
		
		/**
		 * Build the 3D world, the camera, and the group to hold the model
		 * 
		 * @return void
		 * 
		 */
		override protected function _doSetupWorld () : void
		{
			_view3D 				= new View3D();
			setViewPosition(0,0);
			setViewSize(engineConfiguration.viewWidth, engineConfiguration.viewHeight);
			_view3D.antiAlias 		= engineConfiguration.antiAlias;
			_view3D.backgroundColor = engineConfiguration.cameraBackgroundColor;
			addChild(_view3D);
			//
			_theCamera = _view3D.camera;
			_theCamera.position 	= engineConfiguration.cameraPosition;
			_theCamera.lens 		= new PerspectiveLens (engineConfiguration.cameraFieldOfView);
			_theCamera.lens.near 	= engineConfiguration.cameraNear; 
			_theCamera.lens.far 	= engineConfiguration.cameraFar; 

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
			var bitmap : Bitmap = new AssetManager.BACKGROUND ();
			_view3D.background = new BitmapTexture (bitmap.bitmapData);
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
			 _statsWidget = new AwayStats(_view3D);
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
			
			//	FOR SIMPLICITY ADD ALL BUNDLES, 
			Parsers.enableAllBundled();
			
			//CREATE A GROUP, WE WILL ONLY EDIT THE GROUP AS WE ROTATE/ZOOM/ETC...
			//	THIS LET'S THE MODEL WITHIN HAVE ANY ONE-TIME OFFSETS WE WANT, BUT THEN NOT BE 'TOUCHED'
			_theModel = new ObjectContainer3D ();
			_view3D.scene.addChild(_theModel);
			
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
			//CALL TO SHOW UNIVERSAL UI
			super._onExternalModelLoadingCompleted(aEvent);
			
			//MORE STUFF
			
			//STRONG TYPE SINCE SUPERCLASS CANNOT. COOL.
			var event : LoaderEvent = aEvent as LoaderEvent;
			
			_isCurrentlyLoadingANewModel_boolean = false;
			_loader3D.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, _onExternalModelLoadingCompleted );
			_loader3D.removeEventListener(LoaderEvent.LOAD_ERROR, _onExternalModelLoadingError);
			_theModel.addChild(_loader3D);
			
			//POSITION THE MODEL (JUST ONE TIME WITHIN LOADER, THEN DON'T 'TOUCH' IT)
			_loader3D.scaleX = _currentModelLoadingData.originalScale.x;
			_loader3D.scaleY = _currentModelLoadingData.originalScale.y;
			_loader3D.scaleZ = _currentModelLoadingData.originalScale.z;
			_loader3D.position = _currentModelLoadingData.originalPosition;

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
			
			//STRONG TYPE SINCE SUPERCLASS CANNOT. COOL.
			var event : LoaderEvent = aEvent as LoaderEvent;
			
			trace('Could not find', event.url);
			_loader3D.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, _onExternalModelLoadingCompleted );
			_loader3D.removeEventListener(LoaderEvent.LOAD_ERROR, 		_onExternalModelLoadingError);
			_loader3D = null;
		}
		
		
	}
}