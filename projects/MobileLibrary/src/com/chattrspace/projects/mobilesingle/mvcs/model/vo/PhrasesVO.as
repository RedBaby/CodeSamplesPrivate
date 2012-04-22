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
package com.chattrspace.projects.mobilesingle.mvcs.model.vo
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * <p>Holds the data: For UI display </p>
	 * 
	 */
	[Bindable]
	public class PhrasesVO	
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		/**
		 * NO PROPERTY COMMENTS NEEDED WITHIN THIS DOCUMENT
		 * 
		 */		
		
		////////////////////////////////////////
		//		VIEW TITLES
		////////////////////////////////////////
		public var logInViewTitle : String;
		public var mainViewTitle : String;
		public var settingsViewTitle : String;
		public var sharedSettingsViewTitle : String;
		
		
		////////////////////////////////////////
		//		NAVIGATION BAR 
		////////////////////////////////////////
		public var backButtonLabel : String;
		public var settingsButtonLabel : String;
		
		
		////////////////////////////////////////
		//		LOGIN VIEW COMPONENTS
		////////////////////////////////////////
		public var logInWithFacebook : String;
		public var logOutWithFacebook : String;
		public var notAMemberButton : String;
		public var legalTextCopy : String;
		
		
		////////////////////////////////////////
		//		MAIN VIEW COMPONENTS
		////////////////////////////////////////
		public var recordButton : String;
		public var uploadButton : String;
		public var usersToggleButton : String;
		public var commentsToggleButton : String;
		
		
		////////////////////////////////////////
		//		SOCIAL CONTENT : COMMENTS
		////////////////////////////////////////
		public var commentsTextInputDefault : String;
		public var commentsItemRendererBodyText : String;
		public var commentsTimeDays : String;
		public var commentsTimeHours : String;
		public var commentsTimeMinutes : String;
		public var commentsTimeSeconds : String;
		
		
		////////////////////////////////////////
		//		SOCIAL CONTENT : USERS
		////////////////////////////////////////
		public var usersTextInputDefault : String;
		public var usersParticipantsText : String;
		public var usersItemRendererBodyText : String;
		
		
		////////////////////////////////////////
		//		SETTINGS VIEW COMPONENTS
		////////////////////////////////////////
		public var settingsAccount : String;
		public var settingsSharedSettings : String;
		public var settingsMoreSettings : String;
		public var settingsChattrspaceOnTheWeb : String;
		
		////////////////////////////////////////
		//		DEMO ONLY - DON'T EDIT
		////////////////////////////////////////
		public var demoViewTitle : String;

		
		//--------------------------------------
		//  OLD.
		
		
		
		
		
		
		
		
		
		
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		/**
		* Display Text: Title for view
		* 
		*/		
		public var mainViewTitle_str : String;
		
		/**
		* Display Text: Title for view
		* 
		*/		
		public var songViewTitle_str : String;
		
		/**
		* Display Text: Button label before interactivity.
		* 
		*/		
		public var loadMessageButtonLabel_str : String;
		
		/**
		* Display Text: Button tooltip  
		* 
		*/		
		public var loadMessageButtonToolTip_str : String;
		
		
		/**
		* Display Text: Button label
		* 
		*/		
		public var shareButtonLabel_str : String;
		
		/**
		* Display Text: Button tooltip  
		* 
		*/		
		public var backButtonToolTip_str : String;
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var guestNameLabel_str : String;
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var guestGenderLabel_str : String;
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var guestGenderMaleRadioButtonLabel_str : String;
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var guestGenderFemaleRadioButtonLabel_str : String;
		
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var createdByUs_str : String;
		
		
		/**
		* Display Text: Label Text
		* 
		*/		
		public var legalText_str : String;
		
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		* This is the constructor.
		* 
		*/
		public function PhrasesVO ()
		{
		//SUPER
		super(); 
		
		}
		
		
		
		}
		}
