using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {

	
    public Texture playerLifeTexture;
    public Texture playerHead;

    
    public float screenPositionX;
    public float screenPositionY;

    
    public int iconSizeX = 25;
    public int iconSizeY = 25;

    
    public static int playerHealth = 3;

    private WinText winText;
    private Coin coins;
    public GameObject player;

    public GUIText scoreText;
    public static ulong score = 0;

    bool restart = false;

    void Awake()
    {
        winText = player.GetComponent<WinText>();
        coins = player.GetComponent<Coin>();
    }

    void Update()
    {
        scoreText.text = "Score: " + score;
    }

    void OnGUI()
    {
        GUIStyle customButton = new GUIStyle("button");
        customButton.fontSize = 20;
        customButton.alignment = TextAnchor.UpperCenter;

        //Control Player Healt Texture
        GUI.DrawTexture(new Rect(screenPositionX - 50, screenPositionY, iconSizeX + 10, iconSizeY + 10), playerHead, ScaleMode.ScaleToFit, true, 0);
        for(int h = 0; h < playerHealth; h++)
        {
            GUI.DrawTexture(new Rect(screenPositionX + (h * iconSizeX), screenPositionY, iconSizeX, iconSizeY),playerLifeTexture,ScaleMode.ScaleToFit,true,0);
        }

        //restart game if player lost only one life
        if (restart)
        {
            
            GUI.Box(new Rect(Screen.width * 0.3f, Screen.height * 0.2f, Screen.width * .4f, Screen.height * .7f), "One life Lost", customButton);
            if (GUI.Button(new Rect(Screen.width * 0.4f, Screen.height * 0.4f, Screen.width * .2f, Screen.height * .05f), "Continue"))
                RestartScene();
            if (GUI.Button(new Rect(Screen.width * 0.4f, Screen.height * 0.5f, Screen.width * .2f, Screen.height * .05f), "Restart"))
                RestartLevel();
            if (GUI.Button(new Rect(Screen.width * 0.4f, Screen.height * 0.6f, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
                Application.LoadLevel("MainMenu");
        }
    }

    public void PlayerDamage(int damage)
    {
        if (playerHealth > 0)
        {
            playerHealth = playerHealth - damage;
            Time.timeScale = 0;
            restart = true;
        }

        if (playerHealth <= 0)
        {
            playerHealth = 0;
            Time.timeScale = 0;
            winText.lost = true;
            restart = false;
        }
        
    }

    void RestartScene()
    {
        Time.timeScale = 1;
        restart = false;
        
        player.transform.position = new Vector3(-3, 0, 0);
        
    }

    void RestartLevel()
    {
        
        score = 0;
        playerHealth = 3;
        coins.curcoins = 0;
        Time.timeScale = 1;
        Application.LoadLevel(Application.loadedLevel);
    }
}
