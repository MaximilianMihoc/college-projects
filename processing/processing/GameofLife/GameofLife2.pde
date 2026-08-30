LifeBoard lifeboard;
void setup()
{
  size(1200,680);
  font = createFont("Arial",16,true);
  lifeboard = new LifeBoard();
}
boolean pause = false;
PFont font;

void draw()
{

    background(255);
    if (!pause) lifeboard.update();
    lifeboard.draw();
    
    textFont(font,13);                 
    fill(0);    
    textAlign(LEFT);
    text("PRESS: C (to Clear Board); R (to Randomise); 1 (for Blinker); 2 (for Block); 3 (for Glider); 4 (for Gosper glider gun)", 0, height-17);
    text("Hold Space to pause the game and use mouse to draw objects", 0, height-5);
}
void mousePressed()
{
  lifeboard.on(mouseX/lifeboard.cellWidth, mouseY/lifeboard.cellHeight);
}
void keyPressed()
{
  if (key == '1')
  {
    lifeboard.Blinker();
  }
  if (key == '2')
  {
    lifeboard.Block();
  }
  if (key == '3')
  {
    lifeboard.Glider();
  }
  if (key == '4')
  {
    lifeboard.LightweightSpaceship();
  }
  if(key == ' ')
  {
     pause = true;   
  }
  if (key == 'c')
  {
    lifeboard.clearBoard(lifeboard.current);
  }
  
  if (key == 'r')
  {
    lifeboard.randomise();
  }
}
void keyReleased()
{
  if(key == ' ')
  {
    pause = false;
  } 
}
