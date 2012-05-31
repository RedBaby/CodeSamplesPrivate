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
package com.rmc.projects.stage3dfb.data.types 
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.data.types.ModelType;
	
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>ModelLoadingData</code> is designed to hold the loading and positioning of the model</p>
	 * 
	 */
	public class ModelData 
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		private var _title_str : String;
		public function get title () 					: String 	{ return _title_str; }
		public function set title (aValue : String) 	: void 		{ _title_str = aValue; }
		/**
		 *  
		 */		
		private var _modelType : ModelType;
		public function get modelType () 					: ModelType 	{ return _modelType; }
		public function set modelType (aValue : ModelType) 	: void 		{ _modelType = aValue; }
		
		/**
		 *  
		 */		
		private var _isAway3DCompatible_boolean : Boolean;
		public function get isAway3DCompatible () 					: Boolean 	{ return _isAway3DCompatible_boolean; }
		public function set isAway3DCompatible (aValue : Boolean) 	: void 		{ _isAway3DCompatible_boolean = aValue; }
		
		/**
		 *  
		 */		
		private var _isStarlingCompatible_boolean : Boolean;
		public function get isStarlingCompatible () 					: Boolean 	{ return _isStarlingCompatible_boolean; }
		public function set isStarlingCompatible (aValue : Boolean) 	: void 		{ _isStarlingCompatible_boolean = aValue; }
		/**
		 *  
		 */		
		private var _isFlare3DCompatible_boolean : Boolean;
		public function get isFlare3DCompatible () 					: Boolean 	{ return _isFlare3DCompatible_boolean; }
		public function set isFlare3DCompatible (aValue : Boolean) 	: void 		{ _isFlare3DCompatible_boolean = aValue; }
		
		/**
		 *  
		 */		
		private var _isAlternativa3DCompatible_boolean : Boolean;
		public function get isAlternativa3DCompatible () 					: Boolean 	{ return _isAlternativa3DCompatible_boolean; }
		public function set isAlternativa3DCompatible (aValue : Boolean) 	: void 		{ _isAlternativa3DCompatible_boolean = aValue; }
		
		/**
		 *  URL of asset to load
		 */		
		private var _modelURL_str : String;
		public function get modelURL () 				: String 	{ return _modelURL_str; }
		public function set modelURL (aValue : String) 	: void 		{ _modelURL_str = aValue; }
		
		/**
		 *  WHen the model loads position it here.
		 * 
		 * NOTE: This helps if the model is not automatically centered
		 * 
		 */		
		private var _originalPosition_vector3d : Vector3D;
		public function get originalPosition () 					: Vector3D 	{ return _originalPosition_vector3d; }
		public function set originalPosition (aValue : Vector3D) 	: void 		{ _originalPosition_vector3d = aValue; }
		
		/**
		 *  Primitives are sized to this
		 * 
		 */		
		private var _originalScale_vector3d : Vector3D;
		public function get originalScale() 					: Vector3D 	{ return _originalScale_vector3d; }
		public function set originalScale (aValue : Vector3D) 	: void 		{ _originalScale_vector3d = aValue; }
		
		/**
		 *  
		 */		
		private var _originalRotation_vector3d : Vector3D;
		public function get originalRotation () 					: Vector3D 	{ return _originalRotation_vector3d; }
		public function set originalRotation (aValue : Vector3D) 	: void 		{ _originalRotation_vector3d = aValue; }
		
		/**
		 *  
		 */		
		private var _originalColor_uint : uint;
		public function get originalColor () 					: uint 	{ return _originalColor_uint; }
		public function set originalColor (aValue : uint) 	: void 		{ _originalColor_uint = aValue; }
		
		/**
		 *  
		 */		
		private var _originalAlpha_num : Number;
		public function get originalAlpha () 					: Number 	{ return _originalAlpha_num; }
		public function set originalAlpha (aValue : Number) 	: void 		{ _originalAlpha_num = aValue; }
		
		/**
		 *  
		 */		
		private var _originalLineThickness_num : Number;
		public function get originalLineThickness () 					: Number 	{ return _originalLineThickness_num; }
		public function set originalLineThickness (aValue : Number) 	: void 		{ _originalLineThickness_num = aValue; }
		
		/**
		 *  
		 */		
		private var _percentLoaded_num : Number;
		public function get percentLoaded () 					: Number 	{ return _percentLoaded_num; }
		public function set percentLoaded (aValue : Number) 	: void 		{ _percentLoaded_num = aValue; }
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function ModelData(aTitle_str : String,
								  aModelType : ModelType, 
								  aIsAway3DCompatible_boolean 			: Boolean,
								  aIsFlare3DCompatible_boolean 			: Boolean,
								  aIsAlternativa3DCompatible_boolean 	: Boolean,
								  aIsStarlingCompatible_boolean 		: Boolean,
								  aModelURL_str 					 	: String = "", 
								  aOriginalPosition_vector3d 			: Vector3D = null, 
								  aOriginalScale_vector3d 				: Vector3D = null,
								  aOriginalRotation_vector3d 			: Vector3D = null
								  
		)
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			_title_str = aTitle_str;
			_modelType = aModelType;
			_isAway3DCompatible_boolean 		= aIsAway3DCompatible_boolean,
			_isFlare3DCompatible_boolean 		= aIsFlare3DCompatible_boolean,
			_isAlternativa3DCompatible_boolean 	= aIsAlternativa3DCompatible_boolean,
			_isStarlingCompatible_boolean		= aIsStarlingCompatible_boolean;
				
				
			//ONLY SOME MODELS USE THESE ADDITIONAL PARAMETERS
			_modelURL_str = aModelURL_str;
			
			if (aOriginalPosition_vector3d == null) {
				_originalPosition_vector3d = new Vector3D (0,0,0);
			} else {
				_originalPosition_vector3d = aOriginalPosition_vector3d;
			}
			
			if (aOriginalScale_vector3d == null) {
				_originalScale_vector3d = new Vector3D ( 1, 1, 1);
			} else {
				_originalScale_vector3d = aOriginalScale_vector3d;
			}
			
			if (aOriginalRotation_vector3d == null) {
				_originalRotation_vector3d = new Vector3D ( 0, 0, 0);
			} else {
				_originalRotation_vector3d = aOriginalRotation_vector3d;
			}
			
			_originalColor_uint 		= 0xefefef; //grey
			_originalLineThickness_num 	= 2;
			_originalAlpha_num			= 1;
			
			//UPDATED IF/WHEN IT IS LOADED
			_percentLoaded_num = 0;
			
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