class Bird extends GameEntity
{
  //boolean KeyAlreadyPressed;
  PVector gravity;
  PVector force;
  boolean lastPressed;
    
  Bird()
  {
    mass = 2.0f;
    gravity = new PVector(0,9.8,0);
    force = new PVector(0,0,0);
    velocity = new PVector();
    acceleration = new PVector();
    lastPressed = false;
  }
  
  void update()
  {
    if (FlappyBirds.checkKey(' ') && !lastPressed)
    {
      float newtons = -2000.0f;
      velocity.mult(0);
      acceleration.mult(0);
      mass = 1;
      force.add(0,newtons,0);
      gravity.add(new PVector(0,50)); 
      lastPressed = true;
      
    }
    
    if(position.y < 550 && position.y > 0)
    {
      if(acceleration.y <= 0) gravity.add(new PVector(0,55));
      else gravity = new PVector(0,2);
      acceleration.add(gravity);
      acceleration.add(PVector.div(force, mass));
      velocity.add(PVector.mult(acceleration, timeDelta));
      position.add(PVector.mult(velocity, timeDelta));
      force.x = force.y = force.z = 0.0f;
    }
    
    //if (!keyPressed) lastPressed = false;
    
  }
  
  void draw()
  {
    pushMatrix();
    stroke(0);
    fill(0);
    translate(position.x, position.y);
    fill(255,0,0);
    ellipse(0,0,20,20);
    fill(0,0,255);
    ellipse(9,-9,10,9);
    fill(255, 255, 0);
    ellipse(10,-8,5,5);
    fill(0);
    line(10,4,25,0);
    line(10,0,25,0);
    line(25,0, 10, -4);
    line(-4,3,4,3);
    popMatrix();
    
  }
  
  void keyPressed()
  { 
    keys[keyCode] = true;
  }
   
  void keyReleased()
  {
    keys[keyCode] = false; 
  }

}
