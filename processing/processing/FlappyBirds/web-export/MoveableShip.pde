void setup()
{
  size(500, 500);
  ship1 = new Ship(this);  
  ship1.position = new Vector2(100, 100);
  ship1.w = 50;
  ship1.h = 50; 
}

Ship ship1;
boolean[] keys = new boolean[526];

void draw()
{
  background(0);

  ship1.update();
  ship1.draw();  
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];  
  }
  return false;
}

void keyPressed()
{ 
  println(keyCode);
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

class Ship
{
  MoveableShip parent;
  
  Vector2 position;
  Vector2 look;
  float w;
  float h;
  float theta;
  float spin = 0.1f;
  float scaleF = 1.0f;
  float speed = 100.0f;
  float timeDelta = 1.0f / 60.0f;
  
  Ship(MoveableShip parent)
  {
    this.parent = parent;
    position = new Vector2();
    look = new Vector2(0, -1);
    w = 10;
    h = 10;
  }
  
  void update()
  { 
      if (parent.checkKey('W') || parent.checkKey('w'))
      {
          position.add(look.multiply(speed * timeDelta));
      }
      
      if (parent.checkKey('S') || parent.checkKey('s'))
      {
          position.add(look.multiply(-speed * timeDelta));
      }
      if (parent.checkKey('A') || parent.checkKey('a'))
      {
        theta -= spin;
      }
      
      if (parent.checkKey('D') || parent.checkKey('d'))
      {
        theta += spin;
      }        
      look.x = sin(theta);
      look.y = -cos(theta);    
  }
 
  
  void draw()
  {
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    scale(scaleF);
    float halfwidth, halfheight;
    halfwidth = w / 2.0f;
    halfheight = h / 2.0f;
    line(- halfwidth, halfheight, 0, - halfheight);
    line(halfwidth, halfheight, 0, - halfheight);
    
    line(- halfwidth, halfheight, 0, 0);
    line(halfwidth, halfheight, 0, 0);
    popMatrix();
  } 
}
class Vector2
{
  float x,y;
  Vector2()
  {
    x = 0.0f;
    y = 0.0f;
  }
  
  Vector2(float x, float y)
  {
      this.x = x;
      this.y = y;  
  }
  
  Vector2 add(Vector2 a)
  {
    x = x + a.x;
    y = y + a.y;
    return this;
  }
  
  Vector2 sub(Vector2 a)
  { 
      x = x - a.x;
      y = y - a.y;
      return this;
  }
  
  Vector2 multiply(float scale)
  {
    x *= scale;
    y *= scale;
    return this;
  }
  
  
}

