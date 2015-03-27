class Enemy
{
  PImage enemyImage, maskImage;

  int attackPower;

  float enemyX, enemyY;

  Enemy(float x, float y, int power)
  {
    enemyImage = loadImage("enemy.png");
    maskImage = loadImage("enemy_mask.png");
    enemyImage.mask(maskImage);
    
    maskImage.loadPixels();

    attackPower = power;

    enemyX = x;
    enemyY = y;
  }

  float getCoordX()
  {
    return enemyX;
  }
  float getCoordY()
  {
    return enemyY;
  }
  
  void move(float x, float y)
  {
    enemyX = x;
    enemyY = y;
  }
  
  boolean isHitted(float bulletX, float bulletY)
  {
    // first check
    if (enemyX <= bulletX && bulletX <= enemyX + enemyImage.width
        && enemyY <= bulletY && bulletY <= enemyY + enemyImage.height)
    {
      // second check
      int x = int(bulletX - enemyX);
      int y = int(bulletY - enemyY);
      if (maskImage.pixels[x + enemyImage.width * y] == 0xffffffff)
      {
        return true;
      }
    }
    
    return false;
  }
  
  boolean tryAttack(Base b)
  {
    if (b.isInAttackArea(enemyX, enemyY, enemyImage.width, enemyImage.height))
    {
      println("attack on" + this);
      b.attacked(attackPower);
      return true;
    }
    
    return false;
  }
  
  void display()
  {
    image(enemyImage, enemyX, enemyY);
  }
}
