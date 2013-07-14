using UnityEngine;
using System.Collections;

public class MarioKeyboardController : MonoBehaviour {
	
	private tk2dAnimatedSprite _tk2dAnimatedSprite;
	private Vector2 _translateVelocity_vector2;
	//
	public Vector2 translateMoveAmount_vector2;
	public Vector2 translateVelocityLimitOfRunning_vector2;
	public Vector2 translateVelocityLimitOverall_vector2;
	public Vector2 translateFrictionAmount_vector2;
	
	// Use this for initialization
	void Start () {
		
		//GET
		_tk2dAnimatedSprite = GetComponent<tk2dAnimatedSprite>();
		_tk2dAnimatedSprite.animationEventDelegate = AnimationEventDelegate;
		
		
		//SPEED SETTINGS
		_translateVelocity_vector2 					= new Vector2 (0,0);
		translateMoveAmount_vector2 				= new Vector2 (.01f,0);
		translateVelocityLimitOfRunning_vector2 	= new Vector2 (0.1f,0);
		translateVelocityLimitOverall_vector2 		= new Vector2 (0.5f,0);
		translateFrictionAmount_vector2 			= new Vector2 (-.007f,0);
		//
		
	}
	
	// Update is called once per frame
	void Update () 
	{
	
		_doTakeKeys();
		_doMove();
		_doFaceForward();
		_doAnimate();
	}
	
	void _doTakeKeys() 
	{
		
		if (Input.GetKey(KeyCode.RightArrow)) {
		
			_translateVelocity_vector2.x += translateMoveAmount_vector2.x;
		
		} else if (Input.GetKey(KeyCode.LeftArrow)) {
			_translateVelocity_vector2.x -= translateMoveAmount_vector2.x;	
		}
		
	}
	
	void _doMove () 
	{
		
		//IF WE ARE NEAR 0 THEN STOP
		if (Mathf.Abs(_translateVelocity_vector2.x) < translateMoveAmount_vector2.x) {
			_translateVelocity_vector2.x = 0;
			
		} else if (_translateVelocity_vector2.x > 0) {
			_translateVelocity_vector2.x += translateFrictionAmount_vector2.x;
			
		} else if (_translateVelocity_vector2.x < 0) {
			_translateVelocity_vector2.x -= translateFrictionAmount_vector2.x;
		}
		
		//LIMIT
		_translateVelocity_vector2.x = Mathf.Clamp (_translateVelocity_vector2.x,
													-translateVelocityLimitOverall_vector2.x, translateVelocityLimitOverall_vector2.x);
		
		//MOVE
		gameObject.transform.Translate (_translateVelocity_vector2.x, 0, _translateVelocity_vector2.y);
	}
	
	void _doFaceForward() 
	{
		if (_translateVelocity_vector2.x > 0) {
			_tk2dAnimatedSprite.scale = new Vector3 (1, _tk2dAnimatedSprite.scale.y, _tk2dAnimatedSprite.scale.z);
			
		} else if (_translateVelocity_vector2.x < 0) {
			_tk2dAnimatedSprite.scale = new Vector3 (-1, _tk2dAnimatedSprite.scale.y, _tk2dAnimatedSprite.scale.z);
		}
		
	}
	
	
	
	void _doAnimate ()
	{
		if (_translateVelocity_vector2.x == 0) {
			_doAnimateClipName ("IdleRight");
		} else if (_translateVelocity_vector2.x > 0) {
			
			if (_translateVelocity_vector2.x > translateVelocityLimitOfRunning_vector2.x) {
				_doAnimateClipName("RunRight");
			} else {
				_doAnimateClipName("WalkRight");
			}
		} else if (_translateVelocity_vector2.x < 0) {
			if (_translateVelocity_vector2.x < -translateVelocityLimitOfRunning_vector2.x) {
				_doAnimateClipName("RunRight");
			} else {
				_doAnimateClipName("WalkRight");
			}
		}
	
	}
	void _doAnimateClipName (string clipName_str)
	{
		if (_tk2dAnimatedSprite != null) {
			
			if (_tk2dAnimatedSprite.CurrentClip != null) {
			
				//Debug.Log ("1: " + _tk2dAnimatedSprite.CurrentClip.name + " 2: " + clipName_str);
				if (_tk2dAnimatedSprite.CurrentClip.name != clipName_str) {
					_tk2dAnimatedSprite.Play (clipName_str);	
				}
				
			} else {
				_tk2dAnimatedSprite.Play (clipName_str);
			}
		}
	}
	
	

	void AnimationEventDelegate(tk2dAnimatedSprite sprite, tk2dSpriteAnimationClip clip, tk2dSpriteAnimationFrame frame, int frameNum)
	{
		string str = sprite.name + "\n" + clip.name + "\n" + "INFO: " + frame.eventInfo;
		Debug.Log (str);
	}
	
}

/*
 * 
 **/
/*
using UnityEngine;
using System.Collections;

[AddComponentMenu("2D Toolkit/Demo/tk2dDemoAnimController")]
public class tk2dDemoAnimController : MonoBehaviour 
{
	tk2dAnimatedSprite animSprite;
	public tk2dTextMesh popupTextMesh;
	
	// Use this for initialization
	void Start () 
	{
		animSprite = GetComponent<tk2dAnimatedSprite>();
		animSprite.animationEventDelegate = AnimationEventDelegate;

		popupTextMesh.gameObject.SetActive(false);
	}
	
	void AnimationEventDelegate(tk2dAnimatedSprite sprite, tk2dSpriteAnimationClip clip, tk2dSpriteAnimationFrame frame, int frameNum)
	{
		string str = sprite.name + "\n" + clip.name + "\n" + "INFO: " + frame.eventInfo;
		StartCoroutine( PopupText( str ) );
	}
	
	IEnumerator PopupText(string text)
	{
		popupTextMesh.text = text;
		popupTextMesh.Commit();
		

		popupTextMesh.gameObject.SetActive(true);
		
		float fadeTime = 1.0f;
		Color c1 = popupTextMesh.color, c2 = popupTextMesh.color2;
		for (float f = 0.0f; f < fadeTime; f += Time.deltaTime)
		{
			float alpha = Mathf.Clamp01( 2.0f * (1.0f - f / fadeTime) );
			c1.a = alpha;
			c2.a = alpha;
			popupTextMesh.color = c1;
			popupTextMesh.color2 = c2;
			popupTextMesh.Commit();
			yield return 0;
		}


		popupTextMesh.gameObject.SetActive(false);

	}

	void OnGUI()
	{
		GUILayout.BeginVertical();
		
		GUILayout.Label("Animation wrap modes");
		
		
		if (GUILayout.Button("Loop", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_loop");			
		}
		GUILayout.Label("  This animation will play indefinitely");
		

		if (GUILayout.Button("LoopSection", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_loopsection");
		}
		GUILayout.Label("  This animation has been set up to loop from frame 3." + "\nIt will play 0 1 2 3 4 2 3 4 2 3 4 indefinitely");

		
		if (GUILayout.Button("Once", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_once");			
		}
		GUILayout.Label("  This animation will play once and stop at the last frame");
		

		if (GUILayout.Button("Ping pong", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_pingpong");			
		}
		GUILayout.Label("  This animation will play once forward, and then reverse, repeating indefinitely");
		
		
		GUILayout.BeginHorizontal();
		if (GUILayout.Button("Single", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_single1");			
		}
		if (GUILayout.Button("Single", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_single2");			
		}
		GUILayout.EndHorizontal();
		GUILayout.Label("  Use this for non-animated states and placeholders.");
		

		GUILayout.Space(20.0f);
		GUILayout.Label("Animation delegate example");
		
		if (GUILayout.Button("Delegate", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_once");
			animSprite.animationCompleteDelegate = delegate(tk2dAnimatedSprite sprite, int clipId) 
				{ 
					animSprite.Play("demo_pingpong"); 
					animSprite.animationCompleteDelegate = null; 
				};
		}
		GUILayout.Label("Play demo_once, then immediately play demo_pingpong after that");
		
		if (GUILayout.Button("Message", GUILayout.MaxWidth(100)))
		{
			animSprite.Play("demo_message");
		}
		GUILayout.Label("Plays demo_message once, will trigger an event when frame 3 is hit.\nLook at how this animation is set up.");
		
		GUILayout.EndVertical();
	}
}
*/