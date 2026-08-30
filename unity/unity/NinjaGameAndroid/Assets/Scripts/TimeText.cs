using UnityEngine;
using System.Collections;

public class TimeText : MonoBehaviour {

	public GUIText timerText;

	public float timer = 0.0f;

	void Update () {
		timer += Time.deltaTime;

		timerText.text = "Time: " + timer.ToString("0.00");

		/*if (timer <= 0)
		{
			timerText.text = "";
			Time.timeScale = 0;
		}*/
	}
}
