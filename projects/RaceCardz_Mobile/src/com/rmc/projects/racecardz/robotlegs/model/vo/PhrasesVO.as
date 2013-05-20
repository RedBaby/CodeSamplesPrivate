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
package com.rmc.projects.racecardz.robotlegs.model.vo
{
	import feathers.controls.Label;

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
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC
		//--------------------------------------
		//  Debug
		//--------------------------------------
		public var labelInstructions_str:String		 = "You will see [x] faces. \nGuess the nationality of each within the time limit.";
		public var labelTimerTitle_str:String		 = "Timer";
		public var scrollTextAfterTest_str:String     = "You did [ok] with a score of [score], etc...";
		public var titleAfterTestScreen_str:String	 = "Summary";
		public var titleAfterQuestionScreen_str:String = "Loading...";
		public var buttonNext_str:String			= "Next";
		public var buttonQuit_str:String				= "Quit";
		public var scrollTextSettings_str:String		= " " +
			
"“Civilization is the encouragement of differences.“ -Mohandas Gandhi"+
"\n"+
"\n"+
"App"+
"\n"+
"\n"+
"This app is designed to measure the user's ability to distinguish the people of the world and improve that ability. The intention is to entertain and promote diversity education."+
"\n"+
"\n"+
"Developers"+
"\n"+
"\n"+
"Rivello Multimedia Consulting (RMC) is a boutique software consulting firm with a global focus. RMC's unique value is in creating and improving virtual staff relations and workflow procedures across cultures. RMC's experiences include working with teams in 4 continents and a dozen+ nationalities and its goals include increasing efficiencies in clients' cross-location, cross-culture, and cross-language locations. Continued victories are merging cultures and encouraging diversity from both personal and professional prospectives."+
"\n"+
"\n";
		
		public var labelLegal_str:String				= "TM & C RivelloMultimediaConsulting.com (RMC)";
		public var buttonContactUs_str:String		= "Contact RMC";
		public var titleSettingsScreen_str:String    = "Settings";
		public var buttonSettings_str:String			= "Settings";
		public var buttonBack_str:String				= "Back";

		/**
		 * Display Text:
		 * 
		 */		
		
		//MAIN MENU
		public var titleMainMenuScreen_str:String; //put in xml, LATER,... put all these in xml
		public var buttonPlayGame_str:String			= "Play Game";
		public var buttonOther_str:String			= "Other";
		
		//ANSWERS
		public var titleAnswerScreen_str:String 		= "Your Answer";
		
		
		//QUESTION
		public var titleQuestionScreen_str:String = "Question";
		public var labelImageTitle_str:String = "Image";
		public var labelGuessTitle_str:String = "Guess";
		public var buttonGuess_str:String = "Guess!";
		

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
