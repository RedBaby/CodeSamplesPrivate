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
using UnityEngine;
using UnityEditor;
using System.Reflection;
using System.Linq;
using com.rmc.managers.umom;
using System.Collections.Generic;

//--------------------------------------
//  Namespace
//--------------------------------------
namespace com.rmc.utilities
{
	
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/// <summary>
	/// Generics Utility
	/// </summary>
	public class EditorWindowUtility
	{
	
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		// PUBLIC
		
		// PUBLIC STATIC
		
		// PRIVATE
		
		// PRIVATE STATIC
	
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		
		// PUBLIC
		
		// PUBLIC STATIC
		/// <summary>
		/// Sets the editor window tab icon.
		/// </summary>
		/// <param name='cachedTitleContent'>
		/// Cached title content.
		/// </param>
		/// <param name='tabIcon_texture2D'>
		/// Tab icon_texture2 d.
		/// </param>
		public static void SetEditorWindowTabIcon (EditorWindow editorWindow, Texture2D tabIcon_texture2D)
		{
	 		
			//TODO, MOVE THIS TO A PROPERTY SO WE DON'T CALL 'GETPROPERTY' MORE THAN NEEDED (JUST ONCE?)
			PropertyInfo cachedTitleContent;
			
			
			
			
	        //if (cachedTitleContent == null) {
	
	            cachedTitleContent = typeof(EditorWindow).GetProperty("cachedTitleContent", BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.GetField);
	
	        //}
	
	        if (cachedTitleContent != null) {
	
	            GUIContent titleContent = cachedTitleContent.GetValue(editorWindow, null) as GUIContent;
	
	            if (titleContent != null) {
	
	                titleContent.image = tabIcon_texture2D;
	                //titleContent.text = "Super Cool3"; // <= here goes the title of your window
	
	            }
	
	        }
			
		}
		
		/// <summary>
		/// Debugs the log all properties for serialized property.
		/// </summary>
		/// <param name='aSerializedObject'>
		/// A serializedproperty.
		/// </param>
		public static void DebugLogAllPropertiesForSerializedProperty (SerializedObject aSerializedObject)
		{
			Debug.Log ("EditorWindowUtility.DebugLogAllPropertiesForSerializedProperty()");
			var property = aSerializedObject.GetIterator();
			var first = true;
			while(property.NextVisible(first))
			{
			     first = false;
			     Debug.Log("	" + property.name + " = " + property);
			}
		}
		
		
		//*********************************************************************
		//*********************************************************************
		//**	PROJECT WINDOW UTILITIES
		//*********************************************************************
		//*********************************************************************
		
		
		
		/// <summary>
		/// Gets the type of the all project window items subclass of.
		/// </summary>
		/// <returns>
		/// The all project window items subclass of type.
		/// </returns>
		/// <param name='aType'>
		/// A type.
		/// </param>
		public static Object[] GetAllProjectWindowItemsSubclassOfType (System.Type aType)
		{
			Object[] objects_array = Object.FindObjectsOfTypeIncludingAssets(aType).Where ( (aItem) => (aItem.GetType().IsSubclassOf (aType) )).ToArray();
			return objects_array;
			
		}
		
		
		/// <summary>
		/// Dos the set then unset project window selection to.
		/// 
		/// NOTE: Set a new scriptable temporarily to 'load it into memory'
		/// 
		/// </summary>
		/// <param name='scriptableObject'>
		/// Scriptable object.
		/// </param>
		public static void doSetThenUnsetProjectWindowSelectionTo (Object scriptableObject)
		{
			Object[] currentlySelectedObjects_array = Selection.objects;
			Selection.activeObject 	= scriptableObject;
			Selection.objects 		= currentlySelectedObjects_array;
		}
		
		/// <summary>
		/// Gets all project window items interface of.
		/// </summary>
		/// <returns>
		/// The all project window items interface of.
		/// </returns>
		/// <param name='aType'>
		/// A type.
		/// </param>
		public static Object[] GetAllProjectWindowItemsByInterface (System.Type aType)
		{
			System.Type classType = typeof (Object);
			System.Type interfaceType = aType;
			Object[] objects_array = Object.FindObjectsOfTypeIncludingAssets(classType).Where ( (aItem) => (aItem.GetType().GetInterface(interfaceType.Name) == (interfaceType) )).ToArray();
			return objects_array;
			
		}
		
		
		/// <summary>
		/// Gets all asset mono scripts by super class and interface.
		/// </summary>
		/// <returns>
		/// The all asset mono scripts by super class and interface.
		/// </returns>
		/// <param name='aSuperClassType'>
		/// A super class type.
		/// </param>
		public static MonoScript[] GetAllAssetMonoScriptsBySuperClassAndInterface (System.Type aSuperClassType)
		{
			
			//
			aSuperClassType = typeof (BaseManager);
			//
			
			MonoScript[] allMonoScripts = (MonoScript[])Object.FindObjectsOfTypeIncludingAssets( typeof( MonoScript ) );
			List<MonoScript> validMonoScripts = new List<MonoScript>();
			 
			foreach( MonoScript monoScript in allMonoScripts )	{
				if( monoScript.GetClass() != null && 
					monoScript.GetClass().IsClass == true && 
					monoScript.GetClass().IsSubclassOf (aSuperClassType) == true ) {
					//
					validMonoScripts.Add (monoScript);
				}
			}
			return validMonoScripts.ToArray();
			
		}
			
			
		/// <summary>
		/// Gets the type of the all project window items by interface and is subclass of.
		/// </summary>
		/// <returns>
		/// The all project window items by interface and is subclass of type.
		/// </returns>
		/// <param name='aInterfaceType'>
		/// A interface type.
		/// </param>
		/// <param name='aSuperClassType'>
		/// A super class type.
		/// </param>
		public static Object[] GetAllObjectsBySuperClassAndInterface (System.Type aSuperClassType)
		{
			//SOME HACK I FOUND ONLINE SO 'FIND' WORKS
			//** THIS IS INDEED NEEDED!!! IT MAKES 'FIND' RETURN ALL, AND NOT JUST THE ONES I HAD CLICKED OR USED**
			//TODO: PERHAPS CACHE THIS CALL INSTEAD OF CALLING IT SO MUCH, IS IT CAUSING SLOWDOWN NOW?
			
			//
			Object[] objects_array = Object.FindObjectsOfTypeIncludingAssets(aSuperClassType).Where 
				( 
					(aItem) => 
						(
							aItem.GetType().IsSubclassOf(aSuperClassType) == true  &&
							(aItem.GetType().Equals (aSuperClassType) == false) &&
							aItem.GetType().IsClass == true
						) 
				).ToArray();
			return objects_array;
			
		}
		
		//private static bool loadedAll_boolean = false;
		
		/// <summary>
		/// Loads the type of the all assets of.
		/// 
		/// NOTE: Seems either to NOT work or to CRASH unity.app, depending on how I implement it
		/// 
		/// </summary>
		/// <param name='aSuperClassType'>
		/// A super class type.
		/// </param>
		public static void LoadAllAssetsOfType (System.Type aSuperClassType)
		{
			
			/*
			Object[] objects =  EditorWindowUtility.GetAllObjectsBySuperClassAndInterface (	typeof (BaseManager), typeof (IManager)	);
			
			//Debug.Log ("ALL SCRIPTABLES (LESS) " + scriptableObjectsOfBaseManager.Count);
			foreach (Object scriptableObject in objects) {
				
				Debug.Log ("	so: " + scriptableObject);
				//EditorWindowUtility.doSetThenUnsetProjectWindowSelectionTo (scriptableObject);
				
			}
			*/		
			Selection.objects = EditorWindowUtility.GetAllObjectsBySuperClassAndInterface (	typeof (BaseManager));
			
			/*
			if (!loadedAll_boolean) {
				loadedAll_boolean = true;
				
				string[] paths = AssetDatabase.GetAllAssetPaths();
			    foreach( string path_string in paths )
			    {
					//Debug.Log ("path: " + path_string);
					
					//WORKS
					
					AssetDatabase.LoadAllAssetRepresentationsAtPath (path_string);
					
					
			        //Object o = AssetDatabase.LoadAssetAtPath( path_string, typeof (Component) );
			        //if( o != null )
			        //{
			        //    Debug.Log( "Found Object of type " + o.name );
			       // }
			    }
				
			}
			*/
		}
		
		
		
		//*********************************************************************
		//*********************************************************************
		//**	HIERARCHY WINDOW UTILITIES
		//*********************************************************************
		//*********************************************************************
		/// <summary>
		/// Gets all hierarchy components by super class and interface.
		/// </summary>
		/// <returns>
		/// The all hierarchy components by super class and interface.
		/// </returns>
		/// <param name='aSuperClassType'>
		/// A super class type.
		/// </param>
		/// <param name='aInterfaceType'>
		/// A interface type.
		/// </param>
		public static Object[] GetAllHierarchyComponentsBySuperClassAndInterface (System.Type aSuperClassType, System.Type aInterfaceType)
		{
			Object[] foundGameObjects_array = GameObject.FindObjectsOfType (typeof (GameObject));
			/*
			//NOT WORKING YET, NOT NEEDED EITHER
			aSuperClassType = typeof (AudioListener);
		    
			//
			Component[] someComponents;
			List<Component> allComponents;
			foreach (GameObject gameObject in foundGameObjects_array) {
				
				someComponents = gameObject.GetComponentsInChildren ( aSuperClassType);
				foreach (Component component in someComponents) {
					Debug.Log ("Component: " + component);
					allComponents.Add(component);
				}
				
			}
			//
			*/
			return foundGameObjects_array;
		}
		
		
		
		
		// PRIVATE
		
		// PRIVATE STATIC
		
		//--------------------------------------
		//  Events
		//--------------------------------------
	}
}

