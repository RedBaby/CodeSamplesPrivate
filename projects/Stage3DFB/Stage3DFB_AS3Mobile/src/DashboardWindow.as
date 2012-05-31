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
	import com.bit101.components.HBox;
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	import com.bit101.components.Window;
	
	import flash.display.DisplayObjectContainer;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>DashboardWindow</code> is designed to...</p>
	 * 
	 */
	public class DashboardWindow extends Window
	{
		
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		public function get bodyText () 					: String 	{ return _bodyText_text.text; }
		public function set bodyText (aValue : String) 	: void 		{ _bodyText_text.text = aValue; }
		private var _bodyText_text:Text;
		
		/**
		 * Describe this member...
		 * 
		 */
		private var _progressBar:ProgressBar;
		public function get progressBar () 					    : ProgressBar 	{ return _progressBar; }
		public function set progressBar (aValue : ProgressBar) 	: void 		    { _progressBar = aValue; }
		
		
		// PUBLIC CONST
		
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		private var _contents_vbox:VBox;
		
		private var _dashboardParent_hbox:HBox;
		
		/**
		 *  
		 */		
		private var _dashboardChild_For_PublicContents_hbox:HBox;
		public function get contentsHBox () 					: HBox 	{ return _dashboardChild_For_PublicContents_hbox; }
		public function set contentsHBox (aValue : HBox) 	: void 		{ _dashboardChild_For_PublicContents_hbox = aValue; }
		
		/**
		 * This is the constructor.
		 * 
		 */
		public function DashboardWindow(uiParent : DisplayObjectContainer, aParentaTitle_str : String, aBodyText_str : String)
		{
			// SUPER
			super(uiParent, 0, 0 ,aParentaTitle_str);
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			draggable 			= false;
			hasMinimizeButton 	= true;
			minimized 			= true;
			//
			//
			_dashboardParent_hbox 				= new HBox (uiParent, 0,0);
			_dashboardParent_hbox.alignment 	= VBox.CENTER;
			//
			_dashboardChild_For_PublicContents_hbox = new HBox (uiParent, 3,3);
			_dashboardChild_For_PublicContents_hbox.alignment = HBox.MIDDLE;
			//
			_bodyText_text = new Text (uiParent, 0, 0, aBodyText_str );
			
			//PUT AN EMPTY BOX TO THE RIGHT (FOR STATS), AND LEFT TO THE RIGHT
			_dashboardParent_hbox.addChild(_bodyText_text);
			_dashboardParent_hbox.addChild(_dashboardChild_For_PublicContents_hbox);
			addChild(_dashboardParent_hbox);
			//
			setSize(width, height);
			//
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Sets the size of the component.
		 * @param w The width of the component.
		 * @param h The height of the component.
		 */
		override public function setSize(w:Number, h:Number):void
		{
			super.setSize(w,h);
			//	
			width = w;
			height = h;
			//
			if (_dashboardParent_hbox) {
				_dashboardParent_hbox.width 	= width;
				_dashboardParent_hbox.height 	= height;
			}
			if (_bodyText_text) {
				_bodyText_text.width 	= width - 135;
			}
		}
		
		
		// PRIVATE
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
	}
}