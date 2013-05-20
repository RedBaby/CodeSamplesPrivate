using UnityEngine;
using System.Collections;

public class ShakeSample : MonoBehaviour {

	// Use this for initialization
	void Start () {
			iTween.ShakePosition(gameObject, new Vector3 (.1f,.1f,.1f), 10);
		iTween.ValueTo (gameObject, iTween.Hash("name","x","from",gameObject.transform.position.x, "to", "10", "time", "10","onUpdate", "fun") );
			
			
	}
	
	void fun (float f, float y) {
		
	}
}
