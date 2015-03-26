Crosshair cross = new Crosshair(0, 12, 1, 0, 50, 44, 11);
Ball track = null;

Enemy enemy;

Timer timer;

final int AfterImageDelTimer = 0;
final int AfterImageDelFreq = 333;

void setup()
{
  size(600, 400);

  enemy = new Enemy(0, 0);
 
  timer = new Timer();
}

void draw()
{
  background(180);

  if (mousePressed)
  {
    if (cross.fire())
    {
      float fireError = 0.2 * cross.getRejection();

      float firedX = mouseX + random(-fireError, fireError);
      float firedY = mouseY + random(-fireError, fireError);
  
      if (track == null)
      {
        track = new Ball(firedX, firedY, 5, 25,
          0xffff0000, 0.75, 1);
      }
      else
      {
        if (!track.createAfterImage(firedX, firedY))
        {
          track.deleteAfterImage();
          track.createAfterImage(firedX, firedY);
        }
      }

      if (!timer.addTimer(AfterImageDelTimer, AfterImageDelFreq, true))
      {
        timer.enableTimer(AfterImageDelTimer, true, true);
      }
      
      if (enemy.isHitted(firedX, firedY))
      {
        println("hitted");
      }
    }
  }
  else
  {
    cross.release();
  }

  int timer_hit = timer.update(1000.0 / frameRate);
  if (timer_hit == AfterImageDelTimer)
  {
    if (!track.deleteAfterImage())
    {
      track = null;
      timer.enableTimer(AfterImageDelTimer, false, true);
    }
  }

  noStroke();

  enemy.display();

  if (track != null)
  {
    track.display();
  }

  stroke(0);
  cross.display(mouseX, mouseY);
}

