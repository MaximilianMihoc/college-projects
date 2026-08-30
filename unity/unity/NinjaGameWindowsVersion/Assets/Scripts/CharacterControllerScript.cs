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

	void Start () 
	{
		anim = GetComponent<Animator> ();
	}

	void Update()
	{
        Resources.UnloadUnusedAssets();
		if(grounded && Input.GetKeyDown(KeyCode.UpArrow))
	    {
			anim.SetBool ("Ground", false);
			rigidbody2D.AddForce(new Vector2(0, jumpForce));
            audio.PlayOneShot(jumpSound);
		}

		if(Input.GetKeyDown(KeyCode.C))
		{
			anim.SetBool ("Attack", true);
            audio.PlayOneShot(swordSound);
            //time = Time.time;
		}
		else anim.SetBool ("Attack", false);

        //if (time + 1 < Time.time) anim.SetBool("Attack", false);

	}

	void FixedUpdate () 
	{
		grounded = Physics2D.OverlapCircle (groundCheck.position, groundRadius, whatIsGround);
		anim.SetBool ("Ground", grounded);

		anim.SetFloat ("vSpeed", rigidbody2D.velocity.y);

        float move = Input.GetAxis("Horizontal");
        
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
