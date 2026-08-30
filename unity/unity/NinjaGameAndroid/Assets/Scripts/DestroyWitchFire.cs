using UnityEngine;
using System.Collections;

public class DestroyWitchFire : MonoBehaviour {

	void Start()
    {
        Destroy(gameObject, 1.5f);
    }
}
