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
	
	enum ButtonClickType
	{
		ADD,
		REMOVE,
		CONVERT
		
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
			_monoScript		 				= aMonoScript;
			_inUse_scriptableobject 		= aScriptableObject;
			_managers_serializedproperty 	= aManagers_serializedproperty;
			
			//
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
						_onButtonClick(ButtonClickType.CONVERT);
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
						_onButtonClick(ButtonClickType.REMOVE);
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
						_onButtonClick(ButtonClickType.ADD);
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
			//Debug.Log ("_inUse_scriptableobject: " + _inUse_scriptableobject);
			if (_inUse_scriptableobject == null) {
				
				_scriptableTableItemType = ManagerCandidateType.MONOSCRIPT;
				/*
				bool isAUMOMCompatibleManagerMonoScript_boolean = UMOMEditorWindow.IsCompatibleManagerMonoScript(_monoScript);
				
				if (isAUMOMCompatibleManagerMonoScript_boolean) {
					_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_UNUSED;
				} else {
					throw new UnityException();
					
					//_scriptableTableItemType = ManagerCandidateType.MONOSCRIPT;
				}
				*/
				
			} else {
				
				//UMOM.Instance.doDebugLogManagers();
				bool hasManager_boolean = _hasManagerAlready(_monoScript.GetClass() );
				//
				if (hasManager_boolean) {
					
					//Debug.Log ("	hasManager_boolean yes: " + _monoScript.name);
				}
				if (hasManager_boolean) {
					_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_USED;
				} else {
					_scriptableTableItemType = ManagerCandidateType.SCRIPTABLE_UNUSED;
				}
				
			}
		}
		
		/// <summary>
		/// _hases the manager already.
		/// </summary>
		/// <returns>
		/// The manager already.
		/// </returns>
		/// <param name='aType'>
		/// If set to <c>true</c> a type.
		/// </param>
		public bool _hasManagerAlready (System.Type aType)
		{
			bool hasManagerAlready_boolean = false;
			IEnumerator iEnumerator = _managers_serializedproperty.GetEnumerator();
			//Debug.Log ("#: " + (_managers_serializedproperty.CountInProperty()));
			while (iEnumerator.MoveNext()) {
				
				if ((iEnumerator.Current as SerializedObject) != null) {
					if ((((iEnumerator.Current as SerializedProperty).objectReferenceValue).GetType() == aType)) {
						hasManagerAlready_boolean = true;
						break;
					}
				}
			}
		
			return hasManagerAlready_boolean;
		}
		
		/// <summary>
		/// _gets the index of the manager.
		/// </summary>
		/// <returns>
		/// The manager index.
		/// </returns>
		/// <param name='aType'>
		/// A type.
		/// </param>
		public int _getManagerIndex (System.Type aType)
		{
			IEnumerator iEnumerator = _managers_serializedproperty.GetEnumerator();
			int index_int = -1;
			while (iEnumerator.MoveNext()) {
				index_int++;
				if ((((iEnumerator.Current as SerializedProperty).objectReferenceValue).GetType() == aType)) {
					break;
				}
			}
		
			return index_int;
		}
		
		// PRIVATE STATIC
		
		//--------------------------------------
		//  Events
		//--------------------------------------
		/// <summary>
		/// _ons the button click.
		/// </summary>
		/// <param name='buttonClickType'>
		/// Button click type.
		/// </param>
		private void _onButtonClick (ButtonClickType buttonClickType)
		{
			IEnumerator iEnumerator = _managers_serializedproperty.GetEnumerator();
			
			while (iEnumerator.MoveNext()) {
				Debug.Log ("is : " + (iEnumerator.Current as SerializedProperty).objectReferenceValue);
			}
		
			switch (buttonClickType) {
				case ButtonClickType.ADD:
					_managers_serializedproperty.InsertArrayElementAtIndex (0);
					_managers_serializedproperty.GetArrayElementAtIndex(0).objectReferenceValue = _inUse_scriptableobject;
					break;
				case ButtonClickType.REMOVE:
				
					//
					if (_hasManagerAlready (_monoScript.GetClass() )	) {
						Debug.Log ("i: " + _getManagerIndex (_monoScript.GetClass()) );
						_managers_serializedproperty.DeleteArrayElementAtIndex ( 0);
					}
						
					break;
				case ButtonClickType.CONVERT:
				
					
					ScriptableObject scriptableObject = ScriptableObjectUtility.CreateAssetFromMonoScript (_monoScript);
					EditorWindowUtility.doSetThenUnsetProjectWindowSelectionTo(scriptableObject);
					break;
			}
			
			_managers_serializedproperty.serializedObject.ApplyModifiedProperties();
			_managers_serializedproperty.serializedObject.SetIsDifferentCacheDirty();
			_managers_serializedproperty.serializedObject.UpdateIfDirtyOrScript();
			
		}
	}
}

