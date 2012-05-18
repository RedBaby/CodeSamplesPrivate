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
	import flash.events.KeyboardEvent;
	
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
		public function get uiParent () 				: DisplayObjectContainer 	{  
			if (_uiParent_displayObjectContainer && !_isInitialized_boolean) {
				_isInitialized_boolean = true;
				
				//DO SOME 1-TIME INITILIZATION THAT DEPENDS ON _uiParent
				_uiParent_displayObjectContainer.stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
			}
			return _uiParent_displayObjectContainer;
		}
		public function set uiParent (aValue : DisplayObjectContainer) 	: void 		{ _uiParent_displayObjectContainer = aValue; }
		
		/**
		 *  
		 */		
		private var _isInitialized_boolean : Boolean = false;
		
		/**
		 *  
		 */		
		public function get stageWidth () 					: Number 	{ return uiParent.stage.stageWidth; }
		
		/**
		 *  
		 */		
		public function get stageHeight () 					: Number 	{ return uiParent.stage.stageHeight; }
		
		
		/**
		 *  
		 */		
		private static var _promptWindow:PromptWindow;
		
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
		
		/**
		 * Describe this member.
		 * 
		 */
		private var _dashboardWindow:DashboardWindow;
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		
		
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
			_promptWindow 			= new PromptWindow (aUIParent_displayobjectcontainer, aParentaTitle_str, aBodyText_str);
			resize();
			
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
			if (_promptWindow.bodyText) {
				_promptWindow.bodyText = "Loading " + aPercentComplete_num + "%...";
				_promptWindow.progressBar.maximum = 100;
				_promptWindow.progressBar.value = aPercentComplete_num*100;
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
			if (uiParent && _promptWindow && uiParent.getChildByName(_promptWindow.name)) {
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
				_promptWindow.alpha 	= 0;
				_promptWindow.visible	= false;
				_promptWindow.draw();
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ()
				tweenMaxVars.prop("autoAlpha",1);
				tweenMaxVars.immediateRender(true);
				tweenMaxVars.delay(0);
				//
				_fadeIn_tweenmax = new TweenMax(_promptWindow, aDelayInSeconds_num, tweenMaxVars);
				_fadeIn_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeInCompleted,false, 0, true);
				_fadeIn_tweenmax.play();
				//
			} else {
				_onFadeInCompleted();
			}
		}
		
		protected function _onFadeInCompleted(event:Event = null):void
		{
			if (_promptWindow) {
				//
				_promptWindow.alpha 	= 1;
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
				_promptWindow.alpha 	= 1;
				_promptWindow.visible 	= true;
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ();
				tweenMaxVars.prop("autoAlpha", 0);
				tweenMaxVars.immediateRender(true);
				tweenMaxVars.delay(1);
				//
				_fadeOut_tweenmax = new TweenMax(_promptWindow, aDelayInSeconds_num, tweenMaxVars);
				_fadeOut_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted, false, 0, true);
			} else {
				
				_onFadeOutCompleted();
			}
		}
		
		protected function _onFadeOutCompleted(event:Event = null):void
		{
			if (_promptWindow) {
				//
				_promptWindow.alpha 	= 0;
				_promptWindow.visible   = false;
				//
				uiParent.removeChild(_promptWindow);
				//
				_promptWindow				= null;
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
			_dashboardWindow = new DashboardWindow (uiParent,aParentaTitle_str, aBodyText_str);
			//
			uiParent.addChild(_dashboardWindow);
			
			
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
			if (_promptWindow) {
				_promptWindow.setSize	(stageWidth*.50, _promptWindow.width*.50);
				_promptWindow.move		((stageWidth)/2 - _promptWindow.width/2, (stageHeight)/2 - _promptWindow.height/2);
				
			}
			if (_dashboardWindow) {
				_dashboardWindow.setSize(stageWidth, 130);
				_dashboardWindow.move(0,0);
				
			}
			
		}
		public static function resize():void { return UIManager.getInstance().resize();}
		
		
		
		
		/**
		 * ADD UI: 
		 * 
		 * @return HBox
		 *
		 */
		public function getDashboardContents():HBox
		{
			if (_dashboardWindow) {
				return _dashboardWindow.contentsHBox;
			} else {
				return null; 
			}
		}
		public static function getDashboardContents():HBox { return UIManager.getInstance().getDashboardContents();}
		
		
		
		protected function _onKeyDown(aEvent:KeyboardEvent):void
		{
			//TILDA ~/` KEY
			if (aEvent.keyCode == 192) {
				if (_dashboardWindow) {
					_dashboardWindow.minimized = !_dashboardWindow.minimized;
				}
			}
			
		}
		
	}
}




//--------------------------------------
//  Singleton Enforcer: Prevents 
//	Instantiation of The Class 
//	Above From Anywhere Outside 
//	This Document
//--------------------------------------
internal class SingletonEnforcer {}