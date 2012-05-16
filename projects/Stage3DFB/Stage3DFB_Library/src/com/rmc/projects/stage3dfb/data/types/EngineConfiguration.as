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
package com.rmc.projects.stage3dfb.data.types 
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.data.types.ModelType;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>EngineLoadingData</code> is designed to hold the loading and positioning of the model</p>
	 * 
	 */
	public class EngineConfiguration 
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  World Position: The Origin
		 * 
		 */		
		private var _originPosition_vector3d : Vector3D;
		public function get originPosition () 					: Vector3D 	{ return _originPosition_vector3d; }
		public function set originPosition (aValue : Vector3D) 	: void 		{ _originPosition_vector3d = aValue; }
		
		/**
		 *  World Position: The Camera
		 * 
		 */		
		private var _cameraPosition_vector3d : Vector3D;
		public function get cameraPosition() 					: Vector3D 	{ return _cameraPosition_vector3d; }
		public function set cameraPosition (aValue : Vector3D) 	: void 		{ _cameraPosition_vector3d = aValue; }
		
		/**
		 *  
		 */		
		private var _cameraFieldOfView_num : Number;
		public function get cameraFieldOfView () 					: Number 	{ return _cameraFieldOfView_num; }
		public function set cameraFieldOfView (aValue : Number) 	: void 		{ _cameraFieldOfView_num = aValue; }
		
		
		/**
		 *  
		 */		
		private var _cameraNear_num : Number;
		public function get cameraNear () 					: Number 	{ return _cameraNear_num; }
		public function set cameraNear(aValue : Number) 	: void 		{ _cameraNear_num = aValue; }
		
		
		/**
		 *  
		 */		
		private var _cameraFar_num : Number;
		public function get cameraFar () 					: Number 	{ return _cameraFar_num; }
		public function set cameraFar (aValue : Number) 	: void 		{ _cameraFar_num = aValue; }
		
		/**
		 *  
		 */		
		private var _cameraBackgroundColor_num : Number;
		public function get cameraBackgroundColor () 					: Number 	{ return _cameraBackgroundColor_num; }
		public function set cameraBackgroundColor (aValue : Number) 	: void 		{ _cameraBackgroundColor_num = aValue; }
		
		/**
		 *  
		 */		
		private var _cameraBackgroundImage_bitmap : Bitmap;
		public function get cameraBackgroundImage () 					: Bitmap 	{ return _cameraBackgroundImage_bitmap; }
		public function set cameraBackgroundImage (aValue : Bitmap) 	: void 		{ _cameraBackgroundImage_bitmap = aValue; }
		
		/**
		 *  
		 */		
		private var _viewWidth_num : Number;
		public function get viewWidth () 					: Number 	{ return _viewWidth_num; }
		public function set viewWidth (aValue : Number) 	: void 		{ _viewWidth_num = aValue; }
		
		
		/**
		 *  
		 */		
		private var _viewHeight_num : Number;
		public function get viewHeight () 					: Number 	{ return _viewHeight_num; }
		public function set viewHeight (aValue : Number) 	: void 		{ _viewHeight_num = aValue; }
		
		/**
		 *  
		 */		
		private var _modelDistanceNear_num : Number;
		public function get modelDistanceNear () 					: Number 	{ return _modelDistanceNear_num; }
		public function set modelDistanceNear (aValue : Number) 	: void 		{ _modelDistanceNear_num = aValue; }
		
		/**
		 *  
		 */		
		private var _modelDistanceFar_num : Number;
		public function get modelDistanceFar () 					: Number 	{ return _modelDistanceFar_num; }
		public function set modelDistanceFar (aValue : Number) 		: void 		{ _modelDistanceFar_num = aValue; }
		/**
		 *  
		 */		
		private var _antiAlias_num : Number;
		public function get antiAlias () 					: Number 	{ return _antiAlias_num; }
		public function set antiAlias (aValue : Number) 	: void 		{ _antiAlias_num = aValue; }
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function EngineConfiguration () 
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			originPosition 		= new Vector3D (0,0,0),
			cameraPosition 		= new Vector3D (0,0,100),
			antiAlias		 	= 0
			cameraFieldOfView 	= 50; 
			cameraNear			= .1; 
			cameraFar			= 1000; 
			modelDistanceNear	= -100; 
			modelDistanceFar	= 600; 
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		
		// PRIVATE
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
	}
}