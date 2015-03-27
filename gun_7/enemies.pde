class Enemies
{
  ArrayList<Enemy> enemyList_;

  float spawnX_, spawnY_;
  float spawnXGap_, spawnYGap_;
  int countOfSpawn_;
  int moveSpeedX_, moveSpeedY_;
  
  int enemyPower_;

  Enemies(float spawnX, float spawnY, float spawnXGap, float spawnYGap, int countOfSpawn,
    int moveSpeedX, int moveSpeedY, int enemyPower)
  {
    enemyList_ = new ArrayList<Enemy>();
    spawnX_ = spawnX;
    spawnY_ = spawnY;
    spawnXGap_ = spawnXGap;
    spawnYGap_ = spawnYGap;
    countOfSpawn_ = countOfSpawn;
    moveSpeedX_ = moveSpeedX;
    moveSpeedY_ = moveSpeedY;
    enemyPower_ = enemyPower;
  }
  
  void spawnEnemy()
  {
    for (int i = 0; i < countOfSpawn_; i++)
    {
      float x = spawnX_ + i * spawnXGap_;
      float y = spawnYGap_ + i * spawnYGap_;
      enemyList_.add(new Enemy(x, y, enemyPower_));
    }
  }
  
  void doEnemyAction(Base b)
  {
    for (Enemy e : enemyList_)
    {
      if (!e.tryAttack(b))
      {
        e.move(e.getCoordX() + moveSpeedX_, e.getCoordY() + moveSpeedY_);
      }
    }
  }
  
  int tryHit(float bulletX, float bulletY)
  {
    int hit = 0;

    for (int i = 0; i < enemyList_.size(); )
    {
      Enemy e = enemyList_.get(i);
      if (e.isHitted(bulletX, bulletY))
      {
        enemyList_.remove(i);
        hit++;
      }
      else
      {
        i++;
      }
    }
    
    return hit;
  }

  void display()
  {
    for (Enemy e : enemyList_)
      e.display();
  }
}
