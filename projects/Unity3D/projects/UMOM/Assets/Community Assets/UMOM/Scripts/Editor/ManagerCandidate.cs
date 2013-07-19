/**
 * Copyright (C) 2005-2013 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furn
 * 
 * ished to do so, subject to
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
using UnityEditor;
using UnityEngine;
using System.Collections;
using com.rmc.utilities;
using System.Collections.Generic;

//--------------------------------------
//  Namespace
//--------------------------------------
namespace com.rmc.managers.umom.Editor
{
	
	enum ManagerCandidateType
	{
		MONOSCRIPT,
		SCRIPTABLE_UNUSED,
		SCRIPTABLE_USED
		
	}
	//--------------------------------------
	//  Class
	//--------------------------------------
	/// <summary>
	/// Test event.
	/// </summary>
	[System.Serializable]
	public class ManagerCandidate
	{
	
		//--------------------------------------
		//  Properties
		//--------------------------------------
		// GETTER / SETTER
		
		// PUBLIC
		MonoScript   		_monoScript;
		ScriptableObject  	_inUse_scriptableobject;
		SerializedProperty 	_managers_serializedproperty;
		ManagerCandidateType _scriptableTableItemType;
		
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		// PUBLIC
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		// PRIVATE STATIC
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		///<summary>
		///	 Constructor
		///</summary>
		public ManagerCandidate (MonoScript aMonoScript, ScriptableObject aScriptableObject, SerializedProperty aManagers_serializedproperty)
		{
			_monoScript		 			= aMonoScript;
			_inUse_scriptableobject 	= aScriptableObject;
			_managers_serializedproperty = aManagers_serializedproperty;
			
			_doSetType();
			
		}
		
		/// <summary>
		/// Deconstructor
		/// </summary>
		//~ManagerCandidate ( )
		//{
			//Debug.Log ("ManagerCandidate.deconstructor()");
			
		//}
		
		/// <summary>
		/// Dos the layout GU.
		/// </summary>
		public void doLayoutGUI ()
		{

			
			//OPTIONS
			GUILayoutOption[] skinnyToggleGUILayoutOptions = new GUILayoutOption[2];
			skinnyToggleGUILayoutOptions[1] = GUILayout.MinWidth (20);
			skinnyToggleGUILayoutOptions[0] = GUILayout.MaxWidth (20);
			//
			GUILayoutOption[] textAreaGUILayoutOptions = new GUILayoutOption[2];
			textAreaGUILayoutOptions[1] = GUILayout.MinWidth (250);
			textAreaGUILayoutOptions[0] = GUILayout.MaxWidth (250);
			
			//
			GUILayoutOption[] tempTypeGUILayoutOptions = new GUILayoutOption[2];
			tempTypeGUILayoutOptions[1] = GUILayout.MinWidth (100);
			tempTypeGUILayoutOptions[0] = GUILayout.MaxWidth (100);
			//
			//
			GUILayoutOption[] buttonGUILayoutOptions = new GUILayoutOption[2];
			buttonGUILayoutOptions[1] = GUILayout.MinWidth (80);
			buttonGUILayoutOptions[0] = GUILayout.MaxWidth (80);
			//
			
			
			///
			EditorGUILayout.BeginHorizontal();
			//EditorGUILayout.Space();
			
			Color default_color = GUI.color;
			
			//EditorGUILayout.ObjectField (scriptableObject, typeof (ScriptableObject));
			switch (_scriptableTableItemType) {
				case ManagerCandidateType.MONOSCRIPT:
					//
					GUI.color = Color.green;
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.whiteLabel, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("MonoScript", tempTypeGUILayoutOptions);
					if (GUILayout.Button ("Convert", buttonGUILayoutOptions)) {
						Debug.Log ("Converting... " + _monoScript.name);
						ScriptableObjectUtility.CreateAssetFromMonoScript (_monoScript);
					}
					GUI.enabled = false;
					EditorGUILayout.Toggle (false,skinnyToggleGUILayoutOptions);
					GUI.enabled = true;
					break;
				case ManagerCandidateType.SCRIPTABLE_USED:
					//
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.whiteLabel, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("Used", tempTypeGUILayoutOptions);
					if (GUILayout.Button ("Remove", buttonGUILayoutOptions)) {
						Debug.Log ("Remove... " + _monoScript.GetClass());
						//GenericsUtility.invokeGenericMethodByType (UMOM.Instance, "removeManager", typeof (CustomManager)); 
						UMOM.Instance.removeManager<CustomManager>();
					}
					GUI.enabled = true;
					EditorGUILayout.Toggle (false,skinnyToggleGUILayoutOptions);
					GUI.enabled = true;
					break;
				case ManagerCandidateType.SCRIPTABLE_UNUSED:
					//
					GUI.color = Color.yellow;
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.whiteLabel, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("Unused", tempTypeGUILayoutOptions);
					if (GUILayout.Button ("Add", buttonGUILayoutOptions)) {
						Debug.Log ("add1 : " +  _monoScript.GetClass()	);
						GenericsUtility.invokeGenericMethodByType (UMOM.Instance, "addManager", _monoScript.GetClass()); 
						Debug.Log ("add2 : " +  _monoScript.GetClass()	);
					
						//TODO, CHECK IF THIS IS NEEDED to refresh ui after an 'add'????
						UMOMEditorWindow.Refresh();
					
					}
					GUI.enabled = false;
					EditorGUILayout.Toggle (false,skinnyToggleGUILayoutOptions);
					GUI.enabled = true;
					break;
				
				
			}
			GUI.color = default_color;
			EditorGUILayout.Space();
			EditorGUILayout.EndHorizontal();
		}
		
		//PRIVATE
		
		
		// PUBLIC STATIC
		/// <summary>
		/// Froms the mono script asset.
		/// </summary>
		/// <returns>
		/// The mono script asset.
		/// </returns>
		/// <param name='aCandidate_monoscript'>
		/// A mono script.
		/// </param>
		/// <param name='aInUseScriptableObjects'>
		/// A scriptable objects.
		/// </param>
		/// <param name='aManagers_serializedproperty'>
		/// A managers_serializedproperty.
		/// </param>
		public static ManagerCandidate FromMonoScriptAsset (MonoScript aCandidate_monoscript, List<ScriptableObject> aInUseScriptableObjects, SerializedProperty aManagers_serializedproperty) 
		{
			
			MonoScript monoScriptMatchingCandidate;
			ScriptableObject winningCandidate_scriptableobject = null;
			//FIND THE SCRIPTABLE OBJECT THAT MATCHES THE MONOSCRIPT
			foreach (ScriptableObject scriptableObject in aInUseScriptableObjects) {
				monoScriptMatchingCandidate  = MonoScript.FromScriptableObject (scriptableObject);
				if (monoScriptMatchingCandidate.GetClass().FullName == aCandidate_monoscript.GetClass().FullName) {
					//Debug.Log ("	s: " + monoScriptMatchingCandidate.GetClass().FullName );
					winningCandidate_scriptableobject = scriptableObject;
					break;
				}
			}
			//Debug.Log (" SO : " + winningCandidate_scriptableobject);
			ManagerCandidate managerCandidate = new ManagerCandidate (aCandidate_monoscript, winningCandidate_scriptableobject, aManagers_serializedproperty);
			return managerCandidate;
			
			
		}
		
		// PRIVATE
		
		
		/// <summary>
		/// _dos the type of the set.
		/// </summary>
		private void _doSetType ()
		{
			if (_inUse_scriptableobject == null) {
				
				bool isAUMOMCompatibleManagerMonoScript_boolean = UMOMEditorWindow.IsCompatibleManagerMonoScript(_monoScript);
				
				if (isAUMOMCompatibleManagerMonoScript_boolean) {
					_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_UNUSED;
				} else {
					_scriptableTableItemType = ManagerCandidateType.MONOSCRIPT;
				}
				
			} else {
				
				IEnumerator iEnumerator =  _managers_serializedproperty.GetEnumerator();
				
				bool isFound_boolean = false;
				IManager iManager;
				while (iEnumerator.MoveNext()) {
					
					iManager = ((iEnumerator.Current as SerializedProperty).objectReferenceValue as IManager);
					//
					if ( iManager.Equals(_inUse_scriptableobject)) {
						isFound_boolean = true;
						break;
					} else {
						
						//Debug.Log ("iEnumerator.Current: " + iManager);
					}
				}
				
				//Debug.Log ("is : " + scriptableObject.GetType() + " =? " +  typeof (BaseManager));
				if (_inUse_scriptableobject.GetType() == typeof (BaseManager)) {
					_scriptableTableItemType = ManagerCandidateType.MONOSCRIPT;
	
				} else {
					
					if (isFound_boolean) {
						_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_USED;
					} else {
						_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_UNUSED;
					}
				}
				
			}
		}
		
		// PRIVATE STATIC
		
		//--------------------------------------
		//  Events
		//--------------------------------------
	}
}

