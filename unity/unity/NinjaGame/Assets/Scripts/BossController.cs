using UnityEngine;
using System.Collections;

public class BossController : MonoBehaviour 
{
    public float speed = -0.9f;
    bool flip = true;
    float time = 0, time2 = 0;
    int BossLife = 100;
    int endGame = 0;

    Animator anim;
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    void FixedUpdate()
    {
        if (BossLife <= 90 && BossLife > 5)
        {
            if (speed < 0)
            {
                speed = -20;
            }
            else
            { 
                speed = 20;
            }

            rigidbody2D.velocity = new Vector2(speed, rigidbody2D.velocity.y);
            anim.SetBool("Dash",true);
        }

        if (BossLife <= 5 && BossLife > 0)
        {
            speed = 0;
            anim.SetBool("Fall", true);
            time2 = Time.time;
        }

        if (time2 != 0 && time2 + 0.5 < Time.time)
        {
            Destroy(gameObject);
            GameManager.score += 10000;
            endGame += 1;
        }
        
    }

    void OnCollisionStay2D(Collision2D col)
    {
        if (col.gameObject.tag == "Lava")
        {
            Destroy(gameObject);
            endGame += 1;
            GameManager.score += 10000;
        }

        if ((col.gameObject.tag == "Enemy3" || col.gameObject.tag == "Enemy2" || col.gameObject.tag == "FlipEnemy" || col.gameObject.tag == "Cobra" || col.gameObject.tag == "Boss") && flip)
        {
            speed = speed * (-1);
            Flip();
            flip = false;
            time = Time.time;
        }

        if (time != 0 && time + 0.2 < Time.time)
            flip = true;

    }
    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "Arrow")
        {
            BossLife -= 5;
            Destroy(col.gameObject);
        }
        if (col.gameObject.tag == "Shurikane")
        {
            BossLife -= 2;
            Destroy(col.gameObject);
        }
    }

    void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "Sword")
        {
            BossLife -= 10;
        }
    }

    void Flip()
    {
        Vector3 theScale = transform.localScale;
        theScale.x *= -1;
        transform.localScale = theScale;
    }

    public float guiPlaceMenuX = .25f;
    public float guiPlaceMenuY = .25f;
    public float guiPlaceButtonX1 = .7f;
    public float guiPlaceButtonY4 = .80f;

    void OnGUI()
    {
        
        GUIStyle customButton = new GUIStyle("button");
        customButton.fontSize = 40;
        if (endGame >= 3)
        {
            //EndGame
            Time.timeScale = 0;
            GUI.Box(new Rect(Screen.width * guiPlaceMenuX, Screen.height * guiPlaceMenuY, Screen.width * .3f, Screen.height * .7f), "Congratulations", customButton);
            if (GUI.Button(new Rect(Screen.width * guiPlaceButtonX1, Screen.height * guiPlaceButtonY4, Screen.width * .2f, Screen.height * .05f), "Main Menu"))
                Application.LoadLevel("MainMenu");
        }
    }
}
