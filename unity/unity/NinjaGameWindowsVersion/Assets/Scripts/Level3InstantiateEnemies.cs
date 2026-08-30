using UnityEngine;
using System.Collections;

public class Level3InstantiateEnemies : MonoBehaviour {

    public Rigidbody2D Cobra;
    public Rigidbody2D Enemy3;
    public Rigidbody2D Enemy2;
    public Rigidbody2D Witch;
    public Rigidbody2D Boss;
    public int check = 0;

    Rigidbody2D cobraInstance, enemy3Instance, enemy2Instance, witchInstance, BossInstance;
    float time = 0;
    bool ok = true;

    public static int countDeadEnemies = 35;

    void Start()
    {
            InvokeRepeating("EnemyInstantiator", 5, 10);
            time = Time.time;
    }

    void EnemyInstantiator()
    {
        float x = Random.Range(-38.0f, 38.0f);
        float y = Random.Range(0.0f, 13.0f);
        cobraInstance = Instantiate(Cobra, new Vector3(x, y, 0), Quaternion.identity) as Rigidbody2D;

        x = Random.Range(-38.0f, 38.0f);
        y = Random.Range(0.0f, 13.0f);
        enemy2Instance = Instantiate(Enemy2, new Vector3(x, y, 0), Quaternion.identity) as Rigidbody2D;

        x = Random.Range(-38.0f, 38.0f);
        y = Random.Range(0.0f, 13.0f);
        enemy3Instance = Instantiate(Enemy3, new Vector3(x, y, 0), Quaternion.identity) as Rigidbody2D;

        x = Random.Range(-38.0f, 38.0f);
        y = Random.Range(0.0f, 13.0f);
        witchInstance = Instantiate(Witch, new Vector3(x, y, 0), Quaternion.identity) as Rigidbody2D;
    }

    void InstantiateBoss()
    {
        
        BossInstance = Instantiate(Boss, new Vector3(-6, -6, 0), Quaternion.identity) as Rigidbody2D;
        BossInstance = Instantiate(Boss, new Vector3(4.7f, 8.25f, 0), Quaternion.identity) as Rigidbody2D;
        BossInstance = Instantiate(Boss, new Vector3(25, -6, 0), Quaternion.identity) as Rigidbody2D;
        
    }

    void Update()
    {
        check = countDeadEnemies; // this is just to see the changes in Unity
        if ( time + 50 < Time.time)
            CancelInvoke("EnemyInstantiator");

        if (countDeadEnemies >= 35 && ok)
        {
            Invoke("InstantiateBoss", 2);
            ok = false;
        }
        //Time.timeScale = 1; // comment this when build the game

    }
}
