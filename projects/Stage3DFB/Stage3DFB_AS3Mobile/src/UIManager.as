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
//Marks the right margin of code *******************************************************************
package  
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	import com.bit101.components.HBox;
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	import com.bit101.components.VBox;
	import com.bit101.components.Window;
	import com.greensock.TweenMax;
	import com.greensock.data.TweenMaxVars;
	import com.greensock.events.TweenEvent;
	import com.rmc.errors.SingletonIllegalConstructorCallError;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	
	import org.osmf.metadata.TimelineMarker;
	
	public class UIManager
	{
		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		/**
		 *  
		 */		
		private var _uiParent_displayObjectContainer : DisplayObjectContainer;
		public function get uiParent () 				: DisplayObjectContainer 	{ return _uiParent_displayObjectContainer; }
		public function set uiParent (aValue : DisplayObjectContainer) 	: void 		{ _uiParent_displayObjectContainer = aValue; }
		
		/**
		 *  
		 */		
		public function get stageWidth () 					: Number 	{ return uiParent.stage.stageWidth; }
		
		/**
		 *  
		 */		
		public function get stageHeight () 					: Number 	{ return uiParent.stage.stageHeight; }
		
		private static var _loadingPrompt_window:Window;
		//PUBLIC CONST
		
		//PRIVATE STATIC
		/**
		 * Describe this member.
		 * 
		 */
		private static var _INSTANCE : UIManager;
		
		//PRIVATE
		/**
		 * Describe this member.
		 * 
		 */
		private var _fadeOut_tweenmax:TweenMax;
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _fadeIn_tweenmax:TweenMax;
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		
		private var _loadingPromptBodyText_text:Text;

		private var _loadingPromptProgressBar:ProgressBar;

		private var _dashboard_window:Window;

		private var _dashboardContents_hbox:HBox;
		
		
		/**
		 * This is the constructor.
		 * 
		 */
		public function UIManager(singletonEnforcer : SingletonEnforcer) 
		{
			
			if ( _INSTANCE ) {
				
				throw new SingletonIllegalConstructorCallError ();
				
			} else {
				
				//ONE TIME CREATION STUFF
				
			}
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		
		//PUBLIC STATIC
		/**
		 * Get an instance of the singleton class.
		 * 
		 * @return <code>UIManager</code> The instance to return
		 *
		 */
		public static function getInstance() : UIManager  
		{
			if (!_INSTANCE) {
				_INSTANCE = new UIManager (new SingletonEnforcer ()); 	
			}
			return _INSTANCE;
		}
		
		
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//
		//
		//
		//		NOTE: PROMPT STUFF
		//
		//
		//
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * ADD UI: 
		 * 
		 * @param aUIParent_displayobjectcontainer : DisplayObjectContainer
		 * @param aTitle_str : String
		 * @param aBodyText_str: String
		 * 
		 * @return void
		 *
		 */
		public function addPrompt(aUIParent_displayobjectcontainer : DisplayObjectContainer, aParentaTitle_str : String, aBodyText_str: String):void
		{
			//
			uiParent = aUIParent_displayobjectcontainer;
			
			//
			_loadingPrompt_window = new Window (uiParent,0,0,aParentaTitle_str);
			_loadingPrompt_window.draggable 		= false;
			_loadingPrompt_window.hasMinimizeButton = false;
			_loadingPrompt_window.minimized 		= false;
			//
			_loadingPrompt_window.width 	= stageWidth*.50;
			_loadingPrompt_window.height 	= _loadingPrompt_window.width*.50;
			_loadingPrompt_window.x 		= (stageWidth)/2 - _loadingPrompt_window.width/2
			_loadingPrompt_window.y 		= (stageHeight)/2 - _loadingPrompt_window.height/2
				//
			var vBox : VBox = new VBox (uiParent, 0,0);
			vBox.width 		= _loadingPrompt_window.width;
			vBox.height 	= _loadingPrompt_window.height;
			vBox.alignment 	= VBox.CENTER;
			//
			_loadingPromptBodyText_text = new Text (uiParent,0,0,aBodyText_str );
			_loadingPromptBodyText_text.width 		= _loadingPrompt_window.width;
			_loadingPromptProgressBar = new ProgressBar (uiParent);
			_loadingPromptProgressBar.width 		= _loadingPrompt_window.width;
			//
			vBox.addChild(_loadingPromptBodyText_text);
			vBox.addChild(_loadingPromptProgressBar);
			_loadingPrompt_window.addChild(vBox);
			//
			uiParent.addChild(_loadingPrompt_window);
			
			//FADE IN SLOWLY
			_doFadeIn(0.5);
			
		}
		public static function addPrompt(aUIParent_displayobjectcontainer : DisplayObjectContainer, aTitle_str : String, aBodyText_str: String):void { return UIManager.getInstance().addPrompt(aUIParent_displayobjectcontainer, aTitle_str, aBodyText_str);}
		
		/**
		 * ADD UI: 
		 * 
		 * @param aTitle_str : String
		 * @param aBodyText_str: String
		 * 
		 * @return void
		 *
		 */
		public function updatePromptBodyText(aPercentComplete_num : Number):void
		{
			if (_loadingPromptBodyText_text) {
				_loadingPromptBodyText_text.text = "Loading " + aPercentComplete_num + "%...";
				_loadingPromptProgressBar.maximum = 100;
				_loadingPromptProgressBar.value = aPercentComplete_num*100;
			}
		}
		public static function updatePromptBodyText(aPercentComplete_num: Number):void { return UIManager.getInstance().updatePromptBodyText(aPercentComplete_num);}
		
		
		/*
		* ADD UI: 
		* 
		* @return void
		*
		*/
		public function removePrompt():void
		{
			if (uiParent && _loadingPrompt_window && uiParent.getChildByName(_loadingPrompt_window.name)) {
				//FADE OUT SLOWLY
				_doFadeOut(0.5);
				
			}
		}
		public static function removePrompt():void { UIManager.getInstance().removePrompt();}
		
		
		/**
		 * ADD UI: 
		 * 
		 * @return void
		 *
		 */
		public function _doFadeIn(aDelayInSeconds_num: Number):void
		{
			if (_fadeIn_tweenmax == null && aDelayInSeconds_num > 0) {
				//
				_loadingPrompt_window.alpha 	= 0;
				_loadingPrompt_window.draw();
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ()
				tweenMaxVars.autoAlpha(0)
				tweenMaxVars.prop("alpha",1);
				tweenMaxVars.immediateRender(true);
				tweenMaxVars.delay(0);
				//
				trace ("start in" + _loadingPrompt_window.alpha + " to " + 1);
				_fadeIn_tweenmax = new TweenMax(_loadingPrompt_window, aDelayInSeconds_num, tweenMaxVars);
				_fadeIn_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeInCompleted,false, 0, true);
				_fadeIn_tweenmax.play();
				//
			} else {
				trace ("start FAILED");
				_onFadeInCompleted();
			}
		}
		
		protected function _onFadeInCompleted(event:Event = null):void
		{
			trace ("start finish");
			if (_loadingPrompt_window) {
				//
				_loadingPrompt_window.alpha 	= 1;
				//
				if (_fadeOut_tweenmax && _fadeOut_tweenmax.hasEventListener(TweenEvent.COMPLETE)) {
					_fadeOut_tweenmax.removeEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted);
				}
				_fadeIn_tweenmax 	= null;
			}
			
		}
		
		/**
		 * ADD UI: 
		 * 
		 * @return void
		 *
		 */
		public function _doFadeOut(aDelayInSeconds_num: Number):void
		{
			if (_fadeOut_tweenmax == null && aDelayInSeconds_num > 0) {
				//
				_loadingPrompt_window.alpha 	= 1;
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ();
				tweenMaxVars.prop("alpha", 0);
				tweenMaxVars.delay(1);
				//
				_fadeOut_tweenmax = new TweenMax(_loadingPrompt_window, aDelayInSeconds_num, tweenMaxVars);
				_fadeOut_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted, false, 0, true);
			} else {
				
				_onFadeOutCompleted();
			}
		}
		
		protected function _onFadeOutCompleted(event:Event = null):void
		{
			if (_loadingPrompt_window) {
				//
				_loadingPrompt_window.alpha 	= 0;
				//
				uiParent.removeChild(_loadingPrompt_window);
				//
				_loadingPrompt_window				= null;
				if (_fadeOut_tweenmax && _fadeOut_tweenmax.hasEventListener(TweenEvent.COMPLETE)) {
					_fadeOut_tweenmax.removeEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted);
				}
				_fadeOut_tweenmax 	= null;
			}
			
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//
		//
		//
		//		NOTE: DASHBOARD STUFF
		//
		//
		//
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * ADD UI: 
		 * 
		 * @param aUIParent_displayobjectcontainer : DisplayObjectContainer
		 * @param aTitle_str : String
		 * @param aBodyText_str: String
		 * 
		 * @return void
		 *
		 */
		public function addDashboard(aUIParent_displayobjectcontainer : DisplayObjectContainer, aParentaTitle_str : String, aBodyText_str: String):void
		{
			//
			uiParent = aUIParent_displayobjectcontainer;
			
			//
			_dashboard_window = new Window (uiParent,0,0,aParentaTitle_str);
			_dashboard_window.draggable 		= false;
			_dashboard_window.hasMinimizeButton = true;
			_dashboard_window.minimized 		= false;
			//
			resize();
			_dashboard_window.x 		= 0;
			_dashboard_window.y 		= 0;
			//
			var hBox : HBox = new HBox (uiParent, 0,0);
			hBox.width 		= _dashboard_window.width;
			hBox.height 	= _dashboard_window.height;
			hBox.alignment 	= VBox.CENTER;
			//
			_dashboardContents_hbox = new HBox (uiParent, 0,0);
			_dashboardContents_hbox.width 		= 200;
			_dashboardContents_hbox.height 		= 200;
			//
			var _dashboarBodyText_text : Text= new Text (uiParent,0,0,aBodyText_str );
			_dashboarBodyText_text.width 		= _dashboard_window.width;
			//PUT AN EMPTY BOX TO THE LEFT (FOR STATS), AND TEXT TO THE RIGHT
			hBox.addChild(_dashboardContents_hbox);
			hBox.addChild(_dashboarBodyText_text);
			_dashboard_window.addChild(hBox);
			//
			uiParent.addChild(_dashboard_window);
			
			
		}
		public static function addDashboard(aUIParent_displayobjectcontainer : DisplayObjectContainer, aTitle_str : String, aBodyText_str: String):void { return UIManager.getInstance().addDashboard(aUIParent_displayobjectcontainer, aTitle_str, aBodyText_str);}
		
		
		
		
		
		/**
		 * ADD UI: 
		 * 
		 * @return void
		 *
		 */
		public function resize():void
		{
			if (_dashboard_window) {
				_dashboard_window.width = stageWidth;
				_dashboard_window.height = 100;
			}
			
			
		}
		public static function resize():void { return UIManager.getInstance().resize();}
		
		
		
		
		/**
		 * ADD UI: 
		 * 
		 * @return HBox
		 *
		 */
		public function getDashboarContents():HBox
		{
			return _dashboardContents_hbox
			
		}
		public static function getDashboardContents():HBox { return UIManager.getInstance().getDashboarContents();}
		
		
	}
}




//--------------------------------------
//  Singleton Enforcer: Prevents 
//	Instantiation of The Class 
//	Above From Anywhere Outside 
//	This Document
//--------------------------------------
internal class SingletonEnforcer {}