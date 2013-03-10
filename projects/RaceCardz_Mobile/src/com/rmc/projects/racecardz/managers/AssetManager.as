/**
 * Copyright (C) 2005-2013 by Rivello Multimedia Consulting (RMC).                    
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
package com.rmc.projects.racecardz.managers
{
	import flash.display.Bitmap;
	
	
	public class AssetManager
	{
		
		// --------------------------------------
		// FILES
		//
		// --------------------------------------
		
		//	
		/**
		 * 
		 */		
		public static var URL_LOCATIONS_XML:String 		= "./assets_runtime/xml/locations.xml";
		
		/**
		 * 
		 */		
		public static var URL_QUESTIONS_XML:String 		= "./assets_runtime/xml/questions.xml";
		
		/**
		 *	URL : Load external configuration variables
		 *  
		 */		
		public static var URL_CONFIGURATION_XML:String 	= "./assets_runtime/xml/configuration.xml";
		
		/**
		 *	URL : Load the static display text for the UI
		 *  
		 */		
		public static var URL_PHRASES_XML:String 		= "./assets_runtime/xml/phrases.xml";
		
		
		
		// --------------------------------------
		// IMAGES
		//
		// --------------------------------------
		/**
		 *	IMAGE: 
		 *  
		 */		
		[Embed(source="../../../../../../assets_compiletime/images/splash/SplashScreenImage_v1.png")]
		public static var IMAGE_SPLASH:Class;
		
		/**
		 *	IMAGE: 
		 *  
		 */		
		[Embed(source="../../../../../../assets_compiletime/images/logos/appLogo_v1.png")]
		public static var IMAGE_APP_LOGO:Class;
		
		
		
		// --------------------------------------
		// FONTS
		//
		// --------------------------------------
		// to embed a system font
		[Embed(source="../../../../../../assets_compiletime/fonts/Candara.ttf", 
    fontName = "Candara")] 
		/*
    mimeType = "application/x-font", 
    fontWeight="normal", 
    fontStyle="normal", 
    unicodeRange="englishRange", 
    advancedAntiAliasing="true", 
    embedAsCFF="false")]
		*/
		public static var FONT_CANDARA:Class;
		
	}
}

