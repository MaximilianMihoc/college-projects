class Rectangle extends GameComponent
{
  float RectHeight;
  float RectWidth;
  boolean RectHide;
  boolean Permanent;
  
  Rectangle()
  {
    x = 10;
    y = 20;
    RectHeight = 20;
    RectWidth = 100;
    r = 0;
    g = 0;
    b = 255;
    RectHide = false;
    Permanent = false;
  }
  
  void draw()
  {
    fill(r,g,b);
    rect( x, y, RectWidth, RectHeight);
  }
}
