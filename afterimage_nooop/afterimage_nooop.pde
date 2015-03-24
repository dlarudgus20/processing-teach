final float MainRadius = 50;
final int prevMaxCount = 10;

float[] prevX = new float[prevMaxCount];
float[] prevY = new float[prevMaxCount];
int prevCount = 0;

void setup()
{
  size(600, 400);
  noStroke();
}

final int DeletionFreq = 2;
int TimeOutForDelete = DeletionFreq;

void draw()
{
  background(180);

  float alpha = 0xff;
  float radius = MainRadius;

  fill(0xff, 0xff, 0xff, alpha);
  ellipse(mouseX, mouseY, radius, radius);

  for (int i = prevCount - 1; i >= 0; i--)
  {
    alpha *= 0.75;
    radius *= 0.95;
    fill(0xff, 0xff, 0xff, alpha);
    ellipse(prevX[i], prevY[i], radius, radius);
  }


  TimeOutForDelete--;
  if (TimeOutForDelete == 0)
  {
    TimeOutForDelete = DeletionFreq;
    if (prevCount > 0)
    {
      prevCount--;
      for (int i = 0; i < prevCount; i++)
      {
        prevX[i] = prevX[i + 1];
        prevY[i] = prevY[i + 1];
      }
    }
  }

  if (pmouseX != mouseX || pmouseY != mouseY)
  {
    if (prevCount < prevMaxCount)
    {
      prevX[prevCount] = pmouseX;
      prevY[prevCount] = pmouseY;
      prevCount++;
    }
  }
}

