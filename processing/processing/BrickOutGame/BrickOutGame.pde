/*************************BRICKOUT GAME **************************
Student: Maximilian Adrian Mihoc
Student Number: C12728559
Course: DT228/2

Game description
  This game is the classic BrickOut game where you have to break all bricks to collect points and to advance to the next level.
My game contains 3 Levels and when all completed, there will show up a car and some flying circles as a premium.
The player has 3 lives when he enter the game and he can loose them if the ball goes under the paddle.
The paddle is used to keep the ball in game. If the ball goes under the paddle, the player looses a life.

Code description
  My game includes:
      -> recorded audio wav file for sound. the sound will start as soon as the player enter the game
      -> drowing: ball(circle), paddle, bricks(rectangles), car
      -> animation: bouncing ball and breack bricks 
      -> classes: each object has his own class
      -> inheritance: The parent Class is the GameEntity class that contains the common instances of the othes objects
      -> polymorphism: I am using polymorphism to display the winning objects (random circles around the screen)
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

PFont f;
int Lives;
int Level;
int counter;
int var;
int score;
float xLives;
float yLives;
boolean begin;
Circle myCircle = new Circle();
Paddle paddle = new Paddle();
Car car = new Car();

GameComponent[] wins = new GameComponent[20];

//Bricks for level 1
Rectangle rect1 = new Rectangle();
Rectangle rect2 = new Rectangle();
Rectangle rect3 = new Rectangle();
Rectangle rect4 = new Rectangle();
Rectangle rect5 = new Rectangle();
Rectangle rect6 = new Rectangle();
Rectangle rect7 = new Rectangle();
Rectangle rect8 = new Rectangle();

//bricks for level 2
Rectangle rect9 = new Rectangle();
Rectangle rect10 = new Rectangle();
Rectangle rect11 = new Rectangle();
Rectangle rect12 = new Rectangle();
Rectangle rect13 = new Rectangle();
Rectangle rect14 = new Rectangle();
Rectangle rect15 = new Rectangle();
Rectangle rect16 = new Rectangle();

Rectangle rectPerm = new Rectangle();
Rectangle rectPerm2 = new Rectangle();
Rectangle rectPerm3 = new Rectangle();
Rectangle rectPerm4 = new Rectangle();

//bricks for level 3
Rectangle rect17 = new Rectangle();
Rectangle rect18 = new Rectangle();
Rectangle rect19 = new Rectangle();
Rectangle rect20 = new Rectangle();
Rectangle rect21 = new Rectangle();
Rectangle rect22 = new Rectangle();
Rectangle rect23 = new Rectangle();
Rectangle rect24 = new Rectangle();

Rectangle rectPerm5 = new Rectangle();
Rectangle rectPerm6 = new Rectangle();
Rectangle rectPerm7 = new Rectangle();
Rectangle rectPerm8 = new Rectangle();

void setup()
{
  size(500, 500); 
  minim = new Minim(this);
  song = minim.loadFile("POL-elevators-short.wav");
  f = createFont("Arial",16,true);
   
  Lives = 3;
  xLives = 20;
  yLives = height - 20;
  score = 0;
  Level = 1;
  paddle.y = height - 50;
  counter = 16;
  begin = false;
  var = -400;
  
  
  
  //Level 1 bricks positions
  rect1.x = 5;   rect1.y = 20;
  rect2.x = 135; rect2.y = 20;
  rect3.x = 265; rect3.y = 20;
  rect4.x = 395; rect4.y = 20;
  
  rect5.x = 5;   rect5.y = 50;
  rect6.x = 135; rect6.y = 50;
  rect7.x = 265; rect7.y = 50; 
  rect8.x = 395; rect8.y = 50;
  
  // Level 2 bricks positions
  rect9.x = 100;   rect9.y = 20;
  rect10.x = 220; rect10.y = 20;
  rect11.x = 340; rect11.y = 20;
  
  rect12.x = 150;  rect12.y = 80;
  rect13.x = 270;  rect13.y = 80;
  
  rect14.x = 100; rect14.y = 140;
  rect15.x = 220; rect15.y = 140; 
  rect16.x = 340; rect16.y = 140;
  
  rectPerm.x = 50; rectPerm.y = 160;
  rectPerm2.x = 150; rectPerm2.y = 160;
  rectPerm3.x = 350; rectPerm3.y = 160;
  rectPerm4.x = 450; rectPerm4.y = 160;
  
  //Level 3 bricks positions
  rect17.x = 100;   rect17.y = 20;
  rect18.x = 216; rect18.y = 20;
  rect19.x = 332; rect19.y = 20;
  rect20.x = 100; rect20.y = 80;
  
  rect21.x = 30;   rect21.y = 50;
  rect22.x = 216; rect22.y = 80;
  rect23.x = 332; rect23.y = 80; 
  rect24.x = 395; rect24.y = 50;
  
  rectPerm5.x = 10; rectPerm5.y = 100;
  rectPerm6.x = 150; rectPerm6.y = 100;
  rectPerm7.x = 290; rectPerm7.y = 100;
  rectPerm8.x = 430; rectPerm8.y = 100;
}

void draw()
{
  if(!begin)
  {
    background(0);
    textFont(f,30);                 
    fill(255);    
    textAlign(CENTER);
    text("BRICKOUT GAME",width/2, 50);
    fill(0,0,255);
    rect(width/2 - 70,height/2, 150, 20);
    fill(255);
    ellipse(250, 200, 20, 20);
    textFont(f,20);
    text("Press any key to play",width-100, height - 50);
    if(keyPressed) { begin = true; song.loop();}
  }
  else
  {
     background(0);
     stroke(0);
     LoadAll();
 
     //Check Colision with the paddle
     float r = myCircle.size/2;
     if (myCircle.y > paddle.y - r && myCircle.y < paddle.y + paddle.Pheight && myCircle.x > paddle.x - r && myCircle.x  < paddle.x + paddle.Pwidth + r)
     {
       myCircle.ySpeed = -myCircle.ySpeed; 
     }
     
  
     if (counter <= 0) 
     {   
       myCircle.xSpeed = 0; 
       myCircle.ySpeed = 0;
       DisplayWinMessage(); 
       if (Level == 2)
       {
         myCircle.y = 400;
         myCircle.x = 250;
         myCircle.xSpeed = -4;
         myCircle.ySpeed = -6;
       }
       
       if (Level == 3)
       {
         myCircle.y = 400;
         myCircle.x = 250;
         myCircle.xSpeed = -4;
         myCircle.ySpeed = -8;
       }
      
     }
     
     if (Lives == 3)
     {
       fill(255);
       ellipse(xLives, yLives, 20,20);
       ellipse(xLives + 25, yLives, 20,20);
       ellipse(xLives + 50, yLives, 20,20);
     }
     else if(Lives == 2)
     {
       fill(255);
       ellipse(xLives, yLives, 20,20);
       ellipse(xLives + 25, yLives, 20,20);
     }
     else if(Lives == 1)
     {
       fill(255);
       ellipse(xLives, yLives, 20,20);
     }
     
     //Checking if te ball pass the paddle
     if (myCircle.y > paddle.y + 40)
     { 
        textFont(f,30);                 
        fill(255);    
        textAlign(CENTER);
        if (Lives > 0)
        {
          text("You lost a Life",width/2, height/2 + 50);
          textFont(f,16);
          text("Press any key to continue",width-150, height - 50);
          if (keyPressed)
          { 
            myCircle.y = 400;
            myCircle.x = 250;
            myCircle.xSpeed = -myCircle.xSpeed;
            myCircle.ySpeed = -myCircle.ySpeed;
            Lives = Lives - 1; 
          }
        }
        else DisplayLooseMessage();
        
     }
     
     textFont(f,20);                 
     fill(255);    
     textAlign(CENTER);
     text("Score: "+ score ,200, height - 10);
     if (Level != 4)text("Level: "+ Level ,350, height - 10);
  }
}

void CheckColissionRectCircle(Rectangle rect)
{  //there is something wrong with these colisions

   float r = (float)myCircle.size/2;
   if((myCircle.y > rect.y - r) && (myCircle.y < rect.y + rect.RectHeight + r) && (myCircle.x > rect.x - r) && (myCircle.x < rect.x + rect.RectWidth +r))
   { 
    //top-left rectangle corner
    /*if(dist(myCircle.x, myCircle.y, rect.x,rect.y) < r) 
    {
      if((myCircle.xSpeed < 0 && myCircle.ySpeed > 0)) myCircle.ySpeed = -myCircle.ySpeed;
      if((myCircle.xSpeed > 0 && myCircle.ySpeed > 0) || (myCircle.xSpeed > 0 && myCircle.ySpeed < 0)) myCircle.xSpeed = -myCircle.xSpeed;
    }
    //top-right rectangle corner
    else if(dist(myCircle.x, myCircle.y, rect.x + rect.RectWidth,rect.y) < r) 
    {
      if((myCircle.xSpeed > 0 && myCircle.ySpeed > 0) ) myCircle.ySpeed = -myCircle.ySpeed;
      if((myCircle.xSpeed < 0 && myCircle.ySpeed < 0) || (myCircle.xSpeed < 0 && myCircle.ySpeed > 0)) myCircle.xSpeed = -myCircle.xSpeed;
    }
    
    //bottom-left rectangle corner
    else if(dist(myCircle.x, myCircle.y, rect.x,rect.y + rect.RectHeight) < r) 
    {
      if((myCircle.xSpeed > 0 && myCircle.ySpeed < 0) || (myCircle.xSpeed < 0 && myCircle.ySpeed < 0)) myCircle.ySpeed = -myCircle.ySpeed;
      if(myCircle.xSpeed > 0 && myCircle.ySpeed > 0) myCircle.xSpeed = -myCircle.xSpeed;
    }
    //bottom-right rectangle corner
    else if(dist(myCircle.x, myCircle.y, rect.x + rect.RectWidth,rect.y + rect.RectHeight) < r) 
    {
      if((myCircle.xSpeed > 0 && myCircle.ySpeed < 0) || (myCircle.xSpeed < 0 && myCircle.ySpeed < 0)) myCircle.ySpeed = -myCircle.ySpeed;
      if(myCircle.xSpeed < 0 && myCircle.ySpeed > 0) myCircle.xSpeed = -myCircle.xSpeed;
    }
    */
    
    //if the ball hts letf or right sides of the rectangle I will change the xSpeed
    //if the ball hits top or bottom sides of the rectangle I will change the ySpeed  
    //if collision happends in a corner of the rectangle, it will execute first if statement and change the ySpeed
    
    if(myCircle.y > rect.y + rect.RectHeight || myCircle.y < rect.y) myCircle.ySpeed = -myCircle.ySpeed;
    else if(myCircle.x < rect.x || myCircle.x > rect.x + rect.RectWidth) myCircle.xSpeed = -myCircle.xSpeed;
     
       
     if(!rect.Permanent)
     {
       counter -= 1;
       if (rect.RectHide)
       {
         score += 10;
         rect.r = 0;
         rect.y = -100;
         rect.x = -100;
       }
       else
       {
         score += 5;
         rect.r = 255;
         rect.b = 0;
         rect.RectHide = true;
       }
     }
   }
   
}

void LoadAll()
{
     paddle.update();
     paddle.draw();
 
     myCircle.size = 20;
     myCircle.update();
     myCircle.checkCollisions();
     myCircle.draw();
 
 if(Level == 1)
 {
     rect1.update();
     rect1.draw();
     CheckColissionRectCircle(rect1);
     rect2.update();
     rect2.draw();
     CheckColissionRectCircle(rect2);
     rect3.update();
     rect3.draw();
     CheckColissionRectCircle(rect3);
     rect4.update();
     rect4.draw();
     CheckColissionRectCircle(rect4); 
     rect5.update();
     rect5.draw();
     CheckColissionRectCircle(rect5); 
     rect6.update();
     rect6.draw();
     CheckColissionRectCircle(rect6); 
     rect7.update();
     rect7.draw();
     CheckColissionRectCircle(rect7); 
     rect8.update();
     rect8.draw();
     CheckColissionRectCircle(rect8);
 }
 
 if (Level == 2)
 {
     rect9.update();
     rect9.draw();
     CheckColissionRectCircle(rect9);
     rect10.update();
     rect10.draw();
     CheckColissionRectCircle(rect10);
     rect11.update();
     rect11.draw();
     CheckColissionRectCircle(rect11);
     rect12.update();
     rect12.draw();
     CheckColissionRectCircle(rect12);
     rect13.update();
     rect13.draw();
     CheckColissionRectCircle(rect13); 
     rect14.update();
     rect14.draw();
     CheckColissionRectCircle(rect14);
     rect15.update();
     rect15.draw();
     CheckColissionRectCircle(rect15); 
     rect16.update();
     rect16.draw();
     CheckColissionRectCircle(rect16);
     
     //Permanent bricks
     rectPerm.Permanent = true;
     rectPerm.r = rectPerm.g = rectPerm.b = 96;
     rectPerm.RectHeight = 100;
     rectPerm.RectWidth = 10;
     rectPerm.update();
     rectPerm.draw();
     CheckColissionRectCircle(rectPerm);
     
     rectPerm2.Permanent = true;
     rectPerm2.r = rectPerm2.g = rectPerm2.b = 96;
     rectPerm2.RectHeight = 100;
     rectPerm2.RectWidth = 10;
     rectPerm2.update();
     rectPerm2.draw();
     CheckColissionRectCircle(rectPerm2);
     
     rectPerm3.Permanent = true;
     rectPerm3.r = rectPerm3.g = rectPerm3.b = 96;
     rectPerm3.RectHeight = 100;
     rectPerm3.RectWidth = 10;
     rectPerm3.update();
     rectPerm3.draw();
     CheckColissionRectCircle(rectPerm3);
     
     rectPerm4.Permanent = true;
     rectPerm4.r = rectPerm4.g = rectPerm4.b = 96;
     rectPerm4.RectHeight = 100;
     rectPerm4.RectWidth = 10;
     rectPerm4.update();
     rectPerm4.draw();
     CheckColissionRectCircle(rectPerm4);
 }
 
 if(Level == 3)
 {//update and draw bricks for level 3
     rect17.RectHeight = 10;
     rect17.RectWidth = 66;
     rect17.update();
     rect17.draw();
     CheckColissionRectCircle(rect17);
     rect18.RectHeight = 10;
     rect18.RectWidth = 66;
     rect18.update();
     rect18.draw();
     CheckColissionRectCircle(rect18);
     rect19.RectHeight = 10;
     rect19.RectWidth = 66;
     rect19.update();
     rect19.draw();
     CheckColissionRectCircle(rect19);
     rect20.RectHeight = 10;
     rect20.RectWidth = 66;
     rect20.update();
     rect20.draw();
     CheckColissionRectCircle(rect20);
     rect21.RectHeight = 10;
     rect21.RectWidth = 66; 
     rect21.update();
     rect21.draw();
     CheckColissionRectCircle(rect21); 
     rect22.RectHeight = 10;
     rect22.RectWidth = 66;
     rect22.update();
     rect22.draw();
     CheckColissionRectCircle(rect22);
     rect23.RectHeight = 10;
     rect23.RectWidth = 66; 
     rect23.update();
     rect23.draw();
     CheckColissionRectCircle(rect23); 
     rect24.RectHeight = 10;
     rect24.RectWidth = 66;
     rect24.update();
     rect24.draw();
     CheckColissionRectCircle(rect24);
     
     //Permanent bricks
     rectPerm5.Permanent = true;
     rectPerm5.r = rectPerm5.g = rectPerm5.b = 96;
     rectPerm5.RectHeight = 10;
     rectPerm5.RectWidth = 50;
     rectPerm5.update();
     rectPerm5.draw();
     CheckColissionRectCircle(rectPerm5);
     
     rectPerm6.Permanent = true;
     rectPerm6.r = rectPerm6.g = rectPerm6.b = 96;
     rectPerm6.RectHeight = 10;
     rectPerm6.RectWidth = 50;
     rectPerm6.update();
     rectPerm6.draw();
     CheckColissionRectCircle(rectPerm6);
     
     rectPerm7.Permanent = true;
     rectPerm7.r = rectPerm7.g = rectPerm7.b = 96;
     rectPerm7.RectHeight = 10;
     rectPerm7.RectWidth = 50;
     rectPerm7.update();
     rectPerm7.draw();
     CheckColissionRectCircle(rectPerm7);
     
     rectPerm8.Permanent = true;
     rectPerm8.r = rectPerm8.g = rectPerm8.b = 96;
     rectPerm8.RectHeight = 10;
     rectPerm8.RectWidth = 50;
     rectPerm8.update();
     rectPerm8.draw();
     CheckColissionRectCircle(rectPerm8);
 }
}

void DisplayWinMessage()
{
  
  if(Level == 1)
  {
    //make the counter = 0;
    textFont(f,20);                 
    fill(255);    
    textAlign(CENTER);
    text("CONGRATULTIONS, YOU WON LEVEL 1",width/2, height/2 + 50);
    textFont(f,16);
    text("Press any key for LEVEL 2",width-150, height - 50);
    if (keyPressed)
    {
       Level = 2;
       counter = 16; 
    }
  }
  else if(Level == 2)
  {
    //make the counter = 0;
    textFont(f,20);                 
    fill(255);    
    textAlign(CENTER);
    text("CONGRATULTIONS, YOU WON LEVEL 2",width/2, height/2 + 50);
    textFont(f,16);
    text("Press any key for LEVEL 3",width-150, height - 50);
    if (keyPressed)
    {
       Level = 3;
       counter = 16; 
    }
  }
  else if (Level == 3)
  {
    if(counter <= 0)
    {
      Level = 4;
    }
  }
  
  if(Level == 4)
  {
    textFont(f,30);                 
    fill(255);    
    textAlign(CENTER);
    text("CONGRATULTIONS, YOU WON",width/2, height/2 + 50);
  
    //drow a car
    if(var < 50 ) var += 1;
    car.x = var;
    car.y = 50;
    car.r = 255;
    car.g = 0;
    car.b = 255;
    car.update();
    car.draw();
  
    
    for(int i=0; i < wins.length; i++ )
    {
      wins[i] = new WinObject(random(width),random(height), random(255), random(255) , random(255), random(50) );
      wins[i].update();
      wins[i].draw();
    }
  
  

  }
}

void DisplayLooseMessage()
{
  textFont(f,30);                 
  fill(255);    
  textAlign(CENTER);
  text("GAME OVER",width/2, height/2 + 50);
  /*textFont(f,16);
  text("Press any key to continue",width-150, height - 50);
  if (keyPressed) myCircle.y = 200;*/
}

