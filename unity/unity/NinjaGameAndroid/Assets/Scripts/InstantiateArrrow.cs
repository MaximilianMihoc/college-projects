using UnityEngine;
using System.Collections;

public class InstantiateArrrow : MonoBehaviour {

    public Rigidbody2D arrow;
    public Transform player;

    private CharacterControllerScript caracterRight;
    public AudioClip ArrowSound;

    void Awake()
    {
        caracterRight = GetComponent<CharacterControllerScript>();
    }

    void Update()
    {
       /* if (Input.GetButtonDown("Fire2") && Coin.allowArrows)
        {
            Rigidbody2D arrowInstance;
            arrowInstance = Instantiate(arrow, player.position, player.rotation) as Rigidbody2D;
            if (caracterRight.facingRight) arrowInstance.AddForce(player.right * 3500);
            else
            {
                arrowInstance.AddForce(player.right * -3500);
            }
            audio.PlayOneShot(ArrowSound);
        }*/
    }

    void OnGUI()
    {
        if (Input.GetKeyDown(KeyCode.Mouse0) && CharacterControllerScript.weapon == 2 && Coin.allowArrows)
        {
            Rigidbody2D arrowInstance;
            arrowInstance = Instantiate(arrow, player.position, player.rotation) as Rigidbody2D;
            if (caracterRight.facingRight) arrowInstance.AddForce(player.right * 3500);
            else
            {
                arrowInstance.AddForce(player.right * -3500);
            }
            audio.PlayOneShot(ArrowSound);
        }
    }

}
