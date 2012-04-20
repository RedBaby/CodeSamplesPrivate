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
package com.chattrspace.projects.mobilesingle.mvcs.view
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.chattrspace.projects.mobilesingle.managers.AssetManager;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.ClearSelectedLanguageSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.ViewNavigatorPopViewSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.controller.signals.flexmobile.ViewNavigatorPushViewSignal;
	import com.chattrspace.projects.mobilesingle.mvcs.model.HappyBirthdayModel;
	import com.chattrspace.projects.mobilesingle.mvcs.model.events.PhrasesModelEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.model.events.ViewNavigatorEvent;
	import com.chattrspace.projects.mobilesingle.mvcs.model.vo.SongVO;
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.views.SongViewUI;
	import com.chattrspace.projects.mobilesingle.mvcs.view.components.views.WebViewUI;
	import com.chattrspace.projects.mobilesingle.utils.SongLyricsFilter;
	import com.chattrspace.utils.CSSUtility;
	import com.chattrspace.utils.DensityUtil;
	
	import flash.events.MouseEvent;
	import flash.media.StageWebView;
	import flash.system.Capabilities;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.utilities.variance.base.IVariantMediatorMap;
	
	import spark.components.supportClasses.StyleableTextField;
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Mediator</code> managing the I/O to the UI: MainUI</p>
	 * 
	 */
	public class WebViewUIMediator extends AbstractViewMediator
	{
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC
		/**
		 * Reference to the UI being mediated
		 * 
		 */	
		[Inject]
		public var webViewUI : WebViewUI;
		
		/**
		 * Signal: Change the View
		 * 
		 */
		[Inject]
		public var viewNavigatorPopViewSignal : ViewNavigatorPopViewSignal;
		
		/**
		 * Reference: <code>HappyBirthdayModel</code>
		 * 
		 */	
		[Inject]
		public var happyBirthdayModel : HappyBirthdayModel;
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function WebViewUIMediator()
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
			//  Super
			super.onRegister()
			
			// 	View Listeners
			webViewUI.backButtonClick.add  (_onBackButtonClick);	
			webViewUI.phrasesVOChanged.add(_onPhrasesVOChanged);
			
			//	Context Listeners
			happyBirthdayModel.currentSongChangedSignal.add (_onCurrentSongChanged);
			
			//	Clear Layout
			happyBirthdayModel.loadCurrentSongFromSelectedLanguage ();
			
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
			
			//THE UI IS REMOVED FOR US, ANY OTHER CLEANUP TO DO?
			
			// 	View Listeners
			webViewUI.backButtonClick.remove (_onBackButtonClick);
			webViewUI.phrasesVOChanged.remove(_onPhrasesVOChanged);
			
			//	Context Listeners
			happyBirthdayModel.currentSongChangedSignal.remove (_onCurrentSongChanged);
			
		}
		
		
		//VIEW
		/**
		 * Handles the aEvent: <code>MouseEvent.CLICK</code>.
		 * 
		 * @param aEvent <code>MouseEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onBackButtonClick (aEvent : MouseEvent):void
		{
			
			viewNavigatorPopViewSignal.dispatch(new ViewNavigatorEvent (ViewNavigatorEvent.POP_VIEW, null, AssetManager.getViewTransition(ViewNavigatorEvent.POP_VIEW) ) );
		}
		
		/**
		 * Handles the Signal: <code>PhrasesVOChanged</code>.
		 * 
		 * @return void
		 * 
		 */
		protected function _onPhrasesVOChanged ():void
		{
			_doShowSong();
		}
		
		//CONTEXT
		/**
		 * Handles the Signal: <code>ChangedMessageModelSignal</code>.
		 * 
		 * @param String <code>aMessage</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onCurrentSongChanged (aSongVO : SongVO):void
		{
			_doShowSong();
			
		}
		
		/**
		 * Wait for both PhrasesModel and HappyBirthdayModel to 
		 * send data (both are fast but the order is uknown)
		 * 
		 */
		private function _doShowSong () : void
		{
			//WAIT FOR BOTH TO BE READY
			if (webViewUI.phrasesVO != null && happyBirthdayModel.currentSong != null && happyBirthdayModel.selectedLanguage != null) {
				
				//UPDATE TITLE
				webViewUI.title = happyBirthdayModel.selectedLanguage.title; //+ songViewUI.phrasesVO.songViewTitle_str;
				
				if (StageWebView.isSupported == true) {
					webViewUI.webView.load(happyBirthdayModel.currentSong.wikipediaURL);
				}
			}
			
		}
		
		
		
	}
}