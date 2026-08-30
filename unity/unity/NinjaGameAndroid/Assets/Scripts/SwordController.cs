using UnityEngine;
using System.Collections;

public class SwordController : MonoBehaviour {

    void Start()
    {
        collider2D.enabled = false;
        renderer.enabled = false;
    }
	
	void Update () 
    {
        if (Input.GetKeyDown(KeyCode.Mouse0) && CharacterControllerScript.weapon == 0)
        {
            collider2D.enabled = true;
            renderer.enabled = true;
        }
        else
        {
            collider2D.enabled = false;
            renderer.enabled = false;
        }
	}

    /*void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "Cobra" || col.gameObject.tag == "Enemy3" || col.gameObject.tag == "Enemy2" || col.gameObject.tag == "Witch" || col.gameObject.tag == "WitchFire" || col.gameObject.tag == "Boss")
        {
            Destroy(col.gameObject);
        }
    }*/
}
