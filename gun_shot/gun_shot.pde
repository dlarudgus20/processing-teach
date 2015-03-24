shot myshot;

void setup()
{
  size(640, 360);
  noSmooth();
  fill(126);
  myshot = new shot(0, 12, 1, 0);
}

void draw()
{
  background(102);
  
  if (mousePressed)
    myshot.fire();
  else
    myshot.release();

  myshot.display();
}
