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
package com.chattrspace.utils
{
	import mx.core.DPIClassification;
	import mx.core.RuntimeDPIProvider;
	import mx.core.Singleton;
	
	/**
	 *  The <code>DensityUtil</code> class is an all-static class with methods for working with
	 *  density within Flex.
	 * 
	 *  Flex uses this class to calculate the scaling factor when automatic density
	 *  scaling is enabled for the <code>Application</code>.
	 *
	 *  @see mx.core.DPIClassification
	 *  @see spark.components.Application#applicationDPI 
	 */
	public class DensityUtil
	{
		/**
		 *  Cached runtimeDPI value, which is computed from the runtimeDPIProvider class.
		 */
		private static var runtimeDPI:Number;
		
		/**
		 *  Returns the current runtimeDPI value which is calculated by 
		 *  an instance of the runtimeDPIProvider class.
		 *  If a runtimeDPIProvider class is not provided to the Application,
		 *  Flex uses the default class, RuntimeDPIProvider.
		 *
		 *  @see #getDPIScale 
		 *  @see mx.core.RuntimeDPIProvider
		 */
		public static function getRuntimeDPI():Number
		{
			if (!isNaN(runtimeDPI))
				return runtimeDPI;
			
			var runtimeDPIProviderClass:Class = Singleton.getClass("mx.core::RuntimeDPIProvider");
			
			// Default to RuntimeDPIProvider
			if (!runtimeDPIProviderClass)
				runtimeDPIProviderClass = RuntimeDPIProvider;
			
			var instance:RuntimeDPIProvider = RuntimeDPIProvider(new runtimeDPIProviderClass());
			runtimeDPI = instance.runtimeDPI;
			
			return runtimeDPI;
		}
		
		/**
		 *  Calculates a scale factor to be used when element authored for 
		 *  <code>sourceDPI</code> is rendered at <code>targetDPI</code>.
		 *  
		 *  @param sourceDPI The <code>DPIClassification</code> dpi value for which
		 *  a resource is optimized.
		 * 
		 *  @param targetDPI The <code>DPIClassification</code> dpi value at
		 *  which a resource is rendered.
		 * 
		 *  @return The scale factor to be applied to the resource at render time.
		 *
		 *  @see #getRuntimeDPI
		 *  @see mx.core.DPIClassification
		 */
		public static function getDPIScale(sourceDPI:Number, targetDPI:Number):Number
		{
			// Unknown dpi returns NaN
			if ((sourceDPI != DPIClassification.DPI_160 && sourceDPI != DPIClassification.DPI_240 && sourceDPI != DPIClassification.DPI_320) ||
				(targetDPI != DPIClassification.DPI_160 && targetDPI != DPIClassification.DPI_240 && targetDPI != DPIClassification.DPI_320))
			{
				return NaN;
			}
			
			return targetDPI / sourceDPI;
		}
	}
}