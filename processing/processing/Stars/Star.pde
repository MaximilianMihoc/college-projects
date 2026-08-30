class Star extends GameComponent
{
  
  float theta;
  float direction;
  float radius2;
  int numPoints;
  
  void update()
  {
    theta += direction;
  }
  
  Star()
  {
    x = 0;
    y = 0;
    theta = 0.0f;
    direction = 0.0f;
    r = 255;
    g = 255;
    b = 255;
    radius = 50.0f;
    radius2 = 25.0f;
    numPoints = 6;
  }
  
  void draw()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    stroke(r, g, b);
    
    //Drawing code here
    
    float angleInc = TWO_PI / numPoints; 
    /*This is another way of looping through all star points
    for (float angle = 0; angle <= TWO_PI; angle = angle + angleInc)
    {
      float cX, cY;
      cX = sin(angle) * radius;
      cY = -cos(angle) * radius;
      ellipse(cX, cY, 10, 10);
    }*/
    float lastX, lastY;
    lastX = 0;
    lastY = -radius;
  
    for (int i = 0; i <= numPoints; i ++)
    {
      
      float angle = i * angleInc;
      
      float cX = sin(angle) * radius;
      float cY = -cos(angle) * radius;
      //ellipse(cX, cY, 10, 10);
      line(lastX, lastY, cX, cY);
      
      lastX = cX;
      lastY = cY;
      
      cX = sin(angle + (angleInc/2.0)) * radius2;
      cY = -cos(angle + (angleInc/2.0)) * radius2;
      line(lastX, lastY, cX, cY);
      lastX = cX;
      lastY = cY;
      
    }
    //prof part
    /*float angleInc = TWO_PI / (numPoints*2);
    for(int i=0; i<=(numPoints*2); i++)
    {
      float theta = i * thetaInc;
      float x,y;
      if (i % 2 == 1)
      {
        float x =  sin(angle) * radius;
        float y = -cos(angle) * radius;
      }
      else
      {
        x =  sin(angle) * (radius/2.0f);
        y = -cos(angle) * (radius / 2.0f);
      }
      
      line(lastX, lastY, cX, cY);
      lastX = x;
      lastY = y;
    }*/
    
    
    
    
    
    
    
    popMatrix();
  }
  
}
