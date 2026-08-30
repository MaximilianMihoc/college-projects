using UnityEngine;
using System.Collections;

public class LostLife : MonoBehaviour {

    public GameManager gameManager;
    public int damaged = 1;

    public GUIText Procent;
    int LifeProcent = 100;
    float time = 0;
    Animator anim;
    void Start()
    {
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        Procent.text = LifeProcent + " %";

        if(LifeProcent <= 0)
        {
            gameManager.SendMessage("PlayerDamage", damaged, SendMessageOptions.DontRequireReceiver);
            LifeProcent = 100;
        }

        if (time + 0.2 < Time.time)
        {
            anim.SetBool("Hit", false);
        }
    }

    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "Lava")
        {
            LifeProcent -= LifeProcent;
            anim.SetBool("Hit", true);
            time = Time.time;
        }

        if (col.gameObject.tag == "Cobra")
        {
            LifeProcent -= 5;
            anim.SetBool("Hit", true);
            time = Time.time;
        }

        if (col.gameObject.tag == "Enemy3")
        {
            LifeProcent -= 10;
            anim.SetBool("Hit", true);
            time = Time.time;
        }
        if (col.gameObject.tag == "Enemy2")
        {
            LifeProcent -= 20;
            anim.SetBool("Hit", true);
            time = Time.time;
        }

        if (col.gameObject.tag == "Witch")
        {
            LifeProcent -= 25;
            anim.SetBool("Hit", true);
            time = Time.time;
        }

        if (col.gameObject.tag == "WitchFire")
        {
            LifeProcent -= 20;
            anim.SetBool("Hit", true);
            time = Time.time;
        }

        if (col.gameObject.tag == "Boss")
        {
            LifeProcent -= 25;
            anim.SetBool("Hit", true);
            time = Time.time;
        }
    }
}
