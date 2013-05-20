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
package com.rmc.projects.racecardz.robotlegs.model
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.projects.racecardz.managers.DataMagic;
	import com.rmc.projects.racecardz.robotlegs.model.vo.LocationVO;
	import com.rmc.projects.racecardz.robotlegs.model.vo.QuestionVO;
	
	import org.robotlegs.mvcs.Actor;
	
	
	
	/**
	 * <p>Model managing data: Test of Questions</p>
	 * 
	 **/
	public class TestModel extends Actor
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		//PUBLIC SETTER/GETTER
		/**
		 *  
		 */		
		private var _questions_vector : Vector.<QuestionVO>;
		public function get questions () 					: Vector.<QuestionVO> 	{ 
			return _questions_vector; 
		}
		public function set questions (aValue : Vector.<QuestionVO>) 	: void 		{ 
			_questions_vector = aValue;
			_totalQuestions_uint = _questions_vector.length;
		}
		

		/**
		 *  
		 */		
		private var _totalQuestions_uint : uint;
		public function get totalQuestions () 					: uint 	{ return _totalQuestions_uint; }
		
		/**
		 *  
		 */		
		private var _currentQuestion : QuestionVO;
		public function get currentQuestion () 					: QuestionVO 	{ return _currentQuestion; }
		public function set currentQuestion (aValue : QuestionVO) 	: void 		{ _currentQuestion = aValue; }
		
		/**
		 *  
		 */		
		private var _currentAnswerLocation : LocationVO;
		public function get currentAnswerLocation () 					: LocationVO 	{ return _currentAnswerLocation; }
		public function set currentAnswerLocation (aValue : LocationVO) 	: void 		{ _currentAnswerLocation = aValue; }
		
		/**
		 *  
		 */		
		public function get currentQuestionIndex () 					: uint 	{ 
			
			return _totalQuestions_uint - _questions_vector.length
			/*
			var index_uint : uint = 0;
			for each (var questionVO : QuestionVO in questionVO) {
				if (questionVO.locationVO.data == _currentQuestion.locationVO.data) {
					break;
				}
				index_uint++;
			}
			return index_uint; 
			*/
		}
		
		
		//PUBLIC
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function TestModel()
		{
			//SIGNALS
			
			//PROPERTIES
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		//PUBLIC
		/**
		 * 
		 * 
		 */		
		public function randomizeQuestions():void
		{
			DataMagic.ShuffleVector (_questions_vector as Vector.<*>);
			
		}
		
		/**
		 * 
		 * 
		 */		
		public function traceAllQuestions():void
		{
			//if the localized version doesn't exist, use the english one
			var index_uint : uint = 0;
			for each (var questionVO : QuestionVO in questions) {
				
				trace ("Q #"+index_uint+": " + questionVO.locationVO.title + " - " + questionVO.imageURL);
				index_uint++;
			}
			
		}
		
		
		//TODO, MOVE TO DATAMAGIC
		
	}
}



