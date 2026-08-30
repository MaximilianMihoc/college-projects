/*
    Attached to Main Camera 
 */
using UnityEngine;
using System.Collections;

public class MainMenu : MonoBehaviour {

    public Texture BackgroundTexture;
	public Texture ButtonTexture;

    public float guiPlaceButtonX1 = .25f;

    //public float guiPlaceButtonY1 = .25f;
    public float guiPlaceButtonY2 = .5f;
    public float guiPlaceButtonY3 = .75f;
    public float guiPlaceButtonY4 = .8f;

    void Start()
    {
        Screen.orientation = ScreenOrientation.Landscape;
    }

    void OnGUI()
    {
        //Display background texture
        GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), BackgroundTexture);

        GUIStyle customButton = new GUIStyle("button");
        customButton.fontSize = 20;
        customButton.alignment = TextAnchor.UpperCenter;

        //Display Buttons
        GUI.Box(new Rect(Screen.width * 0.7f, Screen.height * 0.07f, Screen.width * .30f, Screen.height * .5f), "Ninja Game", customButton);
		if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2, Screen.width * .2f, Screen.height * .05f),"Play Game"))
        {
            Application.LoadLevel(1);
            GameManager.playerHealth = 3;
            Time.timeScale = 1;
        }
        /*if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2, Screen.width * .2f, Screen.height * .05f), "Level 2"))
        {
            Application.LoadLevel(2);
            Time.timeScale = 1;
        }*/
        if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY3, Screen.width * .2f, Screen.height * .05f), "Options"))
        {
            Application.LoadLevel(4); 
        }

        if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY4, Screen.width * .2f, Screen.height * .05f), "Quit Game"))
        {
            Application.Quit();
        }
		GUI.enabled = true;
    }
}
