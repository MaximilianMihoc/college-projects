using UnityEngine;
using System.Collections;

public class Coin : MonoBehaviour {

    public GameManager gameManager;
	public GUIText coinstext;
	public int curcoins;
	public int maxCoins = 30;

	private WinText winText;

    public static bool allowShurikanes = false, allowArrows = false;

    public AudioClip coinSound;

	void Awake()
	{
		winText = GetComponent<WinText>();
	}

	void Update()
	{
		coinstext.text = "Coins: " + curcoins;

        if (curcoins >= 25)
            allowShurikanes = true;

        if (curcoins >= 40)
            allowArrows = true;

		if (curcoins >= maxCoins)
		{
			curcoins = maxCoins;
			winText.win = true;
		}
	}

	void OnTriggerEnter2D(Collider2D col)
	{
        if (col.gameObject.tag == "Coin")
        {
            Destroy(col.gameObject);
            audio.PlayOneShot(coinSound);
            curcoins++;
            GameManager.score += 250;
        }
        if (col.gameObject.tag == "SpecialCoin1")
        {
            Destroy(col.gameObject);
            audio.PlayOneShot(coinSound);
            curcoins += 5;
            GameManager.score += 500;
        }
	}
}
