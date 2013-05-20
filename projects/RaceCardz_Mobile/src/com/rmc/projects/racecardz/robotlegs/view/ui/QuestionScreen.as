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
	import com.rmc.projects.racecardz.managers.AssetManager;
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	import com.rmc.projects.racecardz.robotlegs.model.vo.QuestionVO;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import flash.events.TimerEvent;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.core.FeathersControl;
	import feathers.layout.VerticalLayout;
	
	import org.osflash.signals.Signal;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.utils.Color;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>QuestionScreen</code> class is ...</p>
	 * 
	 */
	public class QuestionScreen extends AbstractScreen
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  
		 */		
		private var _quitButtonClickSignal : Signal;
		public function get quitButtonClickSignal () 					: Signal 	{ return _quitButtonClickSignal; }
		
		
		/**
		 *  
		 */		
		public var _guessButtonClickedSignal:Signal;
		public function get guessButtonClickedSignal () 					: Signal 	{ return _guessButtonClickedSignal; }
		
		/**
		 *  
		 */		
		public var _questionTimerCompleteSignal:Signal;
		public function get questionTimerCompleteSignal () 					: Signal 	{ return _questionTimerCompleteSignal; }
		
		/**
		 *  
		 */		
		public var _nextButtonClickedSignal:Signal;
		public function get nextButtonClickedSignal () 					: Signal 	{ return _nextButtonClickedSignal; }
		
		/**
		 *  
		 */		
		private var _questionTimerDurationMS_uint : uint;
		public function set questionTimerDurationMS (aValue : uint) 	: void 		{ 
			_questionTimerDurationMS_uint = aValue;
			_question_timer.delay = _questionTimerDurationMS_uint /100
			_question_timer.repeatCount = 100; //visually tick down until expire
		}
		
		private function getQuestionTimeRemaining():Number
		{
			return ((100-_questionTimer_progressbar.value) * _questionTimerDurationMS_uint)/100000;
		}
		/**
		 *  
		 */	
		private var _isAnswerPresentAndCorrect_boolean : Boolean = false;
		
		// PUBLIC CONST
		/**
		 * 
		 */		
		public static var ID:String = "QuestionScreen";
		
		private var _faceImage : Image
		
		// PRIVATE
		private var _imageLoader:ImageLoader;
		
		private var _guessTitle_label:Label;
		
		private var _guessButton:Button;
		
		private var _imageTitle_label:Label;
		
		private var _questionVO:QuestionVO;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		
		
		private var _result_label:Label;
		
		private var _nextButton:Button;

		private var _questionTimer_label:Label;

		private var _questionTimer_progressbar:ProgressBar;

		private var _question_timer:Timer;
		/**
		 * This is the constructor.
		 * 
		 */
		public function QuestionScreen()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			_quitButtonClickSignal	 		= new Signal();
			_guessButtonClickedSignal 		= new Signal();
			_nextButtonClickedSignal 		= new Signal();
			_questionTimerCompleteSignal 	= new Signal();
			_question_timer 					= new Timer (5000); //will be overwritten from mediator
			questionTimerDurationMS			= 5000; //will be overwritten from mediator
			
			
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
			
			//LAYOUT
			_doLayoutContainer(VerticalLayout);
			(container.layout as VerticalLayout).gap = 3;
			
			
			//
			shardzHeader.nextButton.visible 		= false;
			shardzHeader.previousButton.visible = true;
			
			//LISTEN
			addEventListener(ShardzEvent.HEADER_PREVIOUS_BUTTON_CLICK, _onQuitButtonClick);
			_question_timer.addEventListener(TimerEvent.TIMER_COMPLETE, _onQuestionTimerComplete);
			_question_timer.addEventListener(TimerEvent.TIMER, 			_onQuestionTimer);
			
			
			/*
			
			Number of items
			
			
			*/
			//
			_imageTitle_label = new Label ();
			container.addChild(_imageTitle_label);
			
			_imageLoader = new ImageLoader ()
			_imageLoader.addEventListener(Event.COMPLETE, _onURLLoaderComplete);
			_imageLoader.maintainAspectRatio = true;
			
			
			container.addChild(_imageLoader);
			
			//
			_questionTimer_label = new Label ();
			container.addChild(_questionTimer_label);
			//
			_questionTimer_progressbar = new ProgressBar ();
			_questionTimer_progressbar.direction = ProgressBar.DIRECTION_HORIZONTAL;
			_questionTimer_progressbar.minimum = 0;
			_questionTimer_progressbar.maximum = 100;
			_questionTimer_progressbar.value = 100;
			container.addChild(_questionTimer_progressbar);
			//
			_guessTitle_label = new Label ();
			container.addChild(_guessTitle_label);
			//
			_result_label = new Label ();
			container.addChild(_result_label);
			
			//
			_guessButton = new Button ();
			_guessButton.addEventListener(Event.TRIGGERED, _onGuessButtonClicked);
			container.addChild(_guessButton);
			
			//
			_nextButton = new Button ();
			_nextButton.addEventListener(Event.TRIGGERED, _onNextButtonClicked);
			container.addChild(_nextButton);
			
			
		}

		/**
		 * SHARDZ: Destroy
		 * 
		 * @return void
		 */	
		override public function destroy () : void 
		{
			// SUPER
			super.destroy();
			
			//
			_question_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, _onQuestionTimerComplete);
			_question_timer.stop();
			
			//CLEANUP
			removeEventListener(ShardzEvent.HEADER_PREVIOUS_BUTTON_CLICK, _onQuitButtonClick);
		}
		
		
		
		override protected function _doLayoutWithLocalization():void
		{
			shardzHeader.previousButton.label 	= phrasesModel.phrasesVO.buttonQuit_str
			
			_questionTimer_label.text 		= phrasesModel.phrasesVO.labelTimerTitle_str;
			_imageTitle_label.text 	= phrasesModel.phrasesVO.labelImageTitle_str;
			_guessButton.label 		= phrasesModel.phrasesVO.buttonGuess_str;
			_nextButton.label 		= phrasesModel.phrasesVO.buttonNext_str;
		}
		
		private function _setGuessTitleLabel(aGuess_str:String):void
		{
			if (aGuess_str.length > 0) {
				_guessTitle_label.text 	= phrasesModel.phrasesVO.labelGuessTitle_str + " : " + aGuess_str;
			} else {
				_guessTitle_label.text 	= phrasesModel.phrasesVO.labelGuessTitle_str;
				
			}
		}
		
		public function doLayoutWithData(aCurrentQuestionVO:QuestionVO, aCurrentAnswerLocation:LocationVO, aCurrentQuestionIndex_uint : uint, aTotalQuestions_uint : uint):void
		{
			//QUESTION
			_questionVO = aCurrentQuestionVO
				
			title 								= phrasesModel.phrasesVO.titleQuestionScreen_str + " # " + aCurrentQuestionIndex_uint + " / " + aTotalQuestions_uint;
			
			
			//ANSWER
			if (aCurrentAnswerLocation != null) {
				_setGuessTitleLabel (aCurrentAnswerLocation.title);
				//_guessButton.isEnabled = false;
				if (aCurrentQuestionVO.locationVO.data == aCurrentAnswerLocation.data) {
					_isAnswerPresentAndCorrect_boolean = true;
					_result_label.text = "[Correct in "+getQuestionTimeRemaining()+" Seconds)]";
				} else {
					_isAnswerPresentAndCorrect_boolean = false;
					_result_label.text = "[Incorrect.]";
				}
				
				
				
				//ANSWER SUBMITTED ALREADY
				_doSetComponentVisible (_guessButton, false);
				_doSetComponentVisible (_nextButton, true);
				
				invalidate();
			} else {
				//NO ANSWER SUBMITTED YET
				_doLoadImage (_questionVO.imageURL);
				//
				_question_timer.reset();
				_question_timer.start();
				//
				_result_label.text = "";
				_setGuessTitleLabel ("");
				_doSetComponentVisible (_guessButton, true);
				_doSetComponentVisible (_nextButton, false);
	
				
			}
		}

		
		private function _doSetComponentVisible(aFeathersControl:FeathersControl, aIsVisible_boolean:Boolean):void
		{
			
			if (aIsVisible_boolean == true) {
				
				//ADD IF NEEDED
				if (container.getChildIndex(aFeathersControl) == -1) {
					container.addChild(aFeathersControl);
				}
				
			} else {
				
				//REMOVE IF PRESENT
				if (container.getChildIndex(aFeathersControl) != -1) {
					container.removeChild(aFeathersControl);
				}
			}
			
		}		
		
		
		private function _doLoadImage(aURL_str : String):void
		{
			_imageLoader.source = aURL_str;
			
		}		
		
		protected function _onURLLoaderComplete(aEvent:Event):void
		{
			// TODO Auto-generated method stub
			
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
			container.x 		= shardzHeader.x;
			container.y 		= shardzHeader.y + shardzHeader.height;
			container.width		= actualWidth;
			_imageLoader.width = container.width;
			_imageLoader.height = actualHeight/2
			//
			
			
			//not sure, seems I must set this here for it to work
			if (_isAnswerPresentAndCorrect_boolean == true) {
				_result_label.textRendererProperties.textFormat = new TextFormat( new AssetManager.FONT_CANDARA().fontName, 18, Color.GREEN, true);
			} else {
				_result_label.textRendererProperties.textFormat = new TextFormat( new AssetManager.FONT_CANDARA().fontName, 18, Color.RED, true);
				
			}
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onQuitButtonClick(aEvent : ShardzEvent):void
		{
			_quitButtonClickSignal.dispatch(aEvent);
		}
		
		private function _onGuessButtonClicked(aEvent : Event):void
		{
			_guessButtonClickedSignal.dispatch(aEvent);
			_question_timer.stop();
		}
		
		private function _onNextButtonClicked(aEvent : Event):void
		{
			_nextButtonClickedSignal.dispatch(aEvent);
		}
		
		protected function _onQuestionTimerComplete(aEvent:TimerEvent):void
		{
			//CHANGE VALUES SO WE SEE NO 'BAR'
			_questionTimer_progressbar.value = 0; //still at '0' we see some yellow bar. TODO, fix?
			_questionTimerCompleteSignal.dispatch(aEvent);
		}		
		
		protected function _onQuestionTimer(aEvent:TimerEvent):void
		{
			var total_uint 	: uint 				= _question_timer.repeatCount //10
			var current_uint : uint 				= _question_timer.currentCount //3 for example
			var percentLeft_num : Number 		= current_uint/total_uint*100;
			_questionTimer_progressbar.value 	= 100 - percentLeft_num;
		}		
		
		
	}
}


