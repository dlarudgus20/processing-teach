class Crosshair
{
  float crossGap, crossLength;
  float maxRejection;

  float rejection;
  //amount of rejection
  float incOfReject;
  float decOfReject;
  float frame;

  float crossX, crossY;

  Crosshair(float x, float y,
    float shr, float sha, float shb, float shf,
    float maxReject, float gap, float len)
  {
    crossGap = gap;
    crossLength = len;
    maxRejection = maxReject;

    rejection = shr;
    incOfReject = sha;
    decOfReject = shb;
    frame = shf;
    
    crossX = x;
    crossY = y;
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
  
  void move(float x, float y)
  {
    crossX = x;
    crossY = y;
  }

  void display()
  {
    if(rejection>maxRejection)
    {
      rejection=maxRejection;
    }
    line(crossX-crossLength-rejection, crossY, crossX-crossGap-rejection, crossY);
    line(crossX+crossLength+rejection, crossY, crossX+crossGap+rejection, crossY);
    line(crossX, crossY-crossLength-rejection, crossX, crossY-crossGap-rejection);
    line(crossX, crossY+crossLength+rejection, crossX, crossY+crossGap+rejection);
  }
}
  
