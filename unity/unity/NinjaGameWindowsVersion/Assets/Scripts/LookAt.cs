using UnityEngine;
using System.Collections;

public class LookAt : MonoBehaviour {

	public Transform target;
	public float distance = 3.0f;
	public float height = 3.0f;
	public float width = 3.0f;
	public float damping = 5.0f;

	void Update () 
	{
		Vector3 wantedPosition = target.TransformPoint (width, height, -distance);
		transform.position = Vector3.Lerp (transform.position, wantedPosition, Time.deltaTime * damping);
	}
}

