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
package com.rmc.projects.racecardz.controls
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.shardz.controls.ShardzScreen;
	import com.rmc.projects.shardzdemo.data.types.PhrasesConstant;
	
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	
	import starling.display.Image;
	import starling.events.Event;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>ProfileScreen</code> class is ...</p>
	 * 
	 */
	public class TestQuestionScreen extends ShardzScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "TestQuestionScreen";
		
		private var _faceImage : Image
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		private var _container:ScrollContainer;

		private var _imageLoader:ImageLoader;
		/**
		 * This is the constructor.
		 * 
		 */
		public function TestQuestionScreen()
		{
			// SUPER
			super();
			
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
		/**
		 * FEATHERS: Initialize
		 * 
		 * @return void
		 */	
		override protected function initialize () : void 
		{
			//SUPER
			super.initialize();
			
			//
			title = PhrasesConstant.profileScreenTitle;
			shardzHeader.nextButton.visible 		= false;
			shardzHeader.previousButton.visible = false;
			
			
			
			_container = _getNewVerticalScrollContainer();
			addChild(_container);
			/*
			
			Number of items
			
			
			*/
			//
			var _title_label : Label = new Label ();
			_title_label.text = "Face"
			_container.addChild(_title_label);
			
			_imageLoader = new ImageLoader ()
			_imageLoader.addEventListener(Event.COMPLETE, _onURLLoaderComplete);
			_imageLoader.maintainAspectRatio = true;
			
			_container.addChild(_imageLoader);
			
			//
			var _guess_label : Label = new Label ();
			_guess_label.text = "Guess"
			_container.addChild(_guess_label);
			
			//
			var _guessButton : Button = new Button ();
			_guessButton.label = "Guess!"
			_container.addChild(_guessButton);
			
			
			//
			_doLoadImage();
			
			
		}
		
		private function _doLoadImage():void
		{
			_imageLoader.source = "./assets_runtime/images/sampleFace_v1.png";
			
		}		
		
		protected function _onURLLoaderComplete(aEvent:Event):void
		{
			// TODO Auto-generated method stub
			trace ('ok');
		}
		
		private function _getNewHorzontalScrollContainer():ScrollContainer
		{
			var layout:HorizontalLayout = new HorizontalLayout();
			var gap_uint 			: uint = 5;
			var padding_uint 		: uint = 5;
			layout.gap 				= gap_uint
			layout.paddingTop 		= padding_uint
			layout.paddingRight 		= padding_uint
			layout.paddingBottom 	= padding_uint
			layout.paddingLeft 		= padding_uint
			layout.horizontalAlign 	= HorizontalLayout.HORIZONTAL_ALIGN_LEFT
			layout.verticalAlign 	= HorizontalLayout.VERTICAL_ALIGN_MIDDLE
			
			var scrollContainer : ScrollContainer = new ScrollContainer();
			scrollContainer.layout = layout;
			//when the scroll policy is set to on, the "elastic" edges will be
			//active even when the max scroll position is zero
			scrollContainer.scrollerProperties.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scrollContainer.scrollerProperties.snapScrollPositionsToPixels = true;
			
			return scrollContainer;
		}
		
		private function _getNewVerticalScrollContainer():ScrollContainer
		{
			var layout:VerticalLayout = new VerticalLayout();
			var gap_uint 			: uint = 10;
			var padding_uint 		: uint = 10;
			layout.gap 				= gap_uint
			layout.paddingTop 		= padding_uint
			layout.paddingRight 		= padding_uint
			layout.paddingBottom 	= padding_uint
			layout.paddingLeft 		= padding_uint
			layout.horizontalAlign 	= VerticalLayout.HORIZONTAL_ALIGN_CENTER
			layout.verticalAlign 	= VerticalLayout.VERTICAL_ALIGN_TOP
			
			var scrollContainer : ScrollContainer = new ScrollContainer();
			scrollContainer.layout = layout;
			//when the scroll policy is set to on, the "elastic" edges will be
			//active even when the max scroll position is zero
			scrollContainer.scrollerProperties.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scrollContainer.scrollerProperties.snapScrollPositionsToPixels = true;
			
			return scrollContainer;
		}
		
		/**
		 * FEATHERS: Draw
		 * 
		 * @return void
		 */	
		override protected function draw () : void 
		{
			//SUPER
			super.draw();
			
			//DO
			_container.x 		= shardzHeader.x;
			_container.y 		= shardzHeader.y + shardzHeader.height;
			_container.width		= actualWidth;
			_imageLoader.width = _container.width;
			_imageLoader.height = actualHeight/2
			//
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}


