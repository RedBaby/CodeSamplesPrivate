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
package com.rmc.projects.racecardz.robotlegs.view.mediator
{
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	import com.rmc.projects.racecardz.robotlegs.controller.events.NavigationEvent;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.NavigationSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.ShowNextQuestionSignal;
	import com.rmc.projects.racecardz.robotlegs.model.ConfigurationModel;
	import com.rmc.projects.racecardz.robotlegs.model.TestModel;
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AfterQuestionScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.AnswerScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.MainMenuScreen;
	import com.rmc.projects.racecardz.robotlegs.view.ui.QuestionScreen;
	import com.rmc.projects.shardz.events.ShardzEvent;
	
	import flash.events.TimerEvent;
	
	import org.robotlegs.core.IMediator;
	
	import starling.events.Event;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>This <code>QuestionScreenMediator</code> is designed to...</p>
	 * 
	 */
	public class QuestionScreenMediator extends AbstractMediator implements IMediator
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 * RL REFERENCE: VIEW 
		 */		
		public function get questionScreen () 					: QuestionScreen 	{ return viewComponent as QuestionScreen; }
		
		/**
		 * RL REFERENCE: SIGNAL 
		 */		
		[Inject]
		public var navigationSignal:NavigationSignal;

		/**
		 * RL REFERENCE: SIGNAL 
		 */		
		[Inject]
		public var showNextQuestionSignal:ShowNextQuestionSignal;
		
		
		/**
		 * RL REFERENCE: MODEL 
		 */		
		[Inject]
		public var testModel:TestModel;
		
		/**
		 * RL REFERENCE: MODEL 
		 */		
		[Inject]
		public var configurationModel:ConfigurationModel;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function QuestionScreenMediator()
		{
			super();
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		override public function onRegister():void
		{
			
			questionScreen.phrasesModel = phrasesModel;
			
			//
			questionScreen.questionTimerDurationMS = configurationModel.questionTimerDurationMS;
			//
			questionScreen.quitButtonClickSignal.add(_onQuitButtonClickSignal);
			questionScreen.guessButtonClickedSignal.add(_onGuessButtonClickSignal);
			questionScreen.nextButtonClickedSignal.add(_onNextButtonClickSignal);
			questionScreen.transitionOnStartSignal.add (_onTransitionOnStartSignal);
			questionScreen.questionTimerCompleteSignal.add (_onQuestionTimerCompleteSignal);
		}
		
		[PostConstruct]
		public function _onPostConstruct () : void
		{
			
		}
		
		override public function onRemove():void
		{
			//DESTROY
			super.onRemove();
			
			
			//CLEANUP
			questionScreen.nextButtonClickedSignal.remove(_onNextButtonClickSignal);
			questionScreen.quitButtonClickSignal.remove(_onQuitButtonClickSignal);
			questionScreen.guessButtonClickedSignal.remove(_onGuessButtonClickSignal);
			questionScreen.transitionOnStartSignal.remove (_onTransitionOnStartSignal);
			questionScreen.questionTimerCompleteSignal.remove (_onQuestionTimerCompleteSignal);

		}
		

		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		private function _onGuessButtonClickSignal(aEvent : Event):void
		{
			navigationSignal.dispatch( new NavigationEvent (NavigationEvent.SHOW_SCREEN, AnswerScreen));
			
		}
		private function _onQuitButtonClickSignal(aEvent : ShardzEvent):void
		{
			navigationSignal.dispatch( new NavigationEvent (NavigationEvent.SHOW_SCREEN, MainMenuScreen));
		}
		private function _onNextButtonClickSignal(aEvent : Event):void
		{
			showNextQuestionSignal.dispatch();
		}
		
		private function _onTransitionOnStartSignal(aEvent : Event):void
		{
			questionScreen.doLayoutWithData(testModel.currentQuestion, testModel.currentAnswerLocation, testModel.currentQuestionIndex, testModel.totalQuestions)
			
		}
		
		private function _onQuestionTimerCompleteSignal(aEvent : TimerEvent):void
		{
			testModel.currentAnswerLocation = LocationVO.GetInstanceForTimerComplete();
			questionScreen.doLayoutWithData(testModel.currentQuestion, testModel.currentAnswerLocation, testModel.currentQuestionIndex, testModel.totalQuestions)
		}


	}
}

