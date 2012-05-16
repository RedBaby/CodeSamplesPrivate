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
	
	import alternativa.Alternativa3D;
	
	import com.rmc.data.types.ModelType;
	import com.rmc.projects.stage3dfb.data.types.EngineConfiguration;
	import com.rmc.projects.stage3dfb.data.types.ModelData;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	import mx.events.ResizeEvent;
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>EngineBrowser</code> loads exactly one <code>IEngine</code> at a time from a list.</p>
	 * 
	 */
	[SWF (frameRate="60")]
	public class EngineBrowser extends AbstractEngineBrowser
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PRIVATE GETTTERS
		
		// PUBLIC CONST
		
		// PRIVATE CONST
		
		// PRIVATE
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------

		
		/**
		 * This is the constructor.
		 * 
		 */
		public function EngineBrowser()
		{
			
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			//	SETTINGS
			
		}
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the Event: <code>Event.ADDED_TO_STAGE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		override protected function _onAddedToStage (aEvent : Event):void
		{
			//	SETUP BASIC CONFIGURATION
			_engineConfiguration = new EngineConfiguration ();
			_engineConfiguration.originPosition 		= new Vector3D (0,0,0);
			_engineConfiguration.cameraPosition 		= new Vector3D (0,0,100);
			_engineConfiguration.viewWidth				= stage.stageWidth;
			_engineConfiguration.viewHeight				= stage.stageHeight;
			//
			_engineConfiguration.antiAlias		 		= 16;
			_engineConfiguration.cameraFieldOfView 		= 50; 
			_engineConfiguration.cameraNear				= .3; 
			_engineConfiguration.cameraFar				= 1000; 
			_engineConfiguration.cameraBackgroundColor	= 0x9ADD9A; 
			_engineConfiguration.cameraBackgroundAlpha	= 1; 
			//
			_engineConfiguration.cameraBackgroundImage	= new AssetManager.BACKGROUND(); 
			_engineConfiguration.modelDistanceNear		= 100; 
			_engineConfiguration.modelDistanceFar		= 600; 
			
			//ADD ENGINES
			var _iengines_vector_iengine : Vector.<IEngine> = new Vector.<IEngine> ();
			_iengines_vector_iengine.push (	new Flare3DEngine		() );
			//_iengines_vector_iengine.push (	new Alternativa3DEngine	() );
			//_iengines_vector_iengine.push (	new Away3DEngine		()  );
			ienginesVector = _iengines_vector_iengine;
			
			//ADD A STARTING VECTOR ONLY TO CORRECT IF THE MODEL WAS CREATED A LITTLE 'OFF CENTER'
			var _models_vector_modelloadingdata : Vector.<ModelData>		= new Vector.<ModelData> ();
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.WIREFRAME_CUBE, 		true, 	true, 	true,	"", 												new Vector3D(0,0,0), 			new Vector3D (50,50,50), 	new Vector3D (0, 0, 0)		));
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.WIREFRAME_SPHERE, 		true, 	true, 	true,	"", 												new Vector3D(0,0,0), 			new Vector3D (30,30,30), 	new Vector3D (0, 0, 0)		));
			//_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL,	 	false, 	true,	false,	"./assets_runtime/models/collada/walking_1.dae", 	new Vector3D(0,-50,0), 			new Vector3D (.5,.5,.5),	new Vector3D (0,0,0)	 	));
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL,	 	false, 	false,	true,	"./assets_runtime/models/collada/model.DAE", 		new Vector3D(0,5,0), 			new Vector3D (.75,.75,.75),	new Vector3D (90,0,0)	 	));
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL,	 	false, 	true,	false,	"./assets_runtime/models/f3d/flare3d_logo.f3d", 	new Vector3D(0,-10,0), 			new Vector3D (.2,.2,.2), 	new Vector3D (0, 0, 0)	 	));
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL, 		false, 	true, 	false,	"./assets_runtime/models/f3d/car.f3d", 				new Vector3D(0,-10,0), 			new Vector3D (5,5,5   ), 	new Vector3D (0, 0, 0)	 	));
			//
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL, 		true, 	false, 	false,	"./assets_runtime/models/awd/vase.awd",  			new Vector3D(0,0,0), 			new Vector3D (.1,.1,.1), 	new Vector3D (0, 0, 0)	 	));
			_models_vector_modelloadingdata.push(	new ModelData (ModelType.EXTERNAL_MODEL, 		true, 	false, 	false,	"./assets_runtime/models/awd/MdlFish.awd", 			new Vector3D (-25,-7, -7 ), 	new Vector3D(.1,.1,.1) , 	new Vector3D (0, 0, 0)		));
			modelLoadingDataVector = _models_vector_modelloadingdata;
			
			// SETUP
			_doSetupInput();
			
			//LOAD ENGINE	
			_doLoadEngine(_getNextIEngine(true));
			
		}	
		
		
		/**
		 * Handles the Event: <code>ResizeEvent.RESIZE</code>.
		 * 
		 * @param aEvent <code>ResizeEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		override protected function _onResize(aEvent : *):void
		{
			//	SUPER
			super._onResize(aEvent);
			
			//UPDATE CONFIGURATION (WILL AFFECT *NEXT* CREATED ENGINE)
			_engineConfiguration.viewWidth				= stage.stageWidth;
			_engineConfiguration.viewHeight				= stage.stageHeight;
			
			//UPDATE SIZING (WILL AFFECT *CURRENT* CREATED ENGINE)
			currentIEngine.setViewPosition 	(0,0);
			currentIEngine.setViewSize 		(_engineConfiguration.viewWidth, _engineConfiguration.viewHeight);
			
		}		
		
		
		
	}
}