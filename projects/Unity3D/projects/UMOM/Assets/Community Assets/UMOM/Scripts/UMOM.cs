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
using UnityEngineInternal;
using System.Collections;
using System.Collections.Generic;
using com.rmc.utilities;
using System;

//--------------------------------------
//  Namespace
//--------------------------------------
namespace com.rmc.managers.umom
{
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/// <summary>
	/// MOM = Manager of Managers. One singleton to rule them all.
	/// </summary>
	[ExecuteInEditMode()] 
	[System.Serializable]
	public class UMOM : MonoBehaviour
	{
	
		//--------------------------------------
		//  Properties
		//--------------------------------------
			
		// SETTER / GETTER
		
		/// <summary>
		/// The _is visible in hierarchy_boolean.
		/// </summary>
		/// 
		/// 	NOTE: I TRIED PRIVATE WITH SERIALIZED, ALL THAT WORKS GREAT *BUT* THE GETTER/SETTER ISN'T CALLED FROM THE EDITOR, SO GETTER/SETTER HAS LIMITED VALUE WITH THIS EDITOR-CENTRIC PROPERTY
		/// 
		[SerializeField] 
		public bool isEnabled = true;
		
		/// <summary>
		/// The _is visible in hierarchy_boolean.
		/// </summary>
		/// 
		/// 	NOTE: I TRIED PRIVATE WITH SERIALIZED, ALL THAT WORKS GREAT *BUT* THE GETTER/SETTER ISN'T CALLED FROM THE EDITOR, SO GETTER/SETTER HAS LIMITED VALUE WITH THIS EDITOR-CENTRIC PROPERTY
		/// 
		[SerializeField] 
		public bool isHiddenInHierarchy = true;
		
		// PRIVATE STATIC
		///<summary>
		///	 NAME: GameObject containing the UMOM
		///</summary>
		private static string _NAME_MOM = "_uMOM";
		
		///<summary>
		///	 NAME: GameObject containing any static children (manually placed in heirarchy)
		///</summary>
		private static string _NAME_STATIC_GAME_OBJECTS = "_StaticGameObjects";
		
		///<summary>
		///	 NAME: GameObject containing any dynamically children (dynamically placed via code)
		///</summary>
		private static string _NAME_DYNAMIC_GAME_OBJECTS = "_DynamicGameObjects";
		
				
		/// <summary>
		/// The managers list.
		/// </summary>
		[SerializeField]
		public List<BaseManager> managers = new List<BaseManager>();
			
	
	
		
		//--------------------------------------
		//  Methods
		//--------------------------------------
		
		///<summary>
		///	 Persist Instance
		///</summary>
		public void Awake() 
		{ 
			//
			DontDestroyOnLoad (this);
			
			if (_Instance == null) {
				#pragma warning disable 0219
				
				//TODO, RESPECT UMOM.Instance.IsEnabled() somewhow WITHOUT creating the instance - (static prop?)
				//UMOM dummy_mom = UMOM.Instance; //trick singleton into instantiating if it doesn't exist yet.
				#pragma warning restore 0219
			}

		}
		
		/// <summary>
		/// Raises the enable event.
		/// </summary>
		public void OnEnable() 
		{ 
			Debug.Log ("OnEnable"); //I'M SEEING INSTANCE GETTER CALLED SOMEHOW BY *THIS* METHOD
			

		}
		/// <summary>
		/// Raises the application quit event.
		/// </summary>
		public void OnApplicationQuit() 
		{ 
			// DO NOTHING, KEEP _instance ALIVE!
		}
	
		
		public void doDebugLogManagers () 
		{
			Debug.Log ("UMOM.debugManagersList() : " + managers.Count);
			foreach (BaseManager aBaseManager in managers) {
				Debug.Log ("	aBaseManager: " + aBaseManager);
			}
		}
		
		/// <summary>
		/// Update this instance.
		/// </summary>
		public void Update() 
		{ 
			//DO UMOM STUFF
			//Debug.Log("updateUMOM");
			_doUpdateHideFlagsForGameObject(gameObject);
			
			//debugManagersList();
			
			
			/*
			 * 
			 * NOTE: 	WE ARE CALLING UPDATE ON IMANAGERS DURING PLAY (GOOD) AND ALSO 
			 * 			DURING EDIT (OVERKILL?????) DUE TO 	[ExecuteInEditMode()]  ABOVE
			 * 
			 */
			//THEN DO MANAGER STUFF
			//Debug.Log ("UMOM.update() : " + _Instance.isEnabled + " #: " + _Instance.managers);
			if (_Instance && _Instance.isEnabled) {
				foreach (BaseManager aBaseManager in _Instance.managers) {
					//Debug.Log ("UMOM update() iManager.canReceiveUpdate: " + iManager.canReceiveUpdate);
					if (aBaseManager.canReceiveUpdate) {
						Debug.Log ("	UMOM calling " + aBaseManager + ".update()");
						aBaseManager.onUpdate();
					}
				}
			}
		}
		
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			CONSTRUCTOR / DESTRUCTOR
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		private int _tempRandom_float;
		///<summary>
		///	 Constructor
		///</summary>
		private UMOM ( )
		{
			System.Random r = new System.Random ();
			
			_tempRandom_float = r.Next(100);
			Debug.Log ("UMOM.constructor() " + _tempRandom_float);
												
		}
		
		public void destroy()
		{
			Debug.Log ("UMOM.destroy(): " + gameObject);
			DestroyImmediate (gameObject);	
		}
		
		
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			MANAGERS FUNCTIONALITY
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		
		/// <summary>
		/// Adds the manager.
		/// </summary>
		/// <returns>
		/// The manager.
		/// </returns>
		/// <typeparam name='T'>
		/// The 1st type parameter.
		/// </typeparam>
		public T addManager <T> () where T : BaseManager
		{
			
			//
			BaseManager found_imanager;
			
			//NOTE: LIMIT - ONLY 1 MANAGER OF EACH TYPE MAY EXIST.
			if (hasManager<T>()) {
				
				found_imanager = getManager<T>();
				
			} else {
				
				found_imanager = _addManagerByForce<T>();
				
			} 
			
			//RETURN
			return (T) found_imanager;
		}
		
		/// <summary>
		/// _adds the manager by force.
		/// </summary>
		/// <returns>
		/// The manager by force.
		/// </returns>
		/// <typeparam name='T'>
		/// The 1st type parameter.
		/// </typeparam>
		public T _addManagerByForce <T> () where T : BaseManager
		{
			
			//Debug.Log ("	_addManagerByForce: TOTAL1:    " + managers.Count + " AND " + typeof (T));
			//REMOVE IF EXISTS
			if (hasManager<T>()) {
				//Debug.Log ("	already has! " + typeof (T));
				removeManager<T>();
			} 
			
			//Debug.Log ("	_addManagerByForce: TOTAL2:    " + managers.Count + " AND " + typeof (T));
			//
			BaseManager found_imanager;
			
				
			//CREATE
			var newInstance = ScriptableObject.CreateInstance(typeof(T));
			found_imanager = (BaseManager) newInstance;
			
			//ADD
			managers.Add ((BaseManager)found_imanager);
			
			//DISPATCH TO 'ME' THAT 'I' WAS ADDED
			found_imanager.onAddManager();
			
			
			//DISPATCH TO 'ALL BUT ME?' THAT 'ANOTHER MANAGER' WAS ADDED
			foreach (BaseManager aBaseManager in _Instance.managers) {
				
				//TODO: DECIDE IF A MANAGER SHOULD GET ONRESET() WHEN ITSELF IS ADDED. FOR NOW, YES!
				//if (iManager != found_imanager) {
					aBaseManager.onReset(found_imanager);	
				//}
			}
			
			//Debug.Log ("	_addManagerByForce: TOTAL3:    " + managers.Count + " AND " + typeof (T));
			//foreach (IManager iManager in _Instance.managers) {
				//Debug.Log ("		now has : " + iManager);
			//}
			
			
			
			//RETURN
			return (T) found_imanager;
		}

	
		/// <summary>
		/// Hases the manager.
		/// </summary>
		/// <returns>
		/// The manager.
		/// </returns>
		/// <typeparam name='T'>
		/// The 1st type parameter.
		/// </typeparam>
		public bool hasManager <T> () where T : BaseManager
		{
			ScriptableObject scriptableObject = managers.Find ( man => (man.GetType() == typeof(T))	);
			BaseManager found_imanager = (BaseManager) scriptableObject;
			return (found_imanager != null);
		}
		
		/// <summary>
		/// Gets the manager.
		/// </summary>
		/// <returns>
		/// The manager.
		/// </returns>
		/// <typeparam name='T'>
		/// The 1st type parameter.
		/// </typeparam>
		public T getManager <T> () where T : BaseManager
		{
			ScriptableObject scriptableObject = managers.Find ( man => (man.GetType() == typeof(T))	);
			
			BaseManager found_imanager = (BaseManager) scriptableObject;
			return (T) found_imanager;
		}

		
		/// <summary>
		/// ReAdd all managers.
		/// </summary>
		private void _reAddAllManagersFromInspector ()
		{
			
			//COPY FROM MASTER LIST (FROM INSPECTOR)
			List <BaseManager> copyOfManagersList = new List<BaseManager>(managers);
			
			//CLEAR MASTER LIST
			managers.RemoveAll ( (abstractManager) => true); //remove 'all'
			
			//ADD FROM COPY TO MASTER LIST
			//	NOTE: THIS PROPERLY CALLS THE ADD EVENTS WITHOUT THE DELETE EVENTS
			
			
			BaseManager aBaseManager;
			for (int index_int = copyOfManagersList.Count -1; index_int >= 0 ; index_int --) {
				
				//
				aBaseManager = copyOfManagersList[index_int];
				//
				//WHY WOULD IT BE NULL? I THINK THERE IS A BLANK ADDED IN THE EDITORWINDOW, AND UNTIL WE DRAG SOMETHING THERE ITS BLANK (BLANKISH)
				if (aBaseManager != null) {
					System.Type type = aBaseManager.GetType();
					GenericsUtility.invokeGenericMethodByType (UMOM.Instance, "_addManagerByForce", type);
				}
			
			}
			
		}
		
		
		/// <summary>
		/// Gets the manager.
		/// </summary>
		/// <returns>
		/// The manager.
		/// </returns>
		/// <typeparam name='T'>
		/// The 1st type parameter.
		/// </typeparam>
		public bool removeManager <T> () where T : BaseManager
		{
			BaseManager existing_imanager = getManager<T>();
			bool wasSuccessful_boolean;
			
			if (existing_imanager == null) {
				wasSuccessful_boolean = false; //failed
				
			} else {
				
				existing_imanager.onRemoveManager();
				wasSuccessful_boolean = managers.Remove ((BaseManager)existing_imanager);
				wasSuccessful_boolean = true;
			}
			
			//
			//Debug.Log ("2remove???? " + wasSuccessful_boolean);
			return wasSuccessful_boolean;
			
		}
		
		/// <summary>
		/// Removes all managers.
		/// </summary>
		/// <returns>
		/// The all managers.
		/// </returns>
		public bool removeAllManagers ()
		{
			bool wasSuccessful_boolean = true;
			System.Type toBeDestroyed_type;
			
			for (int count_int = managers.Count -1; count_int >=0; count_int--) {
				
				BaseManager aBaseManager = managers[count_int];
				if (aBaseManager != null) {
					toBeDestroyed_type = aBaseManager.GetType();
					GenericsUtility.invokeGenericMethodByType (UMOM.Instance, "removeManager", toBeDestroyed_type);
				}
			}
			
			return wasSuccessful_boolean;
			
		}
		
		
		
		
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			HANDLE DYNAMIC INSTANTIATION (THIS IS PERMANENT CODE)
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		/// <summary>
		/// Adds the one dynamic test game objects. Put into the dynamic section of hierarchy (optional)
		/// 
		/// NOTE: In the future we'd want similiar functionality for prefabs
		/// 
		/// </summary>
		public void instantiateDynamicGameObject (string aDesiredName_str )
		{
			GameObject gameObject = new GameObject (aDesiredName_str);
			gameObject.transform.parent = _FindChildGameObjectWithName (_Instance.gameObject.name, _NAME_DYNAMIC_GAME_OBJECTS).transform;
			DontDestroyOnLoad (gameObject);
		}
	
	
		/// <summary>
		/// Removes all dynamic test game objects.
		/// </summary>
		public void removeDynamicGameObject (string aDesiredName_str)
		{
			//TODO....
			
			
		}
			
		
	
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			TEST INSTANTIATION (THIS IS DEMO ONLY CODE)
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		/// <summary>
		/// Adds the one dynamic test game objects.
		/// </summary>
		public void addOneDynamicTestGameObjects ()
		{
			instantiateDynamicGameObject ("DynamicTestGameObject");
		}
	
		/// <summary>
		/// Removes all dynamic test game objects.
		/// </summary>
		public void removeAllDynamicTestGameObjects ()
		{
			GameObject gameObject = _FindChildGameObjectWithName (_Instance.gameObject.name, _NAME_DYNAMIC_GAME_OBJECTS);
			_RemoveChildGameObjectsWithName (gameObject.name, "DynamicTestGameObject"); 
		}
			
		
	
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			HELPER FUNCTIONS 
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
			
			
		// PUBLIC STATIC
		///<summary>
		///	Find a GameObject by name within parent GameObject
		///</summary>
		private static GameObject _FindChildGameObjectWithName(string pRoot, string pName)
	    {
	        Transform pTransform = GameObject.Find(pRoot).GetComponent<Transform>();
	        foreach (Transform trs in pTransform) {
	            if (trs.gameObject.name == pName)
	                return trs.gameObject;
	        }
	       return null;
	    }
		
		///<summary>
		///	Remove a GameObject by name within parent GameObject
		///</summary>
		private static void _RemoveChildGameObjectsWithName(string pRoot, string pName)
	    {
	        Transform pTransform = GameObject.Find(pRoot).GetComponent<Transform>();
	        foreach (Transform trs in pTransform) {
	            if (trs.gameObject.name == pName) {
	                Destroy (trs.gameObject);
				}
	        }
	    }
		
		///<summary>
		///	Create a child GameObject by name but only if it doesn't already exist
		///</summary>
		private static GameObject _CreateChildGameObjectIfNotAlreadyCreated(GameObject aParent_gameobject, string desiredChildGameObjectName_string)
	    {
			GameObject child_gameobject = UMOM._FindChildGameObjectWithName (aParent_gameobject.name, desiredChildGameObjectName_string);
			if (child_gameobject == null) {
				//
				child_gameobject = new GameObject (desiredChildGameObjectName_string);
				DontDestroyOnLoad (child_gameobject);
				child_gameobject.transform.parent = aParent_gameobject.transform;
			} 
			return child_gameobject;
		}
		
	
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		///			SINGLETON SETUP
		///////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////
		
		///<summary>
		///	 Instance SETTER/GETTER
		///</summary>
		private static UMOM _Instance;
		public static UMOM Instance 
		{
			get 
			{
				
				//IF THERE IS NOT ALREADY AN INSTANCE CREATED
				if (_Instance == null) {
					
					//1. CREATE A GAME OBJECT (IF MISSING)
					GameObject UMOM_gameobject =  GameObject.Find (UMOM._NAME_MOM);
					if (UMOM_gameobject == null) {
						UMOM_gameobject = new GameObject (UMOM._NAME_MOM);
					
					}
					
					//3. CREATE A COMPONENT ON THE GAME OBJECT
					_Instance = UMOM_gameobject.GetComponent<UMOM>();
					if (_Instance == null) {
						_Instance = UMOM_gameobject.AddComponent<UMOM>(); 
									
						
					}
					


					//5. TEMPORARY***** ADD MANAGERS (SHOULD BE DONE FROM OUTSIDE)
					_Instance._reAddAllManagersFromInspector();
						
					
					//6. INITIALIZE A FEW CHILDREN TO ACT LIKE FOLDERS FOR FUTURE GO'S
					UMOM._CreateChildGameObjectIfNotAlreadyCreated(_Instance.gameObject, UMOM._NAME_DYNAMIC_GAME_OBJECTS);
					UMOM._CreateChildGameObjectIfNotAlreadyCreated(_Instance.gameObject, UMOM._NAME_STATIC_GAME_OBJECTS);
					
					
					
				} 

				
									
				//4. ADD FLAGS TO HIDE EVERYTHING FROM HIERARCHY (OPTIONAL)
				_doUpdateHideFlagsForGameObject(_Instance.gameObject);
					
				
				return _Instance;
			}
		}
		
		/// <summary>
		/// _dos the update hide flags for game object.
		/// </summary>
		/// <param name='aGameObject'>
		/// A game object.
		/// </param>
		private static void _doUpdateHideFlagsForGameObject(GameObject aGameObject)
		{
			//Debug.Log ("VISIBLE: " + _Instance.isVisibleInHierarchy);
			if (_Instance && _Instance.isHiddenInHierarchy) {
				
				// | IS WITH
				aGameObject.hideFlags = 0;
				aGameObject.hideFlags |= HideFlags.HideInHierarchy;
			} else {
				
				// ^ IS WITHOUT
				aGameObject.hideFlags = 0;
			}
			
						
			//TODO: COMMENT-IN THIS LINE TO DISABLE 100% OF THE TIME
			//aGameObject.hideFlags |= HideFlags.HideInInspector;
			
			
			
			//show
			//Debug.Log ("aGameObject.hideFlags: " + aGameObject.hideFlags);
		}
		
		
		
		/// <summary>
		///  debug log game object count.
		/// </summary>
		private static void _DebugLogGameObjectCount()
		{
			GameObject[] allGameobjects = GameObject.FindObjectsOfType(typeof(GameObject)) as GameObject[]; Debug.Log("COUNT: " + allGameobjects.Length);
					
		}
		
	
		// PRIVATE
		
		// PRIVATE STATIC
		
		// PRIVATE COROUTINE
		
		// PRIVATE INVOKE
		
		//--------------------------------------
		//  Events
		//--------------------------------------
		/// <summary>
		/// Raises the destroy event.
		/// </summary>
		void OnDestroy() {
			//I DON'T EXPECT IN TYPICAL USE, BECAUSE THE UMOM SHOULD PERSIST FOREVER, RIGHT? (WHAT ABOUT WHEN UMOM.ENABLED= FALSE?)
			removeAllManagers();
												
			//
			Debug.LogStackTrace();
    		Debug.Log("	UMOM.OnDestroy() " + _tempRandom_float);
		}
		
		
		void OnDrawGizmos() 
		{
			
        	Gizmos.DrawIcon ( _Instance.transform.position, "UMOMGizmoIcon", true);
			
    	}
	}
}

