using UnityEngine;
using System.Collections;

public class End : MonoBehaviour {

    private WinText winText;
    void Awake()
    {
        winText = GetComponent<WinText>();
    }

    void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "End")
        {
            Time.timeScale = 0;
            winText.win = true;
        }
        
    }
}
