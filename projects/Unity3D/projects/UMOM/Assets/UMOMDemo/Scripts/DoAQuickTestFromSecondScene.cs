using UnityEngine;
using System.Collections;
using com.rmc.managers.umom;

namespace lessonX3_MOM
{
	public class DoAQuickTestFromSecondScene : MonoBehaviour {
	
		// Use this for initialization
		void Start () 
		{
			//The core feature of this SimpleGameManagerComponent system is 
			//that if the 'SimpleGameManagerComponent' instance...
			//doesn't exist in the next THEN it is created
			//DOES exist, then it is accessed
			Debug.Log ("MOM Test1 ("+ name+") : " + UMOM.Instance);
		}
		
		// Update is called once per frame
		void Update () 
		{
		
		}
		
		public static void what ()
		{
			
		}
	}
}
