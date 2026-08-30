using UnityEngine;
using System.Collections;

public class ShurikaneController : MonoBehaviour {

    //public float ShSpeed = 10f;
    public float ShRotation = 20f;

    void Start()
    {
        Destroy(gameObject, 1.5f);
    }

    void FixedUpdate()
    {
        transform.Rotate(0, 0, -ShRotation);
        //rigidbody2D.velocity = new Vector2(ShSpeed, rigidbody2D.velocity.y * Time.deltaTime);
    }

}
