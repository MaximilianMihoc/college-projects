class Ship extends GameComponent
{
   
 Ship()
  {
    x=0;
    y=0;
    r = 255;
    g = 2550;
    b = 255;
    rot = 0;
  }

  void update()
  {
    
  }
  
  void draw()
  {
    pushMatrix();
    
    translate(x, y);
    rotate(rot);
    stroke(r, g, b);
    
    line(-radius, radius, 0, -radius);
    line(radius, radius, 0, -radius);
    line(-radius, radius, 0, 0);
    line(radius, radius, 0, 0);
    
    popMatrix();
  }

}
