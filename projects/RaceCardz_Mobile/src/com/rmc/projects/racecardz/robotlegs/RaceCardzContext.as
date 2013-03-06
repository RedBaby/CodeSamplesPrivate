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
package com.rmc.projects.racecardz.robotlegs
{
	import com.rmc.projects.racecardz.robotlegs.controller.commands.EventCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.LoadConfigurationModelCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.LoadLocationsModelCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.LoadPhrasesModelCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.LoadedConfigurationModelCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.LoadedLocationsModelCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.commands.StartupCommand;
	import com.rmc.projects.racecardz.robotlegs.controller.events.CoreEvent;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadConfigurationModelSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadLocationsModelSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadPhrasesModelSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadedConfigurationModelSignal;
	import com.rmc.projects.racecardz.robotlegs.controller.signals.LoadedLocationsModelSignal;
	import com.rmc.projects.racecardz.robotlegs.model.ConfigurationModel;
	import com.rmc.projects.racecardz.robotlegs.model.LocationsModel;
	import com.rmc.projects.racecardz.robotlegs.model.PhrasesModel;
	import com.rmc.projects.racecardz.robotlegs.service.ILoadService;
	import com.rmc.projects.racecardz.robotlegs.service.LoadConfigurationModelService;
	import com.rmc.projects.racecardz.robotlegs.service.LoadPhrasesModelService;
	import com.rmc.projects.racecardz.robotlegs.service.LoadLocationsModelService;
	import com.rmc.projects.racecardz.robotlegs.view.mediator.MainMenuScreenMediator;
	import com.rmc.projects.racecardz.robotlegs.view.mediator.RaceCardzGameMediator;
	import com.rmc.projects.racecardz.robotlegs.view.ui.MainMenuScreen;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.base.SignalCommandMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.DisplayObjectContainer;
	
	public class RaceCardzContext extends StarlingContext
	{
		
		protected var _signalCommandMap:ISignalCommandMap;
		public function get signalCommandMap():ISignalCommandMap
		{
			if (_signalCommandMap) {
				return _signalCommandMap;
			} else {
				_signalCommandMap = new SignalCommandMap(injector.createChild(injector.applicationDomain));
				return _signalCommandMap;
			}
		}
		public function set signalCommandMap(value:ISignalCommandMap):void
		{
			_signalCommandMap = value;
		}
		
		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(ISignalCommandMap, signalCommandMap);
		}
		
		
		public function RaceCardzContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//MODEL
			//	Model
			var phrasesModel 		: PhrasesModel 	= new PhrasesModel(); 	//Set default value (langcode)
			phrasesModel.langCode 					= PhrasesModel.EN;
			injector.mapValue		(PhrasesModel, phrasesModel);
			//
			injector.mapSingleton(ConfigurationModel);
			injector.mapSingleton(LocationsModel);
			
			//CONTROLLER
			commandMap.mapEvent(CoreEvent.CHANGE_SCREEN, EventCommand, CoreEvent);
			signalCommandMap.mapSignalClass(LoadPhrasesModelSignal,   			LoadPhrasesModelCommand);
			//
			signalCommandMap.mapSignalClass(LoadConfigurationModelSignal,   		LoadConfigurationModelCommand);
			signalCommandMap.mapSignalClass(LoadedConfigurationModelSignal,   	LoadedConfigurationModelCommand);
			//
			signalCommandMap.mapSignalClass(LoadLocationsModelSignal,   			LoadLocationsModelCommand);
			signalCommandMap.mapSignalClass(LoadedLocationsModelSignal,   		LoadedLocationsModelCommand);
			
			//SERVICE
			injector.mapSingletonOf(ILoadService, 	LoadLocationsModelService, 		"LoadLocationsModelService");
			injector.mapSingletonOf(ILoadService, 	LoadPhrasesModelService, 		"LoadPhrasesModelService");
			injector.mapSingletonOf(ILoadService, 	LoadConfigurationModelService, 	"LoadConfigurationModelService");
			
			//VIEW (DO THIS LAST, IT DEPENDS ON THE ABOVE)
			mediatorMap.mapView(MainMenuScreen, 	MainMenuScreenMediator);
			mediatorMap.mapView(RaceCardzGame, 	RaceCardzGameMediator);
			
			
			//...
			super.startup();
			
			commandMap.mapEvent 		(	ContextEvent.STARTUP,  StartupCommand);
			dispatchEvent			(	new ContextEvent (ContextEvent.STARTUP));
		}
	}
}