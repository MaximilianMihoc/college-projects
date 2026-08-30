using UnityEngine;
using System.Collections;

public class CharacterControllerScript : MonoBehaviour {

	public float maxSpeed = 10f;
	public bool facingRight = true;

	Animator anim;

	bool grounded = false;
	public Transform groundCheck;
	float groundRadius = 0.2f;
	public LayerMask whatIsGround;
	public float jumpForce = 700f;
    //float time = 0;
    public AudioClip jumpSound;
    public AudioClip swordSound;
    float move = 0;
    public static int weapon = 0;

	void Start () 
	{
        Screen.orientation = ScreenOrientation.Landscape;
		anim = GetComponent<Animator> ();
	}

	void Update()
	{
        Resources.UnloadUnusedAssets();
		/*if(grounded && Input.GetKeyDown(KeyCode.UpArrow))
	    {
			anim.SetBool ("Ground", false);
			rigidbody2D.AddForce(new Vector2(0, jumpForce));
            audio.PlayOneShot(jumpSound);
		}*/
        
		if(Input.GetKeyDown(KeyCode.Mouse0) && weapon == 0)
		{
			anim.SetBool ("Attack", true);
            audio.PlayOneShot(swordSound);
            //time = Time.time;
		}
		else anim.SetBool ("Attack", false);

        if (move > 1) move = 1;
        //if (time + 1 < Time.time) anim.SetBool("Attack", false);
	}

    void OnGUI()
    {
            if (GUI.Button(new Rect(Screen.width * 0.6f, Screen.height * 0.6f, Screen.width * .1f, Screen.height * .15f), "Jump"))
                if (grounded)
                {
                    anim.SetBool("Ground", false);
                    rigidbody2D.AddForce(new Vector2(0, jumpForce));
                    audio.PlayOneShot(jumpSound);
                }
            if (GUI.Button(new Rect(Screen.width * 0.8f, Screen.height * 0.8f, Screen.width * .1f, Screen.height * .15f), "Right"))
            {
                move += 0.2f;
            }
            if (GUI.Button(new Rect(Screen.width * 0.6f, Screen.height * 0.8f, Screen.width * .1f, Screen.height * .15f), "Iddle"))
            {
                move = 0;
            }
            if (GUI.Button(new Rect(Screen.width * 0.4f, Screen.height * 0.8f, Screen.width * .1f, Screen.height * .15f), "Left"))
            {
                move = move + 0.2f * (-1);
            }
            if (GUI.Button(new Rect(Screen.width * 0.05f, Screen.height * 0.9f, Screen.width * .07f, Screen.height * .15f), "Sword"))
            {
                weapon = 0;
            }
            if(Coin.allowShurikanes)
                if(GUI.Button(new Rect(Screen.width * 0.15f, Screen.height * 0.9f, Screen.width * .07f, Screen.height * .1f), "Skn"))
                {
                    weapon = 1;
                }
            if (Coin.allowArrows)
                if (GUI.Button(new Rect(Screen.width * 0.25f, Screen.height * 0.9f, Screen.width * .07f, Screen.height * .1f), "Bow"))
                {
                    weapon = 2;
                }
    }

	void FixedUpdate () 
	{
		grounded = Physics2D.OverlapCircle (groundCheck.position, groundRadius, whatIsGround);
		anim.SetBool ("Ground", grounded);

		anim.SetFloat ("vSpeed", rigidbody2D.velocity.y);

        //float move = 0;// Input.GetAxis("Horizontal");
        
		anim.SetFloat ("Speed", Mathf.Abs (move));

		rigidbody2D.velocity = new Vector2(move * maxSpeed, rigidbody2D.velocity.y);

		if(move > 0 && !facingRight)
			Flip ();
		else if(move < 0 && facingRight)
			Flip ();
	}

	void Flip()
	{
		facingRight = !facingRight;
		Vector3 theScale = transform.localScale;
		theScale.x *= -1;
		transform.localScale = theScale;
	}
}
