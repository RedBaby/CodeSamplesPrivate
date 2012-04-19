////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2010 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package com.chattrspace.utils
{ 
	
	/**
	 *  An enum of the device screen density classess.  
	 *
	 *  When working with DPI, Flex collapses similar DPI values into DPI classes.
	 *
	 *  @see spark.components.Application#applicationDPI
	 *  @see spark.components.Application#runtimeDPI
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 2.5
	 *  @productversion Flex 4.5
	 */
	public final class ScreenDPIClassification
	{
		/**
		 *  ScreenDPI: iPad & iPad 2
		 * 
		 */
		public static const DPI_132:Number = 132;
		
		/**
		 *  ScreenDPI: iPod Touch & iPhone 3
		 * 
		 */
		public static const DPI_163:Number = 163;
		
		/**
		 *  ScreenDPI: iPhone 4
		 * 
		 */
		public static const DPI_326:Number = 326;
		
	}
}