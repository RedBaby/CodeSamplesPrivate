using UnityEngine;
using System.Collections;

public class SceneManager : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
		GameObject originalCube = FindObjectOfType(typeof (GameObject)) as GameObject;
		GameObject newCube;
		for (int row_int = 0; row_int < 10; row_int++) {
			for (int col_int = 0; col_int < 10; col_int++) {
				newCube = Instantiate (originalCube, new Vector3 (row_int-5, col_int-5, 1), Quaternion.identity) as GameObject;
				 newCube.transform.localScale = new Vector3 (.1f, .1f, .1f);
				iTween.MoveTo(newCube, iTween.Hash(
					"x",Random.Range(-1,1),
					"y",Random.Range(-1,1),
					"z",Random.Range(-1,1),
					"time", 1,
					"isLocal",true,
					"delay",0,
					"ease", iTween.EaseType.easeInOutQuad,
					"looptype",iTween.LoopType.pingPong
					)
				);
				/*
				iTween.ScaleTo(newCube, iTween.Hash(
					"y",Random.Range(-1,1),
					"time", 1,
					"delay",0,
					"ease", iTween.EaseType.easeInBack,
					"looptype",iTween.LoopType.pingPong
					)
				);
				 */
			}
		}
		
		originalCube.SetActive(false);
	}
	
	// Update is called once per frame
	void Update () {
	

	}
}
