/**
 * Copyright (C) 2011-2012 Chattrspace Inc.                    
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
package com.chattrspace.projects.mobilesingle.mvcs.model
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.CurrentSongChangedSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.GuestChangedSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.CommentsChangedSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.UserVO;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.CommentVO;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.SongVO;
	
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * <p>Model managing data: Core Data for app</p>
	 * 
	 */
	public class CommentsModel extends Actor
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		//PUBLIC SETTER/GETTER
		/**
		 *  
		 */		
		private var _comments_vector_commentsvo : Vector.<CommentVO>;
		public function get comments () 		: Vector.<CommentVO> 	{ return _comments_vector_commentsvo; }
		public function set comments (aValue : Vector.<CommentVO>) 	: void 		{ 
			_comments_vector_commentsvo = aValue; 
			//TODO, SHOULD RETURN A COPY, NOT ORIGINAL (JUST FOR PROTECTION'S SAKE)
			commentsChangedSignal.dispatch (comments);	
		
		}
		
		//PUBLIC
		/**
		 * Signal: Marks a change to the <code>HappyBirthdayModel</code>
		 * 
		 * MUST BE CUSTOM TYPE: ONLY IF MAPPED TO A COMMAND
		 * 
		 */	
		public var commentsChangedSignal : CommentsChangedSignal;
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function CommentsModel()
		{
			//SIGNALS
			commentsChangedSignal 	= new CommentsChangedSignal ();

		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		//PUBLIC
		/**
		 * Load Song From External XML
		 * 
		 * @param aSelectedLanguage_str : String
		 * 
		 * @return void
		 * 
		 */
		public function loadCurrentSongFromSelectedLanguage () : void
		{


		}

	
	}
}