class Gun
{
  Crosshair cross;
  Ball track;
  Timer timer;
  
  Gun()
  {
    cross = new Crosshair(0, 12, 1, 0, 50, 44, 11);
    track = null;
  }

  class FireInfo
  {
    float x, y;
    boolean fired;
  }
  FireInfo fire()
  {
    FireInfo ret = new FireInfo();

    if (cross.fire())
    {
      ret.fired = true;

      float fireError = 0.5 * cross.getRejection();

      ret.x = mouseX + random(-fireError, fireError);
      ret.y = mouseY + random(-fireError, fireError);
  
      if (track == null)
      {
        track = new Ball(ret.x, ret.y, 5, 25,
          0xffff0000, 0.75, 1);
      }
      else
      {
        if (!track.createAfterImage(ret.x, ret.y))
        {
          track.deleteAfterImage();
          track.createAfterImage(ret.x, ret.y);
        }
      }
    }
    else
    {
      ret.fired = false;
    }
    
    return ret;
  }
  
  void releaseCrosshair()
  {
    cross.release();
  }
  
  boolean deleteCrosshairAfterImage()
  {
    if (track.deleteAfterImage())
    {
      return true;
    }
    else
    {
      track = null;
      return false;
    }
  }
  
  void display()
  {
    if (track != null)
    {
      track.display();
    }

    cross.display(mouseX, mouseY);
  }
}
