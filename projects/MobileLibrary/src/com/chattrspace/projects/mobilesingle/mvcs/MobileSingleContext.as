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
package com.chattrspace.projects.mobilesingle.mvcs
{
	
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.ClearSelectedLanguageCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.GuestChangeCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.LoadHappyBirthdayModelCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.LoadPhrasesCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.LogInSignalCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.LogOutSignalCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.SelectedLanguageChangeCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.ShutdownCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.SocialButtonClickedCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.commands.StartupCommand;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.ClearSelectedLanguageSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.CommentsChangedSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.GuestChangeSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.LoadHappyBirthdayModelSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.LoadPhrasesModelSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.LogInSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.LogOutSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.SocialButtonClickedSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.StageOrientationChangeSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.ViewNavigatorPopViewSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.ViewNavigatorPushViewSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.model.CommentsModel;
	import com.chattrspace.projects.mobilesingle.mvcs.model.PhrasesModel;
	import com.chattrspace.projects.mobilesingle.mvcs.services.HappyBirthdayLoadService;
	import com.chattrspace.projects.mobilesingle.mvcs.services.ILoadService;
	import com.chattrspace.projects.mobilesingle.mvcs.services.PhrasesLoadService;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.ApplicationUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.PhraseableUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.socialcontent.CommentsSocialContentUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.socialcontent.UsersSocialContentUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.views.LogInViewUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.views.MainViewUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.mediators.views.SettingsViewUIMediator;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.ApplicationUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.IPhraseableUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.socialcontent.CommentsSocialContentUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.socialcontent.UsersSocialContentUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.views.LogInViewUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.views.MainViewUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.ui.views.SettingsViewUI;
	
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IMediatorMap;
	import org.robotlegs.mvcs.SignalContext;
	import org.robotlegs.utilities.variance.base.IVariantMediatorMap;
	import org.robotlegs.utilities.variance.base.RLVariantMediatorMap;
	
	/**
	 * <p>The Context is the 'glue' or 'brains of the application 
	 * 			    linking together the Model, View, Controller, and Services</p>
	 *
	 */
	public class MobileSingleContext extends SignalContext
	{
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		/**
		 *  
		 */		
		public function getMediatorMap () 					: IMediatorMap 	{ return mediatorMap; }

		override protected function get mediatorMap():IMediatorMap
		{
			return _mediatorMap ||= new RLVariantMediatorMap(contextView, createChildInjector(), reflector);
		}
		
		public function get variantMap():IVariantMediatorMap
		{
			return mediatorMap as IVariantMediatorMap;
		}
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function MobileSingleContext ()
		{
			super();
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * Start the application. Map model, view, controller concerns and kickoff the first event.
		 * 
		 * @return void
		 * 
		 */
		override public function startup() : void
		{

			//Do in this order so the injections and references work well
			_startupModel();        //1
			_startupServices();     //2
			_startupController();   //3
			_startupView();         //4
			
			// And we're done
			super.startup();
			dispatchEvent(new Event (ContextEvent.STARTUP));
			
		}
		
		/**
		 * Map: Model
		 * 
		 * @return void
		 * 
		 */
		protected function _startupModel() : void
		{	
			//	Model
			var phrasesModel : PhrasesModel = new PhrasesModel(); 	//Instantiated manually so I can set a default value (langcode)
			phrasesModel.langCode 			= PhrasesModel.EN;
			injector.mapValue		(PhrasesModel, phrasesModel);
			injector.mapSingleton	(CommentsModel);			//Instantiated automatically by RL	
			
			//SIGNALS SETUP WITHIN THIS CONTEXT - 1 OF 2: SIGNALS THAT ARE *NOT* MAPPED TO COMMANDS, BUT JUST OBSERVED DIRECTLY
			//b. RESPONSES
			injector.mapSingleton	(ViewNavigatorPushViewSignal);	
			injector.mapSingleton	(ViewNavigatorPopViewSignal);	
			injector.mapSingleton	(StageOrientationChangeSignal);	
			
		}
		
		
		/**
		 * Map: View
		 * 
		 * @return void
		 * 
		 */
		protected function _startupView() : void
		{
			
			
			/////////////////////////////////////
			//1. WITH INVARIANCE (LESS FLEXIBLE, BUT MUCH MORE COMMON)
			/////////////////////////////////////
			mediatorMap.mapView		(LogInViewUI, 		LogInViewUIMediator); 		//optional 3rd parameter, [MainViewUI]);
			mediatorMap.mapView		(MainViewUI, 		MainViewUIMediator); 		
			mediatorMap.mapView		(SettingsViewUI, 	SettingsViewUIMediator); 	
			//
			mediatorMap.mapView		(CommentsSocialContentUI, 	CommentsSocialContentUIMediator); 	
			mediatorMap.mapView		(UsersSocialContentUI, 		UsersSocialContentUIMediator); 	
			
			/////////////////////////////////////
			//2. NEW COVARIANCE (MORE FLEXIBLE) - (MobileSingle is the first time we're using this...)
			//before: mappings are to one specific type
			//now   : mappings are to one specific type or its interface or any of its super classes!
			/////////////////////////////////////
			variantMap.mapMediator(IPhraseableUI, PhraseableUIMediator, true); // true means USE covariance
			
			//DYNAMICALLY MAP The Main.mxml (outisde of this library) to a mediatory (in this library) via its UI Superclass, and
			//					CREATE IT SINCE ITS ALREADY ADDED TO THE STAGE (TOO LATE) FOR AUTO CREATION. All good
			variantMap.mapMediator(ApplicationUI, ApplicationUIMediator, true); // true means USE covariance
			mediatorMap.createMediator(FlexGlobals.topLevelApplication);

			
		}
		
		/**
		 * Map: Controller
		 * 
		 * @return void
		 * 
		 */
		protected function _startupController() : void
		{
			
			//SIGNALS SETUP WITHIN THIS CONTEXT - 2 OF 2: SIGNALS THAT ARE MAPPED TO COMMANDS
			//a. REQUESTS
			signalCommandMap.mapSignalClass(LogInSignal,					LogInSignalCommand);
			signalCommandMap.mapSignalClass(LogOutSignal,					LogOutSignalCommand);
			//
			
			
			//
			signalCommandMap.mapSignalClass(LoadPhrasesModelSignal,   		LoadPhrasesCommand);
			signalCommandMap.mapSignalClass(LoadHappyBirthdayModelSignal,  	LoadHappyBirthdayModelCommand);
			
			//
			commandMap.mapEvent 		(ContextEvent.STARTUP,  StartupCommand);
			commandMap.mapEvent 		(ContextEvent.SHUTDOWN, ShutdownCommand);

		}
		
		/**
		 * Map: Services
		 * 
		 * @return void
		 * 
		 */
		protected function _startupServices() : void
		{	

			injector.mapSingletonOf (ILoadService, 	PhrasesLoadService, 		"PhrasesLoadService");
			injector.mapSingletonOf (ILoadService, 	HappyBirthdayLoadService,	"HappyBirthdayLoadService");
			
		}
		
	}
}