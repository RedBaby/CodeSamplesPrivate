using UnityEngine;
using System.Collections;

public class CubeScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		float x_float = Mathf.Sin (Time.time)*8;
		float z_float = Mathf.Cos (Time.time)*8;
		
		
		transform.position = new Vector3 (x_float,1, z_float);
		
	}
}
