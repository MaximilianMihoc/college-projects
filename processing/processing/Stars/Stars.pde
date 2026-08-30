void setup()
{
  size(600,500);
}

Star star = new Star();
Star star2 = new Star();
Star star3 = new Star();
Star star4 = new Star();
Star star5 = new Star();
Star star6 = new Star();

Ship ship = new Ship();

//ArrayList<GameComponent> children = new ArrayList<GameComponent>();

void draw()
{
  background(0);
  ship.x = 300;
  ship.y = 300;
  ship.radius = 40;
  ship.r = 255;
  ship.g = 255;
  ship.b = 255;
  ship.update();
  ship.draw();
  
  /*children.add(star1); // to add elements in array
  for(int i = 0; i < children.length();i++)
  {
    children.get(i).update();
    children.get(i).draw();
  }*/
  
  
  
  star.x = 400;
  star.y = 400;
  star.numPoints = 3;
  star.radius2 = 10.0f;
  star.direction = 0.03f;
  star.update();
  star.draw();
  
  star6.x = 220;
  star6.y = 420;
  star6.numPoints = 8;
  star6.radius = 150;
  star6.radius2 = 20;
  star6.direction = -0.02f;
  star6.r = 255;
  star6.b = 255;
  star6.g = 0;
  star6.update();
  star6.draw();

  /*for (int i=0; i < 2; i++)
  {
    Star starRand = new Star();
    int rx = int(random(500));
    starRand.x = rx;
    int ry = int(random(500));
    starRand.y = ry;
    starRand.numPoints = 10;
    starRand.radius = 100.0f;
    starRand.radius2 = 30.0f;
    starRand.direction = 0.01f;
    starRand.r = 0;
    starRand.update();
    starRand.draw();
  }*/
  star2.x = 100;
  star2.y = 100;
  star2.numPoints = 10;
  star2.radius = 100.0f;
  star2.radius2 = 30.0f;
  star2.direction = 0.01f;
  star2.r = 0;
  star2.update();
  star2.draw();
  
  star3.x = 400;
  star3.y = 150;
  star3.r = int(random(0, 255));
  star3.g = int(random(0, 255));
  star3.b = int(random(0, 255));
  star3.radius = 150.0f;
  star3.radius2 = 50.0f;
  star3.direction = 0.02f;
  star3.update();
  star3.draw();
  
  star4.x = 100;
  star4.y = 300;
  star4.numPoints = 15;
  star4.g = 127;
  star4.r = 210;
  star4.radius = 70.0f;
  star4.radius2 = 20.0f;
  star4.direction = 0.01f;
  star4.update();
  star4.draw();
  
  star5.x = 400;
  star5.y = 150;
  star5.numPoints = 10;
  star5.r = int(random(0, 255));
 // star5.g = int(random(0, 255));
  //star5.b = int(random(0, 255));
  star5.radius = 150.0f;
  star5.radius2 = 50.0f;
  star5.direction = -0.02f;
  star5.update();
  star5.draw();
}
