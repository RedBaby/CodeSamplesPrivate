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
//Marks the right margin of code *******************************************************************
package com.rmc.data.types
{
	import com.rmc.utils.CStringUtils;
	import com.rmc.errors.EnumIllegalConstructionError;
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>ModelType</code> defines the type of 3d model we are loading</p>
	 * 
	 */
	public class ModelType extends Enum
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		/**
		 * DECLARE ALL POSSIBLE ENUMS INSTANCES
		 */		
		public static const WIREFRAME_CUBE   	: ModelType = new ModelType();
		public static const WIREFRAME_SPHERE   	: ModelType = new ModelType();
		public static const EXTERNAL_MODEL   	: ModelType = new ModelType();
		
		// PRIVATE STATIC
		/**
		 * PREVENTS INSTANTIATION OF ENUMS OUTSIDE OF THIS CLASS
		 */		
		static private var _IsLocked_boolean:Boolean = false;
		
		// PRIVATE
		
		// --------------------------------------
		// Metadata
		// --------------------------------------
		{
			CStringUtils.InitEnumConstants(ModelType);
			_IsLocked_boolean = true;
		} 
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function ModelType() {
			
			// ERROR CHECK
			if(_IsLocked_boolean) {
				throw new EnumIllegalConstructionError ();
			}
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
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

