class Coin 
{
  PVector position;
  PVector velocity;
  float speed = 100.0f;
  float timeDelta = 1.0f / 60.0f;
  PVector acceleration = new PVector(0,9.8,0);
  float predTime;
  float time;
  //float coinH;

  Coin()
  {
    position = new PVector();
    velocity = new PVector();
    predTime = sqrt(381/4.9f);  //8.817885f;
    time = 0;
    //coinH = 381;
  }
  
  void update()
  {
    if(position.y < 600 - 10)
    {
      velocity.add(PVector.mult(acceleration, timeDelta));
      position.add(PVector.mult(velocity, timeDelta));
      time = time +  (1.0f / 60.0f);
    }

  }
  
  void draw()
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(0);
    stroke(255);
    ellipse(0,0,20,20);
    popMatrix();
  }
   
}
