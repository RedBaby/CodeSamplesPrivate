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
package com.chattrspace.projects.mobilesingle.utils
{
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.chattrspace.projects.mobilesingle.managers.AssetManager;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.UserVO;
	import com.chattrspace.utils.CSSUtility;
	
	import mx.collections.ArrayCollection;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>AS3TypeConverter</code> class which converts between common classes.</p>
	 * 
	 */
	public class AS3TypeConverter
	{
		// --------------------------------------
		// Methods
		// --------------------------------------
		
		//	PUBLIC STATIC
		/**
		 * Convert : <code>Vector</code> To <code>ArrayCollection</code>.
		 * 
		 * @param aVector
		 * 
		 * @return Array
		 * 
		 */
		public static function convertVectorToArrayCollection (aVector : *) : ArrayCollection
		{
			return new ArrayCollection ( AS3TypeConverter.convertVectorToArray(aVector) );
		}
		
		
		/**
		 * Convert : <code>Vector</code> To <code>Array</code>.
		 * 
		 * @param aVector
		 * 
		 * @return Array
		 * 
		 */
		public static function convertVectorToArray (aVector : *) : Array
		{
			var array:Array = new Array ();
			for each (var item : * in aVector) {
				array.push (item);
			}
			return array;
		}

		
	}
}