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
	public class UMOMManagerCandidate
	{
	
		//--------------------------------------
		//  Properties
		//--------------------------------------
		// GETTER / SETTER
		
		// PUBLIC
		MonoScript   		_monoScript;
		ScriptableObject  	_inUseFromAssets_scriptableobject;
		SerializedProperty 	_managersFromRAM_serializedproperty;
		ManagerCandidateType _scriptableTableItemType;
		
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		// PUBLIC
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		bool _previousGUIEnabled_boolean;
		
		// PRIVATE STATIC
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		///<summary>
		///	 Constructor
		///</summary>
		public UMOMManagerCandidate (MonoScript aMonoScript, ScriptableObject aScriptableObject, SerializedProperty aManagers_serializedproperty)
		{
			_monoScript		 				= aMonoScript;
			_inUseFromAssets_scriptableobject 		= aScriptableObject;
			_managersFromRAM_serializedproperty 	= aManagers_serializedproperty;
			
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
			skinnyToggleGUILayoutOptions[1] = GUILayout.MinWidth (50);
			skinnyToggleGUILayoutOptions[0] = GUILayout.MaxWidth (50);
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
					
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.label, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("MonoScript", tempTypeGUILayoutOptions);
					GUI.color = Color.green;
					if (GUILayout.Button ("Convert", buttonGUILayoutOptions)) {
						_onButtonClick(ButtonClickType.CONVERT);
					}
					GUI.color = default_color;
					_setGUIEnabledTo (false);
					EditorGUILayout.Toggle (false,skinnyToggleGUILayoutOptions);
				    _setGUIEnabledToPreviousValue();
					break;
				case ManagerCandidateType.SCRIPTABLE_USED:
					//
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.label, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("Used", tempTypeGUILayoutOptions);
					GUI.color = Color.red;
					if (GUILayout.Button ("Remove", buttonGUILayoutOptions)) {
						_onButtonClick(ButtonClickType.REMOVE);
					}
					GUI.color = default_color;
					_getInUseManagerFromRAM().canReceiveUpdate =  EditorGUILayout.Toggle ( _getInUseManagerFromRAM().canReceiveUpdate, skinnyToggleGUILayoutOptions);
					break;
				case ManagerCandidateType.SCRIPTABLE_UNUSED:
					//
					
					EditorGUILayout.TextArea (_monoScript.name, EditorStyles.label, textAreaGUILayoutOptions);
					//
					EditorGUILayout.TextArea ("Unused", tempTypeGUILayoutOptions);
					GUI.color = Color.yellow;
					if (GUILayout.Button ("Add", buttonGUILayoutOptions)) {
						_onButtonClick(ButtonClickType.ADD);
					}
					GUI.color = default_color;
					_setGUIEnabledTo (false);
					EditorGUILayout.Toggle (false,skinnyToggleGUILayoutOptions);
					_setGUIEnabledToPreviousValue();
					break;
				
				
			}
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
		public static UMOMManagerCandidate FromMonoScriptAsset (MonoScript aCandidate_monoscript, List<ScriptableObject> aInUseScriptableObjects, SerializedProperty aManagers_serializedproperty) 
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
			UMOMManagerCandidate managerCandidate = new UMOMManagerCandidate (aCandidate_monoscript, winningCandidate_scriptableobject, aManagers_serializedproperty);
			return managerCandidate;
			
			
		}
		
		// PRIVATE
		
		
		/// <summary>
		/// _dos the type of the set.
		/// </summary>
		private void _doSetType ()
		{
			//Debug.Log ("_inUse_scriptableobject: " + _inUse_scriptableobject);
			if (_inUseFromAssets_scriptableobject == null) {
				
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
			IEnumerator iEnumerator = _managersFromRAM_serializedproperty.GetEnumerator();
			
			//Debug.Log ("#: " + _managers_serializedproperty.arraySize);
			
			while (iEnumerator.MoveNext()) {
				
				//Debug.Log( "	e: " + (SerializedProperty)iEnumerator.Current);
				if ((SerializedProperty)iEnumerator.Current != null) {
					//Debug.Log ("has? : " + ((iEnumerator.Current as SerializedProperty).objectReferenceValue).GetType());
					if ((((iEnumerator.Current as SerializedProperty).objectReferenceValue).GetType() == aType)) {
						hasManagerAlready_boolean = true;
						break;
					}
				}
			}
			//Debug.Log ("has? : " + hasManagerAlready_boolean);
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
			IEnumerator iEnumerator = _managersFromRAM_serializedproperty.GetEnumerator();
			int index_int = -1;
			while (iEnumerator.MoveNext()) {
				index_int++;
				if ((((iEnumerator.Current as SerializedProperty).objectReferenceValue).GetType() == aType)) {
					break;
				}
			}
		
			return index_int;
		}
		
		/// <summary>
		/// _gets the in use manager from RAM.
		/// </summary>
		/// <returns>
		/// The in use manager from RAM.
		/// </returns>
		private BaseManager _getInUseManagerFromRAM () 
		{
			
			SerializedProperty serializedProperty = _managersFromRAM_serializedproperty.GetArrayElementAtIndex(_getManagerIndex (_monoScript.GetClass()));
			BaseManager baseManager = serializedProperty.objectReferenceValue as BaseManager;
			return baseManager;
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
			IEnumerator iEnumerator = _managersFromRAM_serializedproperty.GetEnumerator();
			
			while (iEnumerator.MoveNext()) {
				Debug.Log ("is : " + (iEnumerator.Current as SerializedProperty).objectReferenceValue);
			}
		
			switch (buttonClickType) {
				case ButtonClickType.ADD:
					_managersFromRAM_serializedproperty.InsertArrayElementAtIndex (0);
					_managersFromRAM_serializedproperty.GetArrayElementAtIndex(0).objectReferenceValue = _inUseFromAssets_scriptableobject;
					break;
				case ButtonClickType.REMOVE:
				
					//
					if (_hasManagerAlready (_monoScript.GetClass() )	) {
						Debug.Log ("i: " + _getManagerIndex (_monoScript.GetClass()) );
						_managersFromRAM_serializedproperty.DeleteArrayElementAtIndex ( 0);
					}
						
					break;
				case ButtonClickType.CONVERT:
				
					
					ScriptableObject scriptableObject = ScriptableObjectUtility.CreateAssetFromMonoScript (_monoScript);
					EditorWindowUtility.doSetThenUnsetProjectWindowSelectionTo(scriptableObject);
					break;
			}
			
			_managersFromRAM_serializedproperty.serializedObject.ApplyModifiedProperties();
			_managersFromRAM_serializedproperty.serializedObject.SetIsDifferentCacheDirty();
			_managersFromRAM_serializedproperty.serializedObject.UpdateIfDirtyOrScript();
			
		}
		
		/// <summary>
		/// _sets the GUI enabled to.
		/// </summary>
		/// <param name='par1'>
		/// Par1.
		/// </param>
		/// <exception cref='System.NotImplementedException'>
		/// Is thrown when a requested operation is not implemented for a given type.
		/// </exception>
		public void _setGUIEnabledTo (bool aValue_boolean)
		{
			_previousGUIEnabled_boolean = GUI.enabled;
			GUI.enabled = aValue_boolean;
		}
		
		/// <summary>
		/// _sets the GUI enabled to previous value.
		/// </summary>
		/// <exception cref='System.NotImplementedException'>
		/// Is thrown when a requested operation is not implemented for a given type.
		/// </exception>
		public void _setGUIEnabledToPreviousValue ()
		{
			GUI.enabled = _previousGUIEnabled_boolean;
		}
	}
}

