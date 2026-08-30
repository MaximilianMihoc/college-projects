class LifeBoard
{
  boolean[][] current;
  boolean[][] next;

  int cellWidth = 4;
  int cellHeight = 4;
  int boardWidth;
  int boardHeight;

  LifeBoard()
  {
    boardWidth = width/cellWidth;
    boardHeight = (height-30)/cellHeight;
    current = new boolean[boardHeight][boardWidth];
    next = new boolean[boardHeight][boardWidth];
    randomise();
  }

  void update()
  {
    //clear all elements in next array
    clearBoard(next);

    // check rules    
    for (int y=0; y < boardHeight; y++)
      for (int x=0; x < boardWidth; x++)
      {
        int count = countLiveCellsSurrounding(x, y);


        //first rule -> under-population
        if (isOn(x, y) && count < 2) next[y][x] = false;
        //second rule -> go to next generation
        if (isOn(x, y) && (count == 2 || count == 3)) next[y][x] = true;
        //third rule -> overcrowding
        if (isOn(x, y) && count > 3) next[y][x] = false;
        //forth rule -> reproduction
        if (!isOn(x, y) && count == 3) next[y][x] = true;
      }

    //swap the current and next arrays, what is in next goes in current
    boolean[][] temp;
    temp = current;
    current = next;
    next = temp;
  }

  void draw()
  {
    stroke(255, 0, 0);
    for (int i=0; i < boardHeight; i++)
      for (int j=0; j < boardWidth; j++)
      {
        if (isOn(j, i)) 
        {
          int cellX = j * cellWidth;
          int cellY = i * cellWidth;
          fill(0);
          rect(cellX, cellY, cellWidth, cellHeight);
        }
        else
         {
           int cellX = j * cellWidth;
          int cellY = i * cellWidth;
          fill(255);
          rect(cellX, cellY, cellWidth, cellHeight);
         }
      }
  }

  void on(int x, int y)
  {
    if ( (x >= 0) && (x < boardWidth) && (y >=0) && (y < boardHeight))
      current[y][x] = true;
  }

  void off(int x, int y)
  {
    if ( (x >= 0) && (x < boardWidth) && (y >=0) && (y < boardHeight))
      current[y][x] = false;
  }

  boolean isOn(int x, int y)
  {
    if ( (x >= 0) && (x < boardWidth) && (y >=0) && (y < boardHeight))
    {
      return current[y][x];
    }
    return false;
  }

  void clearBoard(boolean[][] board)
  {
    for (int i=0; i < boardHeight; i++)
      for (int j=0; j < boardWidth; j++)
        board[i][j] = false;
  }

  void randomise()
  {
    /*for (int i=0; i < boardHeight; i++)
     for(int j=0; j < boardWidth; j++)
     {
     float r = random(1);
     if(r > 0.5) on(i,j);
     else off(i,j);
     }*/

    int live = (boardWidth * boardHeight) / 2;
    while (live > 0)
    {
      int x = (int) random(boardWidth);
      int y = (int) random(boardHeight);

      if (!isOn(x, y))
      {
        on(x, y);
        live --;
      }
    }
  }

  int countLiveCellsSurrounding(int x, int y)
  {
    /*int count = 0;
     int stx; 
     int sty;
     int endx;
     int endy;
     
     //check the cells at the edge of the board
     if(x == 0) stx = x;
     else stx = x-1;
     
     if(y == 0) sty = y;
     else sty = y - 1;
     
     if(x == boardWidth) endx = x;
     else endx = x + 1;
     
     if(y == boardHeight) endy = y;
     else endy = y + 1;
     
     for (int i = stx; i < endx; i++)
     for(int j = sty; j < endy; j++)
     {
     if ((i != x || j != y) && isOn(i,j)) count ++;
     }
     
     return count;*/

    //prof
    int count=0;
    if (isOn(x-1, y-1))
    {
      count ++;
    }
    if (isOn(x, y-1))
    {
      count ++;
    }
    if (isOn(x + 1, y - 1))
    {
      count ++;
    }
    if (isOn(x - 1, y))
    {
      count ++;
    }
    if (isOn(x + 1, y))
    {
      count ++;
    }
    if (isOn(x - 1, y + 1))
    {
      count ++;
    }
    if (isOn(x, y + 1))
    {
      count ++;
    }
    if (isOn(x + 1, y + 1))
    {
      count ++;
    }

    return count;
  }

  void Blinker()
  {
    int x = mouseX/cellWidth;
    int y = mouseY/cellHeight;
    on(x,y);
    on(x,y+1);
    on(x,y+2);
  }
  void Block()
  {
    int x = mouseX/cellWidth;
    int y = mouseY/cellHeight;
    on(x,y);
    on(x,y+1);
    on(x+1,y);
    on(x+1,y+1);
  }
  
  void Glider()
  {
    int x = mouseX/cellWidth;
    int y = mouseY/cellHeight;
    on(x,y);
    on(x+1,y);
    on(x+2,y);
    on(x+2,y-1);
    on(x+1,y-2);
  }
  
  void LightweightSpaceship()
  {
    int x = mouseX/cellWidth;
    int y = mouseY/cellHeight;
    //draw left block
    on(x,y);
    on(x,y+1);
    on(x+1,y);
    on(x+1,y+1);
    //draw first object
    on(x+10, y);
    on(x+10, y+1);
    on(x+10, y+2);
    on(x+11, y-1);
    on(x+11, y+3);
    on(x+12, y-2);
    on(x+13, y-2);
    on(x+12, y+4);
    on(x+13, y+4);
    on(x+12, y-2);
    on(x+14, y+1);
    on(x+15, y-1);
    on(x+15, y+3);
    on(x+16, y);
    on(x+16, y+1);
    on(x+16, y+2);
    on(x+17, y+1);
    
    //draw second object
    on(x+20, y);
    on(x+20, y-1);
    on(x+20, y-2);
    on(x+21, y);
    on(x+21, y-1);
    on(x+21, y-2);
    on(x+22, y-3);
    on(x+22, y+1);
    on(x+24, y-3);
    on(x+24, y-4);
    on(x+24, y+1);
    on(x+24, y+2);
    
    //draw last square
    on(x+34, y-1);
    on(x+34, y-2);
    on(x+35, y-1);
    on(x+35, y-2);
  }
}

