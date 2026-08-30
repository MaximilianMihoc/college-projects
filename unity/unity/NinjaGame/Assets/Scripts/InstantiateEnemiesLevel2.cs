using UnityEngine;
using System.Collections;

public class InstantiateEnemiesLevel2 : MonoBehaviour {

    public Rigidbody2D Cobra;
    public Rigidbody2D Enemy2;
    public Rigidbody2D Enemy3;
    Rigidbody2D cobraInstance, enemy3Instance, enemy2Instance;

    void Start()
    {
        //first half
        cobraInstance = Instantiate(Cobra, new Vector3(5, -7f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(16, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(40, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(30, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(50, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(60, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(70, -1f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(9, -16f, 0), Quaternion.identity) as Rigidbody2D;
        cobraInstance = Instantiate(Cobra, new Vector3(30, -16f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(16, -16f, 0), Quaternion.identity) as Rigidbody2D;

        //second half
        cobraInstance = Instantiate(Cobra, new Vector3(87, -12f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(107, -12f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(129, -12f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(151, -12f, 0), Quaternion.identity) as Rigidbody2D;

        cobraInstance = Instantiate(Cobra, new Vector3(89, -0.7f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(145, -0.7f, 0), Quaternion.identity) as Rigidbody2D;
        enemy2Instance = Instantiate(Enemy2, new Vector3(100, -0.7f, 0), Quaternion.identity) as Rigidbody2D;
        enemy3Instance = Instantiate(Enemy3, new Vector3(125, -0.7f, 0), Quaternion.identity) as Rigidbody2D;
    }

    void Update()
    {
        //Time.timeScale = 1;
    }
}
