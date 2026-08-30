class WinObject extends GameComponent
{
  float size;
  
  WinObject(float x_, float y_, float _r, float _g, float _b, float size_ )
  {
    x = x_;
    y = y_; 
    r = _r; g = _g; b = _b;
    size = size_;
  }
  
  void draw()
  {
    pushMatrix();
    translate(x,y);
    fill(r,g,b);
    stroke(r, g, b);
    ellipse(x, y,size,size);
    popMatrix();
  }
  
}
