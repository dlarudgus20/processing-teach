class Ball
{
  float mainRadius;
  int prevMaxCount;
  
  int ballColor;
  float alphaFactor, radiusFactor;
  
  float[] prevX, prevY;
  int prevCount;
  
  float ballX, ballY;
  
  Ball(float x, float y, float radius, int prev,
    int c, float aFactor, float rFactor)
  {
    mainRadius = radius;
    prevMaxCount = prev;
    
    ballColor = c;
    alphaFactor = aFactor;
    radiusFactor = rFactor;
    
    prevX = new float[prev];
    prevY = new float[prev];
    prevCount = 0;
    
    ballX = x;
    ballY = y;
  }
  
  boolean createAfterImage(float new_x, float new_y)
  {
    if (prevCount < prevMaxCount)
    {
      prevX[prevCount] = ballX;
      prevY[prevCount] = ballY;
      prevCount++;
      
      ballX = new_x;
      ballY = new_y;
      
      return true;
    }
    else
    {
      return false;
    }
  }

  boolean deleteAfterImage()
  {
    if (prevCount > 0)
    {
      prevCount--;
      for (int i = 0; i < prevCount; i++)
      {
        prevX[i] = prevX[i + 1];
        prevY[i] = prevY[i + 1];
      }
      
      return true;
    }
    else
    {
      return false;
    }
  }

  void display()
  {
    noStroke();

    float alpha = alpha(ballColor);
    float radius = mainRadius;

    fill(red(ballColor), green(ballColor), blue(ballColor), alpha);
    ellipse(ballX, ballY, radius, radius);
  
    for (int i = prevCount - 1; i >= 0; i--)
    {
      alpha *= alphaFactor;
      radius *= radiusFactor;
      fill(red(ballColor), green(ballColor), blue(ballColor), alpha);
      ellipse(prevX[i], prevY[i], radius, radius);
    }
  }
}
