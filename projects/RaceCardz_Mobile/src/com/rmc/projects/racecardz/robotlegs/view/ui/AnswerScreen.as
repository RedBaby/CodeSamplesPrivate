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
package com.rmc.projects.racecardz.robotlegs.view.ui
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.racecardz.managers.DataMagic;
	import com.rmc.projects.racecardz.robotlegs.model.LocationsModel;
	
	import feathers.controls.GroupedList;
	import feathers.data.HierarchicalCollection;
	import feathers.layout.VerticalLayout;
	
	import org.osflash.signals.Signal;
	
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
	public class AnswerScreen extends AbstractScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		public var groupListChangeSignal:Signal;
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "AnswerScreen";
		
		private var _faceImage : Image
		
		// PRIVATE
		
		private var _groupedList:GroupedList;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		
		/**
		 * This is the constructor.
		 * 
		 */
		public function AnswerScreen()
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
			_doLayoutContainer(VerticalLayout);
			(container.layout as VerticalLayout).paddingBottom 	= 0;
			(container.layout as VerticalLayout).paddingLeft 	= 0;
			(container.layout as VerticalLayout).paddingRight 	= 0;
			(container.layout as VerticalLayout).paddingTop 		= 0;
			
			//
			shardzHeader.nextButton.visible 		= false;
			shardzHeader.previousButton.visible 	= false;
			
			groupListChangeSignal = new Signal();
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
			_groupedList.addEventListener(Event.CHANGE, _onGroupListChange);
			container.addChild(_groupedList);
			
			
		}		
		
		
		override protected function _doLayoutWithLocalization():void
		{
			title = phrasesModel.phrasesVO.titleAnswerScreen_str
		}
		
		public function doLayoutWithLocationsModel(aLocationsModel : LocationsModel):void
		{
			//SCREEN PERSISTS FOREVER SO CLEAR OUT SELECTED
			if (_groupedList.selectedItem) {
				_groupedList.selectedItem = null;
			}
			
			var groups_array : Array = DataMagic.GetGroupsArrayFromLocationsModel(aLocationsModel);
			
			//if(settings.style == Groupe.STYLE_INSET)
			//{
			//		_groupedList.nameList.add(GroupedList.ALTERNATE_NAME_INSET_GROUPED_LIST);
			//	}
			_groupedList.dataProvider = new HierarchicalCollection(groups_array);
			
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
			
			_groupedList.y = container.y;
			_groupedList.width = actualWidth;
			_groupedList.height = actualHeight - _groupedList.y;
			_groupedList.validate();
			//
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onGroupListChange(aEvent : Event):void
		{
			groupListChangeSignal.dispatch (aEvent);
		}
		
	}
}


