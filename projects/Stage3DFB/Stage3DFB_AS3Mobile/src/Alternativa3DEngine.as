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
	import alternativa.engine3d.controllers.SimpleObjectController;
	import alternativa.engine3d.core.Camera3D;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Resource;
	import alternativa.engine3d.core.View;
	import alternativa.engine3d.loaders.ParserCollada;
	import alternativa.engine3d.loaders.ParserMaterial;
	import alternativa.engine3d.loaders.TexturesLoader;
	import alternativa.engine3d.materials.FillMaterial;
	import alternativa.engine3d.materials.TextureMaterial;
	import alternativa.engine3d.objects.Mesh;
	import alternativa.engine3d.objects.Surface;
	import alternativa.engine3d.primitives.Box;
	import alternativa.engine3d.primitives.GeoSphere;
	import alternativa.engine3d.resources.ExternalTextureResource;
	import alternativa.engine3d.resources.Geometry;
	
	import com.rmc.data.types.ModelType;
	import com.rmc.errors.SwitchStatementDefaultError;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Vector3D;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>Alternativa3DEngine</code> represents one 3D renderer which will load external models.</p>
	 * 
	 */
	public class Alternativa3DEngine extends AbstractEngine implements IEngine
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
		private var _view3D : View;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _scene : Object3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _loader : URLLoader;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theExternallyLoadedChildOfTheModel:Object3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theCamera : Camera3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _theModel : Object3D
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _thePrimitiveChildOfTheModel: Object3D;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _statsWidget: DisplayObject;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _stage3D:Stage3D;
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------

		private var _statsWidgetHolder_sprite:Sprite;
		
		/**
		 * This is the constructor.
		 * 
		 */
		public function Alternativa3DEngine()
		{
			
			// SUPER
			super("Alternativa3D"); //TITLE FOR DISPLAY PURPOSES ONLY
			
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
			return aModelLoadingData.isAlternativa3DCompatible;
		}
		
		
		/**
		 * DO Final destruction
		 * 
		 * @return void
		 * 
		 */
		public function dispose () : void
		{
			//_statsWidget.unregisterView(_view3D);
			UIManager.getDashboardContents().removeChild(_statsWidgetHolder_sprite);
			removeChild(_view3D);
			//_view3D.dispose();
		}
		
		/**
		 * Do Initial Construction
		 * 
		 * @return void
		 * 
		 */
		override public function doSetup () : void
		{
			//DON'T CALL SUPER, JUST MANUALLY CALL WHAT'S NEEDED. WE DIVIDE SOME BEFORE /AFTER THE STAGE3D CONTEXT IS READY
			_doSetupWorld		();
			
			
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
				if (_theExternallyLoadedChildOfTheModel && _theModel.contains(_theExternallyLoadedChildOfTheModel)) {
					_theModel.removeChild(_theExternallyLoadedChildOfTheModel);
				}
				//REMOVE OLD PRIMITIVE
				if (_thePrimitiveChildOfTheModel && _theModel.contains(_thePrimitiveChildOfTheModel)) {
					_theModel.removeChild(_thePrimitiveChildOfTheModel);
				}
				
				//CREATE NEW
				switch (_currentModelLoadingData.modelType) {
					case ModelType.EXTERNAL_FILE:
						//	EVENTS
						_doDispatchModelLoad();
						//	SETUP
						_isCurrentlyLoadingANewModel_boolean = true; //SINCE WE ARE DOING ASYNC LOAD, FLAG THAT
						_theExternallyLoadedChildOfTheModel = new Object3D ();
						//	LOAD
						_loader = new URLLoader();
						_loader.dataFormat = URLLoaderDataFormat.TEXT;
						_loader.addEventListener(Event.COMPLETE, 			_onExternalModelLoadingCompleted);
						_loader.addEventListener(ProgressEvent.PROGRESS, 	_onExternalModelLoadingProgress);
						_loader.addEventListener(IOErrorEvent.IO_ERROR, 	_onExternalModelLoadingError);
						_loader.load(new URLRequest(_currentModelLoadingData.modelURL));
						break;
					case ModelType.PRIMITIVE_CUBE:
						//	EVENTS
						_doDispatchModelLoad();
						_doDispatchModelProgress(100)
						_doDispatchModelLoaded()
						//	SETUP
						_thePrimitiveChildOfTheModel = new Box((_currentModelLoadingData.originalScale.x/10), (_currentModelLoadingData.originalScale.x/10), (_currentModelLoadingData.originalScale.x/10), 1, 1, 1, false, new FillMaterial(_currentModelLoadingData.originalColor, _currentModelLoadingData.originalAlpha)); 
						_thePrimitiveChildOfTheModel.x = _currentModelLoadingData.originalPosition.x;
						_thePrimitiveChildOfTheModel.y = _currentModelLoadingData.originalPosition.y;
						_thePrimitiveChildOfTheModel.z = _currentModelLoadingData.originalPosition.z;
						_thePrimitiveChildOfTheModel.rotationX = _currentModelLoadingData.originalRotation.x * AbstractEngine._DEGREES_TO_RADIANS;
						_thePrimitiveChildOfTheModel.rotationY = _currentModelLoadingData.originalRotation.y * AbstractEngine._DEGREES_TO_RADIANS;
						_thePrimitiveChildOfTheModel.rotationZ = _currentModelLoadingData.originalRotation.z * AbstractEngine._DEGREES_TO_RADIANS;
						_theModel.addChild(_thePrimitiveChildOfTheModel);
						break;
					case ModelType.PRIMITIVE_SPHERE:
						//	EVENTS
						_doDispatchModelLoad();
						_doDispatchModelProgress(100)
						_doDispatchModelLoaded()
						//	SETUP
						_thePrimitiveChildOfTheModel = new GeoSphere (_currentModelLoadingData.originalScale.x/10, 10, false, new FillMaterial (_currentModelLoadingData.originalColor, _currentModelLoadingData.originalAlpha) ); //_currentModelLoadingData.originalScale.x, 2, false, new FillMaterial (_currentModelLoadingData.originalColor, _currentModelLoadingData.originalColor));
						_thePrimitiveChildOfTheModel.x = _currentModelLoadingData.originalPosition.x;
						_thePrimitiveChildOfTheModel.y = _currentModelLoadingData.originalPosition.y;
						_thePrimitiveChildOfTheModel.z = _currentModelLoadingData.originalPosition.z;
						_thePrimitiveChildOfTheModel.rotationX = _currentModelLoadingData.originalRotation.x * AbstractEngine._DEGREES_TO_RADIANS;
						_thePrimitiveChildOfTheModel.rotationY = _currentModelLoadingData.originalRotation.y * AbstractEngine._DEGREES_TO_RADIANS;
						_thePrimitiveChildOfTheModel.rotationZ = _currentModelLoadingData.originalRotation.z * AbstractEngine._DEGREES_TO_RADIANS;
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
			_theModel.rotationY += AbstractEngine._MODEL_SPIN_ROTATION_AMOUNT/20;
			_theCamera.render(_stage3D);
			
		}
		
		
		/**
		 * Rotate the model
		 * 
		 * @return void
		 * 
		 */
		override public function doRotateModel (aRotation_num : Number):void
		{
			_theModel.rotationZ -= (aRotation_num);
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
			var temporaryCamera : Camera3D	   = new Camera3D(0.1,1000000000);
			temporaryCamera.x		   = _theCamera.x;
			temporaryCamera.y		   = _theCamera.y;
			temporaryCamera.z		   = _theCamera.z;
			
			//	MOVE
			var moveForwardAmount_num : Number = 20*Math.pow(aZoomAmount_num,1);
			if (aZoomAmount_num > 1) {
				//temporaryCamera.(moveForwardAmount_num);
			} else {
				//temporaryCamera.moveForward(-moveForwardAmount_num);
			}
			
			//DISTANCE TO MODEL
			var distance : Number = Vector3D.distance(
				new Vector3D (
					temporaryCamera.x,
					temporaryCamera.y,
					temporaryCamera.z
				),
				new Vector3D (
					_theModel.x,
					_theModel.y,
					_theModel.z
				)
			);
			
			if (distance > engineConfiguration.modelDistanceNear &&
				distance < engineConfiguration.modelDistanceFar) {
				//LEGAL DISTANCE - UPDATE THE CAMERA FOR REAL
				_theCamera.x = temporaryCamera.x;
				_theCamera.y = temporaryCamera.y;
				_theCamera.z = temporaryCamera.z;
				
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
			//****************
			// _doSetupWorld PART 1 OF 2
			//****************
			_stage3D = stage.stage3Ds[0];
			_stage3D.addEventListener(Event.CONTEXT3D_CREATE, _onContextCreate);
			_stage3D.requestContext3D();
			
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
				_view3D.x 	= aX_num;
				_view3D.y 	= aY_num;
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
				_theCamera.view.width 	= aWidth_num;
				_theCamera.view.height 	= aHeight_num;
			}
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
			//_view3D.background = new BitmapTexture (bitmap.bitmapData);
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
			_statsWidget = _theCamera.diagram;
			_statsWidgetHolder_sprite = new Sprite ();
			_statsWidgetHolder_sprite.graphics.clear();
			_statsWidgetHolder_sprite.graphics.beginFill(0x222222);
			_statsWidgetHolder_sprite.graphics.drawRect(0,0,120,100);
			_statsWidgetHolder_sprite.graphics.endFill();
			//_statsWidget.width 	= _statsWidgetHolder_sprite.width;
			//_statsWidget.height = _statsWidgetHolder_sprite.height;
			_statsWidgetHolder_sprite.addChild(_statsWidget);
			UIManager.getDashboardContents().addChild(_statsWidgetHolder_sprite);
			_statsWidget.x = 5;
			_statsWidget.y = 5;
			
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
			_theModel = new Object3D ();
			_scene.addChild(_theModel);
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		///////////////
		//	3D EVENTS
		///////////////
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
			var progressEvent : ProgressEvent = (aEvent as ProgressEvent);
			var percentLoaded_num : Number;
			
			//trace (" is " + progressEvent.bytesLoaded + " and " + progressEvent.bytesTotal);
			if (progressEvent.bytesLoaded > 0 && progressEvent.bytesTotal > 0) {
				percentLoaded_num = progressEvent.bytesLoaded / progressEvent.bytesLoaded * 100;
			} else {
				percentLoaded_num = 0;
			}
			_doDispatchModelProgress(percentLoaded_num);
			
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
			
			//
			_loader.removeEventListener(Event.COMPLETE, 		_onExternalModelLoadingCompleted);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, 	_onExternalModelLoadingError);
			
			// Model parsing
			var parser:ParserCollada = new ParserCollada();
			parser.parse(XML((aEvent.target as URLLoader).data), "./assets_runtime/models/collada/", true);
			trace(parser.objects);
			var mesh:Mesh = parser.getObjectByName("Cylinder01") as Mesh;
			mesh.x = 0;
			_theExternallyLoadedChildOfTheModel.addChild(mesh);
			
			//  
			uploadResources(mesh.getResources(false, Geometry));
			
			//  
			var textures:Vector.<ExternalTextureResource> = new Vector.<ExternalTextureResource>();
			for (var i:int = 0; i < mesh.numSurfaces; i++) {
				var surface:Surface = mesh.getSurface(i);
				var material:ParserMaterial = surface.material as ParserMaterial;
				if (material != null) {
					var diffuse:ExternalTextureResource = material.textures["diffuse"];
					if (diffuse != null) {
						textures.push(diffuse);
						surface.material = new TextureMaterial(diffuse);
					}
				}
			}
			
			// Loading of textures
			var texturesLoader:TexturesLoader = new TexturesLoader(_stage3D.context3D);
			texturesLoader.loadResources(textures);
			
			//MORE STUFF
			
			//STRONG TYPE SINCE SUPERCLASS CANNOT. COOL.
			var event : Event = aEvent as Event;
			
			_isCurrentlyLoadingANewModel_boolean = false;
			_theModel.addChild(_theExternallyLoadedChildOfTheModel);
			
			//POSITION THE MODEL (JUST ONE TIME WITHIN LOADER, THEN DON'T 'TOUCH' IT)
			_theExternallyLoadedChildOfTheModel.scaleX 		= _currentModelLoadingData.originalScale.x;
			_theExternallyLoadedChildOfTheModel.scaleY 		= _currentModelLoadingData.originalScale.y;
			_theExternallyLoadedChildOfTheModel.scaleZ 		= _currentModelLoadingData.originalScale.z;
			_theExternallyLoadedChildOfTheModel.x 			= _currentModelLoadingData.originalPosition.x;
			_theExternallyLoadedChildOfTheModel.y 			= _currentModelLoadingData.originalPosition.y;
			_theExternallyLoadedChildOfTheModel.z 			= _currentModelLoadingData.originalPosition.z;
			_theExternallyLoadedChildOfTheModel.rotationX 	= (_currentModelLoadingData.originalRotation.x) * AbstractEngine._DEGREES_TO_RADIANS;
			_theExternallyLoadedChildOfTheModel.rotationY 	= (_currentModelLoadingData.originalRotation.y) * AbstractEngine._DEGREES_TO_RADIANS;
			_theExternallyLoadedChildOfTheModel.rotationZ 	= (_currentModelLoadingData.originalRotation.z) * AbstractEngine._DEGREES_TO_RADIANS;
			
		}
		
		private function uploadResources(resources:Vector.<Resource>):void {
			for each (var resource:Resource in resources) {
				resource.upload(_stage3D.context3D);
			}
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
			var event : IOErrorEvent = aEvent as IOErrorEvent;
			
			trace('Could not find', _currentModelLoadingData.modelURL);
			//
			_loader.removeEventListener(Event.COMPLETE, 		_onExternalModelLoadingCompleted);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, 	_onExternalModelLoadingError);
			_loader = null;
		}
		
		
		/**
		 * Handles the Event: <code>Event.CONTEXT3D_CREATE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onContextCreate(e:Event):void 
		{
			_stage3D.removeEventListener(Event.CONTEXT3D_CREATE, _onContextCreate);
			
			
			//****************
			// _doSetupWorld PART 2 OF 2
			//****************
			_theCamera 		= new Camera3D (engineConfiguration.cameraNear, engineConfiguration.cameraFar);
			_theCamera.x 	= engineConfiguration.cameraPosition.x;
			_theCamera.y 	= engineConfiguration.cameraPosition.y;
			_theCamera.z 	= engineConfiguration.cameraPosition.z;
			_theCamera.fov 	= engineConfiguration.cameraFieldOfView;
			
			//SETUP ROOT OBJECT OF SCENE
			_scene 			= new Object3D ();
			_scene.addChild	(_theCamera);
			
			//SETUP THE CAMERA
			_view3D 		= _theCamera.view = new View (engineConfiguration.viewWidth, engineConfiguration.viewHeight, false, engineConfiguration.cameraBackgroundColor, engineConfiguration.cameraBackgroundAlpha, engineConfiguration.antiAlias);
			setViewPosition (0,0);
			setViewSize 	(engineConfiguration.viewWidth, engineConfiguration.viewHeight);
			addChild		(_view3D);
			
			//
			//SETUP THE REST
			_doSetupBackground   	();
			_doSetupInput 			();
			_doFirstModelSetup		();	
			_doDispatchSetupComplete	();	
			
			//SETUP A CONTROLLER ONLY TO 'LOOK' AT A VECTOR, THEN DISABLE IT
			var _simpleObjectController : SimpleObjectController = new SimpleObjectController(stage, _theCamera, 200); 
			_simpleObjectController.lookAt(_currentModelLoadingData.originalPosition);
			_simpleObjectController.disable();
			
			//ALTERNATIVA3D - REQUIRES TO 'UPLOAD' THINGS TO STAGE3D MANUALLY - HERE IT IS...
			for each (var resource:Resource in _scene.getResources(true)) {
				resource.upload(_stage3D.context3D);
			}
		}
		
		
	}
}