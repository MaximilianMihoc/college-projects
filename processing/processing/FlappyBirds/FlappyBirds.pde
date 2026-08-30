Tower t ;
Tower t2;
Bird bird;
boolean over = false;

int score;
int HighScore;

void setup()
{
  _instance = this;

  size(400, 500);
  
  font = createFont("Arial",16,true);  
  
  bird = new Bird();
  children.add(bird);
  bird.position.x = 200;
  bird.position.y = 300;
  
  t = new Tower();
  t2 = new Tower();
  t.reset();
  t2.reset();
  t2.position.x = 650;
  score = 0;
  HighScore = 0;
}

PFont font;
int count = 0;

void printText(String text)
{
  text(text, 5, 20 + (count * 20));
  count ++;
}


static FlappyBirds _instance;

static boolean[] keys = new boolean[526];
ArrayList<GameEntity> children = new ArrayList<GameEntity>();
static FlappyBirds instance()
{
  return _instance;
}

void draw()
{
  background(0,0,255);
  Load();
  
  if (over)
  {
    textFont(font,30);                 
    fill(255);    
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    if (score > HighScore) HighScore = score;
    text("HIGH SCORE: " + HighScore, width/2, height/2 + 60);
    text("Press any key to start again", width/2, height/2 + 30);
    if (keyPressed)
    {
       over = false;
       bird = new Bird();
       children.add(bird);
       bird.position.x = 200;
       bird.position.y = 300;
       
       t = new Tower();
       t2 = new Tower();
       t.reset();
       t2.reset();
       t2.position.x = 650;
       score = 0;
    }
  }
}

void Load()
{
     if(t.position.x + t.TowerWidth < 0)
     {
        t.reset();
        t.position.x = width;
      }
      
      if(t2.position.x + t2.TowerWidth < 0)
      {
        t2.reset();
        t2.position.x = width;
      }
       
      Collisions(t);
      Collisions(t2);
      t.update();
      t.draw();
      
      t2.update();
      t2.draw();
      
      if(bird.position.x == t.position.x || bird.position.x == t2.position.x )
      {
        score +=1;
      }
      
      textFont(font,30);                 
      fill(255);    
      textAlign(LEFT);
      text("Score: " + score, 10, 50);
      
      for (int i = children.size()-1; i >= 0; i--) 
      {
        GameEntity entity = children.get(i);
        //
        entity.update();
        entity.draw();
        if (! entity.alive) 
        {
          children.remove(i);
        }
      }
      count = 0;
}

void Collisions(Tower tow)
{
  //colision with tower up
  if(((bird.position.x + 10 > tow.position.x) && ( bird.position.x + 10 < tow.position.x + tow.TowerWidth) 
    && ( bird.position.y - 10 < tow.position.y + tow.Theight - 50))
    || ((bird.position.x - 10 > tow.position.x) && ( bird.position.x - 10 < tow.position.x + tow.TowerWidth) 
    && ( bird.position.y - 10 < tow.position.y + tow.Theight - 50)) )
  {
    t.Tspeed = 0;
    t2.Tspeed = 0;
    over = true;
    bird.alive = false;
  }
  //colision with tower down
  if(((bird.position.x + 10 > tow.position.x) && ( bird.position.x + 10 < tow.position.x + tow.TowerWidth) 
     && ( bird.position.y + 10 > tow.position.y + tow.Theight + 50))
     || ((bird.position.x - 10 > tow.position.x) && ( bird.position.x - 10 < tow.position.x + tow.TowerWidth) 
     && ( bird.position.y + 10 > tow.position.y + tow.Theight + 50)) )
  {
    t.Tspeed = 0;
    t2.Tspeed = 0;
    over = true;
    bird.alive = false;
  }
  // Collisions with top or bottom of screen
  if(bird.position.y < 0 || bird.position.y > 500 - 10)
  {
    t.Tspeed = 0;
    t2.Tspeed = 0;
    over = true;
    bird.alive = false;
  }
}

static boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k];  
  }
  return false;
}

void mousePressed()
{
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  if(key == ' ')
  {
    bird.lastPressed = false;
    bird.mass = 2.0f;
  }
  //keys[keyCode] = false; 
}

