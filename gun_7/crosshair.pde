class Crosshair
{
  float crossGap, crossLength;
  float maxRejection;

  float rejection;
  float incOfReject;
  float decOfReject;
  float frame;

  Crosshair(float shr, float sha, float shb, float shf,
    float maxReject, float gap, float len)
  {
    crossGap = gap;
    crossLength = len;
    maxRejection = maxReject;

    rejection = shr;
    incOfReject = sha;
    decOfReject = shb;
    frame = shf;
  }
  
  float getRejection()
  {
    return rejection;
  }
  
  boolean fire()
  {
    if(frame==0)
    {
      rejection=min(rejection+incOfReject,maxRejection);
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

  void display(float x, float y)
  {
    stroke(0);
    line(x-crossLength-rejection, y, x-crossGap-rejection, y);
    line(x+crossLength+rejection, y, x+crossGap+rejection, y);
    line(x, y-crossLength-rejection, x, y-crossGap-rejection);
    line(x, y+crossLength+rejection, x, y+crossGap+rejection);
  }
}
