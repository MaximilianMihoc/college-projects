using UnityEngine;
using System.Collections;

public class Enemy3Controller : MonoBehaviour {

    public float speed = -0.9f;
    bool flip = true;
    float time = 0;
    int EnemyLife = 100;

    void Update()
    {
        if (EnemyLife <= 0)
        {
            Destroy(gameObject);
            Level3InstantiateEnemies.countDeadEnemies += 1;
            GameManager.score += 2000;
        }
    }

    void FixedUpdate()
    {
        rigidbody2D.velocity = new Vector2(speed, rigidbody2D.velocity.y);
    }

    void OnCollisionStay2D(Collision2D col)
    {
        if (col.gameObject.tag == "Lava")
        {
            Destroy(gameObject);
            Level3InstantiateEnemies.countDeadEnemies += 1;
            GameManager.score += 2000;
        }

        if ((col.gameObject.tag == "Enemy2" || col.gameObject.tag == "Cobra" || col.gameObject.tag == "FlipEnemy" || col.gameObject.tag == "Enemy3") && flip)
        {
            speed = speed * (-1);
            Flip();
            flip = false;
            time = Time.time;
        }

        if (time + 0.3 < Time.time)
            flip = true;
    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "Arrow")
        {
            EnemyLife -= 50;
            Destroy(col.gameObject);
        }
        if (col.gameObject.tag == "Shurikane")
        {
            EnemyLife -= 25;
            Destroy(col.gameObject);
        }
    }
    void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "Sword")
        {
            EnemyLife -= 40;
        }
    }
    void Flip()
    {
        Vector3 theScale = transform.localScale;
        theScale.x *= -1;
        transform.localScale = theScale;
    }
}
