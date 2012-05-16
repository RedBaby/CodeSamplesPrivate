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
		
		private static var _window:Window;
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
		
		private var _bodyText_text:Text;
		
		
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
		
		
		/**
		 * ADD UI: 
		 * 
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
			_window = new Window (uiParent,0,0,aParentaTitle_str);
			//
			_window.width 	= stageWidth*.50;
			_window.height 	= _window.width*.50;
			_window.x 		= (stageWidth)/2 - _window.width/2
			_window.y 		= (stageHeight)/2 - _window.height/2
			var vBox : VBox = new VBox (uiParent, 0,0);
			vBox.width 		= _window.width;
			vBox.height 	= _window.height;
			vBox.alignment 	= VBox.CENTER;
			_bodyText_text = new Text (uiParent,0,0,aBodyText_str );
			_bodyText_text.width 		= _window.width;
			var text2 : ProgressBar = new ProgressBar (uiParent);
			text2.width 		= _window.width;
			vBox.addChild(_bodyText_text);
			vBox.addChild(text2);
			_window.addChild(vBox);
			//
			uiParent.addChild(_window);
			
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
			if (_bodyText_text) {
				_bodyText_text.text = "Loading " + aPercentComplete_num + "%...";
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
			if (uiParent && _window && uiParent.getChildByName(_window.name)) {
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
				_window.alpha 	= 0;
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ();
				tweenMaxVars.prop("alpha", 1);
				tweenMaxVars.delay(1);
				//
				trace ("start in" + _window.alpha + " to " + 1);
				_fadeIn_tweenmax = new TweenMax(_window, aDelayInSeconds_num, tweenMaxVars);
				_fadeIn_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeInCompleted,false, 0, true);
				//
			} else {
				trace ("start FAILED");
				_onFadeInCompleted();
			}
		}
		
		protected function _onFadeInCompleted(event:Event = null):void
		{
			trace ("start finish");
			if (_window) {
				//
				_window.alpha 	= 1;
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
				_window.alpha 	= 1;
				//
				var tweenMaxVars : TweenMaxVars = new TweenMaxVars ();
				tweenMaxVars.prop("alpha", 0);
				tweenMaxVars.delay(1);
				//
				_fadeOut_tweenmax = new TweenMax(_window, aDelayInSeconds_num, tweenMaxVars);
				_fadeOut_tweenmax.addEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted, false, 0, true);
			} else {
				
				_onFadeOutCompleted();
			}
		}
		
		protected function _onFadeOutCompleted(event:Event = null):void
		{
			if (_window) {
				//
				_window.alpha 	= 0;
				//
				uiParent.removeChild(_window);
				//
				_window				= null;
				if (_fadeOut_tweenmax && _fadeOut_tweenmax.hasEventListener(TweenEvent.COMPLETE)) {
					_fadeOut_tweenmax.removeEventListener(TweenEvent.COMPLETE, _onFadeOutCompleted);
				}
				_fadeOut_tweenmax 	= null;
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