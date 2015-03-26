Gun gun;
Enemy enemy;
Timer timer;

final int AfterImageDelTimer = 0;
final int AfterImageDelFreq = 333;

void setup()
{
  size(600, 400);

  gun = new Gun();
  enemy = new Enemy(0, 0);
  timer = new Timer();
}

void draw()
{
  background(180);

  if (mousePressed)
  {
    Gun.FireInfo fi = gun.fire();
    if (fi.fired)
    {
      if (!timer.addTimer(AfterImageDelTimer, AfterImageDelFreq, true))
      {
        timer.enableTimer(AfterImageDelTimer, true, true);
      }
      
      if (enemy.isHitted(fi.x, fi.y))
      {
        println("hitted");
      }
    }
  }
  else
  {
    gun.releaseCrosshair();
  }

  int timer_hit = timer.update(1000.0 / frameRate);
  if (timer_hit == AfterImageDelTimer)
  {
    if (!gun.deleteCrosshairAfterImage())
    {
      timer.enableTimer(AfterImageDelTimer, false, true);
    }
  }

  noStroke();
  enemy.display();

  gun.display();
}

