PFont f;
Coin coin = new Coin();

void setup()
{
  size(800,600);
  f = createFont("Arial",16,true);
 
  coin.position.x = 500;
  coin.position.y = height - 381 - 10;

}

void draw()
{
   background(0);
   textFont(f,20);                 
   fill(255);    
   textAlign(LEFT);
   text("Predicted Time: " + coin.predTime ,10, 50);
   text("Predicted Velocity: [0.0, -86.415276,0.0] ",10, 70);
   text("Coin Velocity: " +coin.velocity,10, 90);
   float coinH = height - 10 - coin.position.y;
   text("Coin Height: " + coinH,10, 110);
   text("Time: " + coin.time,10, 130);
   text("Press any key to reset",10, 150);
   stroke(0);
   rect(400, height - 381, 50, 380);
   coin.update();
   coin.draw();
   
   
   if (keyPressed)
    {
      coin.position.x = 500;
      coin.position.y = height - 381 - 10;
      coin.time = 0;
      coin.velocity = new PVector();
    }
}
