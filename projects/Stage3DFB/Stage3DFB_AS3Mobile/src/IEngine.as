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
//Marks the right margin of code *******************************************************************
package
{
	import com.rmc.projects.stage3dfb.data.types.EngineConfiguration;
	import com.rmc.projects.stage3dfb.data.types.ModelData;

	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>The <code>IEngine</code> is designed to...</p>
	 * 
	 */
	public interface IEngine
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		function get isCurrentlyLoadingANewModel () 					: Boolean;
		function get title () 											: String;
		
		//--------------------------------------
		//  Methods
		//--------------------------------------				
		//PUBLIC	
		function doSetup()  :  void;
		function setEngineConfiguration(aValue : EngineConfiguration)  :  void;
		function setViewPosition(aX_num : Number, aY_num : Number)  :  void;
		function setViewSize(aWidth_num : Number, aHeight_num : Number)  :  void;
		function isCompatibleWithModelData (aValue : ModelData):Boolean
		function doLoadModel (aValue : ModelData):void
		function doZoomModel(aValue : Number)  :  void;
		function doRotateModel(aValue : Number)  :  void;
		function doTick()  :  void;
		function dispose()  :  void;
		
	}
}