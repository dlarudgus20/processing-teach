class Crosshair
{
  float rejection;
  //amount of rejection
  float incOfReject;
  float decOfReject;
  float frame;

  Crosshair(float shr, float sha, float shb, float shf)
  {
    rejection = shr;
    incOfReject = sha;
    decOfReject = shb;
    frame = shf;
  }
  
  boolean fire()
  {
    if(frame==0)
    {
      rejection+=incOfReject;
      frame+=8;
      return true;
    } else {
      rejection-=decOfReject;
      frame-=1;
      return false;
    }
  }

  void release()
  {
    frame=0;
    if(rejection>0)
    {
      rejection-=1;
    }
  }

  void display()
  {
    if(rejection>50)
    {
      rejection=50;
    }
    line(mouseX-44-rejection, mouseY, mouseX-11-rejection, mouseY);
    line(mouseX+44+rejection, mouseY, mouseX+11+rejection, mouseY);
    line(mouseX, mouseY-44-rejection, mouseX, mouseY-11-rejection);
    line(mouseX, mouseY+44+rejection, mouseX, mouseY+11+rejection);
  }
}
  
