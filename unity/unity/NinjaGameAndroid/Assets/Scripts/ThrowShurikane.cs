using UnityEngine;
using System.Collections;

public class ThrowShurikane : MonoBehaviour {

    public Rigidbody2D shurikane;
    public Transform player;

    private CharacterControllerScript caracterRight;
    public AudioClip ShurikaneSound;

    void Awake()
    {
        caracterRight = GetComponent<CharacterControllerScript>();
    }

	void Update ()
    {
        /*if (Input.GetButtonDown("Fire1") && Coin.allowShurikanes)
        {
            Rigidbody2D shurikanetInstance;
            shurikanetInstance = Instantiate(shurikane, player.position, player.rotation) as Rigidbody2D;
            if (caracterRight.facingRight) shurikanetInstance.AddForce(player.right * 1500);
            else shurikanetInstance.AddForce(player.right * -1500);
            audio.PlayOneShot(ShurikaneSound);
        }*/
	}
    void OnGUI()
    {
        if (Input.GetKeyDown(KeyCode.Mouse0) && CharacterControllerScript.weapon == 1 && Coin.allowShurikanes)
        {
            Rigidbody2D shurikanetInstance;
            shurikanetInstance = Instantiate(shurikane, player.position, player.rotation) as Rigidbody2D;
            if (caracterRight.facingRight) shurikanetInstance.AddForce(player.right * 1500);
            else shurikanetInstance.AddForce(player.right * -1500);
            audio.PlayOneShot(ShurikaneSound);
        }
    }
}
