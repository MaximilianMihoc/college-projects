using UnityEngine;
using System.Collections;

public class Options : MonoBehaviour {

    public Texture BackgroundTexture;
    public float guiPlaceButtonX1 = .25f;
    public float guiPlaceButtonY1 = .25f;
    
    void OnGUI()
    {
        //Display background texture
        GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), BackgroundTexture);

        if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY1, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
        {
            Application.LoadLevel(0);
        }
    }
}
