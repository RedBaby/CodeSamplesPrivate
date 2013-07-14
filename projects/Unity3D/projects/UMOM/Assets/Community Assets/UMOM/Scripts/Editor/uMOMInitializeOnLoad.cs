/**
 * Copyright (C) 2005-2013 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
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
// Marks the right margin of code *******************************************************************


//--------------------------------------
//  Imports
//--------------------------------------
using UnityEngine;
using UnityEditor;
using System.Collections;
//--------------------------------------
//  Namespace
//--------------------------------------
namespace com.rmc.managers.umom.Editor
{
	
	//--------------------------------------
	//  Namespace Properties
	//--------------------------------------
	
	
	//--------------------------------------
	//  Class Attributes
	//--------------------------------------
		
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	[InitializeOnLoad]
	public class uMOMInitializeOnLoad 
	{
			
	
		//--------------------------------------
		//  Attributes
		//--------------------------------------
			
	
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		// GETTER / SETTER
		
		// PUBLIC
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		// PRIVATE STATIC
		
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		///<summary>
		///	Use this for initialization
		///</summary>
		void Start () 
		{
			
				
		}
		
		
		///<summary>
		///	Called once per frame
		///</summary>
		void Update () 
		{
			
			
		}
		
		// PUBLIC
		
		// PUBLIC STATIC
		/// <summary>
		/// Initializes the <see cref="uMOMInitializeOnLoad"/> class.
		/// </summary>
		static uMOMInitializeOnLoad()
		{
			//
			//Debug.Log ("uMOMInitializeOnLoad.constructor()");
			EditorApplication.playmodeStateChanged += onPlaymodeStateChanged;
			
			
		}
	
		
		// PRIVATE
		
		// PRIVATE STATIC*
		/// <summary>
		/// _ises the play mode stopping.
		/// </summary>
		/// <exception cref='System.NotImplementedException'>
		/// Is thrown when a requested operation is not implemented for a given type.
		/// </exception>
		public static bool _isThePlayModeStopping ()
		{
			
			if (EditorApplication.isPaused || EditorApplication.isPlayingOrWillChangePlaymode || EditorApplication.isCompiling) {
				return false;
			} else {
				return true;
			}
		}
		
		//--------------------------------------
		//  Events
		//--------------------------------------
		/// <summary>
		/// Ons the playmode state changed.
		/// 
		/// 	NOTE: This is called TWO times per state change (or for some stage changes, FYI)
		/// 
		/// </summary>
		public static void onPlaymodeStateChanged() 
		{ 
			if (_isThePlayModeStopping()) {
				
				//THE USER HAS ENDED PLAYMODE
				//DO ANY CLEANUP NEEDED HERE.
				
				
				//HERE IS AN OPTIONAL TEST USING MY SimpleGameManagerComponent
				//SimpleGameManagerComponent.Instance.destroy();
				
			} else {
				
				//SAFELY CREATES MANAGER (JUST ONE, EVEN IF REPEATEDLY CALLED)
				#pragma warning disable 0219
				//SUPPRESS WARNING 'assigned but its value is never used'. WE DON'T NEED TO SEE THAT.
				//MOM dummyInstance = MOM.Instance;
				#pragma warning restore 0219
				
				//FOR DEVELOPMENT ONLY - SHOW WINDOW *ALWAYS*
				//uMOMMenu.ShowEditorWindow();
			}
		}
		
	
	}
}


