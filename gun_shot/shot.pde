class shot
{
  float r;
  float a;
  float b;
  float t;

  shot(float shr, float sha, float shb, float sht)
  {
    r=shr;
    a=sha;
    b=shb;
    t=sht;
  }
  
  void fire()
  {
    if(t==0)
    {
      r+=a;
      t+=8;
    } else {
      r-=b;
      t-=1;
    }
  }

  void release()
  {
    t=0;
    if(r>0)
    {
      r-=1;
    }
  }

  void display()
  {
    if(r>50)
    {
      r=50;
    }
    line(mouseX-44-r, mouseY, mouseX-11-r, mouseY);
    line(mouseX+44+r, mouseY, mouseX+11+r, mouseY);
    line(mouseX, mouseY-44-r, mouseX, mouseY-11-r);
    line(mouseX, mouseY+44+r, mouseX, mouseY+11+r);
  }
}
