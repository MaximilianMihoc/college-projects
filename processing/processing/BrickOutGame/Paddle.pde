class Paddle extends GameComponent
{
 
  float Pheight;
  float Pwidth;
  
  Paddle()
  {
   x = 0;
   y = 0; 
   r = 0;
   g = 255;
   b = 0;
   Pwidth = 150;
   Pheight = 20;
  }
  
  void draw()
  {
    //the controller for player
    fill(r,g,b);
    x = mouseX - Pwidth/2;
    rect(x,y,Pwidth,Pheight);
  }
}
