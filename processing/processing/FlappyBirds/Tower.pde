class Tower extends GameEntity
{
  float Theight;
  float TowerWidth;
  float Tspeed;
  float TH1;
  
  Tower()
  {
    TowerWidth = 60;
    position.x = width;
    position.y = 0;
    Tspeed = 1;
    TH1 = 0;
  }
  
  void reset()
  {
    Theight = random(100, 400);
  }
  
  void update()
  {
    position.x -= Tspeed;
  }
  
  void draw()
  {
    fill(0,250,0);
    rect(position.x, position.y, TowerWidth, Theight - 50);
    rect(position.x, Theight + 50, TowerWidth, height - Theight - 55);

  }
}
