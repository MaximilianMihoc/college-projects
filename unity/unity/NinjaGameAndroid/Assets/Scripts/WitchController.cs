using UnityEngine;
using System.Collections;

public class WitchController : MonoBehaviour {

    public float speed = -0.9f;
    bool flip = true;
    float time = 0;
    int WitchLife = 100;
    public Rigidbody2D witchFire;
    //public GameObject player;

    void Start()
    {
        InvokeRepeating("WitchFire", 2, 1);
    }

    void Update()
    {
        if (WitchLife <= 0)
        {
            Destroy(gameObject);
            Level3InstantiateEnemies.countDeadEnemies += 1;
            GameManager.score += 6000;
        }
    }
    void FixedUpdate()
    {
        rigidbody2D.velocity = new Vector2(speed, rigidbody2D.velocity.y);
    }
    void WitchFire()
    {
        Rigidbody2D fireInstance;
        fireInstance = Instantiate(witchFire, transform.position, transform.rotation) as Rigidbody2D;
        fireInstance.AddForce(transform.position * 300);
    }

    void OnCollisionStay2D(Collision2D col)
    {
        /*if (col.gameObject.tag == "Lava")
        {
            Destroy(gameObject);
            Level3InstantiateEnemies.countDeadEnemies += 1;
            GameManager.score += 6000;
        }*/

        if (flip && col.gameObject.tag != "WitchFire")
        {
            speed = speed * (-1);
            Flip();
            flip = false;
            time = Time.time;
        }
        if (time + 0.2 < Time.time)
            flip = true;

    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "Arrow")
        {
            WitchLife -= 30;
            Destroy(col.gameObject);
        }
        if (col.gameObject.tag == "Shurikane")
        {
            WitchLife -= 15;
            Destroy(col.gameObject);
        }
    }

    void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "Sword")
        {
            WitchLife -= 35;
        }
    }

    void Flip()
    {
        Vector3 theScale = transform.localScale;
        theScale.x *= -1;
        transform.localScale = theScale;
    }
}
