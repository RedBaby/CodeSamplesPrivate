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
	import com.rmc.projects.racecardz.robotlegs.model.LocationsModel;
	import com.rmc.projects.racecardz.robotlegs.service.LoadLocationsModelService;
	import com.rmc.projects.shardz.controls.ShardzScreen;
	import com.rmc.projects.shardzdemo.data.types.PhrasesConstant;
	
	import flash.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.GroupedList;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.data.HierarchicalCollection;
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
	public class TestAnswerScreen extends ShardzScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 * RL REFERENCE: VIEW 
		 */		
		[Inject]
		public var locationModel:LocationsModel;
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "TestAnswerScreen";
		
		private var _faceImage : Image
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		private var _container:ScrollContainer;

		private var _groupedList:GroupedList;

		/**
		 * This is the constructor.
		 * 
		 */
		public function TestAnswerScreen()
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
			title = PhrasesConstant.answerScreenTitle;
			shardzHeader.nextButton.visible 		= false;
			shardzHeader.previousButton.visible 	= false;
			
			_container = _getNewVerticalScrollContainer();
			addChild(_container);
			
			
			//
			_doMakeList();
			
			
		}
		
		private function _doMakeList():void
		{
			
			_groupedList = new GroupedList();
			//if(settings.style == Groupe.STYLE_INSET)
			//{
		//		_groupedList.nameList.add(GroupedList.ALTERNATE_NAME_INSET_GROUPED_LIST);
		//	}
			_groupedList.typicalItem = { text: "Item 1000" };
			_groupedList.typicalHeader = "Group 10";
			_groupedList.typicalFooter = "Footer 10";
		//	_groupedList.isSelectable = settings.isSelectable;
			//_groupedList.scrollerProperties.hasElasticEdges = settings.hasElasticEdges;
			_groupedList.itemRendererProperties.labelField = "text";
			//_groupedList.addEventListener(Event.CHANGE, list_changeHandler);
			addChildAt(_groupedList, 0);

			
			//fake
			_onLocationLoadServiceComplete();
		}		
		
		protected function _onLocationLoadServiceComplete():void
		{
			// TODO Auto-generated method stub
			
			trace ("locationModel: " + locationModel);
			
			var groups:Array =
				[
					{
						header: "Africa",
						children:
						[
							{ text: "Aardvark" },
							{ text: "Alligator" },
							{ text: "Alpaca" },
							{ text: "Anteater" },
						]
					},
					{
						header: "Asia",
						children:
						[
							{ text: "Baboon" },
							{ text: "Bear" },
							{ text: "Beaver" },
						]
					},
					{
						header: "Australia",
						children:
						[
							{ text: "Canary" },
							{ text: "Cat" },
						]
					},
					{
						header: "South America",
						children:
						[
							{ text: "Deer" },
							{ text: "Dingo" },
							{ text: "Dog" },
							{ text: "Dolphin" },
							{ text: "Donkey" },
							{ text: "Dragonfly" },
							{ text: "Duck" },
							{ text: "Dung Beetle" },
						]
					},
					{
						header: "North America",
						children:
						[
							{ text: "Eagle" },
							{ text: "Earthworm" },
							{ text: "Eel" },
							{ text: "Elk" },
						]
					}
				];
			groups.fixed = true;
			
			
			_groupedList = new GroupedList();
			//if(settings.style == Groupe.STYLE_INSET)
			//{
			//		_groupedList.nameList.add(GroupedList.ALTERNATE_NAME_INSET_GROUPED_LIST);
			//	}
			_groupedList.dataProvider = new HierarchicalCollection(groups);
			
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
			
			_groupedList.y = _container.y;
			_groupedList.width = actualWidth;
			_groupedList.height = actualHeight - _groupedList.y;
			_groupedList.validate();
			//
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}


