final int AfterImageDelTimer = 0;
final int AfterImageDelFreq = 333;
final int SpawnEnemyTimer = 1;
final int SpawnEnemyFreq = 2000;
final int EnemyActionTimer = 2;
final int EnemyActionFreq = 1000;

final int EnemyPower = 10;

Gun gun;

Base base;
Enemies enemies;

Timer timer;

int score = 0;

void setup()
{
  size(600, 400);

  gun = new Gun();
  base = new Base(430, 10, 160, 380, 100, 10);
  enemies = new Enemies(10, 10, 0, 40, 8, 10, 0, EnemyPower);
  timer = new Timer();

  timer.addTimer(SpawnEnemyTimer, SpawnEnemyFreq, true);
  timer.addTimer(EnemyActionTimer, EnemyActionFreq, true);
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
      
      // gun is fired
      int hit = enemies.tryHit(fi.x, fi.y);
      if (hit > 0)
      {
        score += hit * 100 + (hit - 1) * (hit - 1);
        println(hit + " killed!! [score:" + score + "]");
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
  else if (timer_hit == SpawnEnemyTimer)
  {
    enemies.spawnEnemy();
  }
  else if (timer_hit == EnemyActionTimer)
  {
    enemies.doEnemyAction(base);
  }

  if (base.isDie())
  {
    println(">> you lose <<");
    noLoop();
  }

  base.display();
  enemies.display();

  gun.display();
}

