using UnityEngine;
using System.Collections;

public class WinText : MonoBehaviour {

    public GameManager gameManager;

	//public GUIText winText;
	public bool win = false;
    public bool lost = false;
    public bool pause = false;

	private Coin coins;

    public float guiPlaceButtonX1 = .7f;
    public float guiPlaceMenuX = .25f;

    public float guiPlaceMenuY = .25f;
    public float guiPlaceButtonY2 = .5f;
    public float guiPlaceButtonY3 = .75f;
    public float guiPlaceButtonY4 = .80f;

    static int LevelNo = 1;
	
	void Awake()
	{
		coins = GetComponent<Coin>(); 
	}

    void Update()
    {
        if (LevelNo > 3)
            LevelNo = 0;
        if (Input.GetKeyDown(KeyCode.P))
        { 
            pause = true;
            Time.timeScale = 0;
        }
    }

	void OnGUI () 
	{
        GUIStyle customButton = new GUIStyle("button");
        customButton.fontSize = 40;
        if (win)
        {
            GUI.Box(new Rect(Screen.width * guiPlaceMenuX, Screen.height * guiPlaceMenuY, Screen.width * .3f, Screen.height * .7f), "Nice Job", customButton);
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2, Screen.width * .2f, Screen.height * .05f), "Restart"))
                RestartScene();
            if (LevelNo <= 3)
            {
                if (GUI.Button(new Rect(Screen.width * (guiPlaceButtonX1 + 0.1f), Screen.height * guiPlaceButtonY3, Screen.width * .1f, Screen.height * .05f), "Next"))
                {
                    LevelNo++;
                    Application.LoadLevel(LevelNo);
                    Time.timeScale = 1;
                }
            }
            if (LevelNo > 1)
            {
                if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY3, Screen.width * .1f, Screen.height * .05f), "Previous"))
                {
                    LevelNo--;
                    Application.LoadLevel(LevelNo);
                    Time.timeScale = 1;
                }
            }
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY4, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
                Application.LoadLevel("MainMenu");
        }

        if (lost)
        {
            
            GUI.Box(new Rect(Screen.width * guiPlaceMenuX, Screen.height * guiPlaceMenuY, Screen.width * .3f, Screen.height * .7f), "GAME OVER", customButton);
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2, Screen.width * .2f, Screen.height * .05f), "Restart"))
            {
                RestartScene();
            }
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY3, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
                Application.LoadLevel("MainMenu");
        }

        if (pause)
        {
            GUI.Box(new Rect(Screen.width * guiPlaceMenuX, Screen.height * guiPlaceMenuY, Screen.width * .3f, Screen.height * .7f), "PAUSE", customButton);

            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2 - 30, Screen.width * .2f, Screen.height * .05f), "Continue"))
            {
                Time.timeScale = 1;
                pause = false;
            }
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY2, Screen.width * .2f, Screen.height * .05f), "Restart"))
            {
                RestartScene();
            }
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY3, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
                Application.LoadLevel("MainMenu");
        }
	}

	void RestartScene()
	{
		coins.curcoins = 0;
        GameManager.score = 0;
        GameManager.playerHealth = 3;
		Time.timeScale = 1;
		Application.LoadLevel (Application.loadedLevel);
	}
}
