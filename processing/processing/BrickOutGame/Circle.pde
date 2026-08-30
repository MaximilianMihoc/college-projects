class Circle extends GameComponent
{
  float size;
  float xSpeed;
  float ySpeed;
  
  Circle()
  {
      x = 250;
      y = 400;
      xSpeed = -4;
      ySpeed = -4; 
      size = 20; 
      r = 255;
      g = 255;
      b = 255;
  }
  
  void update()
  {
    x += xSpeed;
    y += ySpeed;
  }
  
  void checkCollisions() 
  {
     
    float r = size/2;
     
    if ( (x < r) || (x > width-r))
    {
      xSpeed = -xSpeed;
    } 
     
    if(y < r) 
    {
      ySpeed = -ySpeed; 
    }
     
  }

  
  void draw()
  {
   fill(r,g,b);
   ellipse(x, y, size, size);
  }
  
}
