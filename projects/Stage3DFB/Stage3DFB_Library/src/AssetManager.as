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
package 
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>AssetManager</code> holds asset embeds.</p>
	 * 
	 */
	public class AssetManager 
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		// --------------------------------------
		//  EMBED: from PNG
		// --------------------------------------
		[Embed(source="./assets_compiletime/images/background.png")]
		public static const BACKGROUND : Class
		
		// --------------------------------------
		//  EMBED: from SWF
		// --------------------------------------
		/**
		 * EMBED: 	One MovieClip From The Library Linked As 'BoyAndDogRunning'
		 */		
		[Embed(source = '../assets_compiletime/fla/Stage3DFB_Assets_v1.swf', symbol = "BoyAndDogRunning")] 
		public static var BoyAndDogRunning:Class;
		
		
		// PRIVATE
		
	}
}