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
package com.chattrspace.projects.mobilesingle.mvcs.view.mediators.socialcontent
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.mvcs.model.CommentsModel;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.CommentVO;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.AbstractMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.socialcontent.CommentsSocialContentUI;
	import com.chattrspace.projects.mobilesingle.utils.AS3TypeConverter;
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Mediator</code> managing its sole <code>UI</code>.</p>
	 * 
	 */
	public class CommentsSocialContentUIMediator extends AbstractMediator
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		/**
		 * Reference: The sole <code>UI</code> being mediated
		 * 
		 */	
		[Inject]
		public var commentsSocialContentUI : CommentsSocialContentUI;
		
		/**
		 * Reference: The sole <code>UI</code> being mediated
		 * 
		 */	
		[Inject]
		public var commentsModel : CommentsModel;
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function CommentsSocialContentUIMediator()
		{
			//NOTHING HAPPENS HERE
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		/**
		 * Robotlegs Requirement: Handles Event of Registration
		 * 
		 * @return void
		 *
		 */
		override public function onRegister():void
		{
			//  SUPER
			super.onRegister();
			
			//	VIEW
			
			//	CONTEXT
			commentsModel.commentsChangedSignal.add(_onCommentsChanged);
			
			//	UPDATE
			
		}
		
		/**
		 * Robotlegs Requirement: Handles Event of Removal
		 * 
		 * @return void
		 *
		 */
		override public function onRemove():void
		{
			//  SUPER
			super.onRemove();
			
			//	VIEW
			commentsModel.commentsChangedSignal.remove(_onCommentsChanged);
			
			//	CONTEXT
			
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		//	VIEW

		
		//	CONTEXT
		/**
		 * Handles the Signal: <code>CommentsChangedSignal</code>.
		 * 
		 * @return void
		 * 
		 */
		protected function _onCommentsChanged (aComments_vector_commentvo : Vector.<CommentVO>):void
		{
			commentsSocialContentUI.list.dataProvider = AS3TypeConverter.convertVectorToArrayCollection( aComments_vector_commentvo);
		}
		
		
		
	}
}