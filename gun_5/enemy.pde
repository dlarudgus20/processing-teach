class Enemy
{
  PImage enemyImage, maskImage;
  
  float enemyX, enemyY;

  Enemy(float x, float y)
  {
    enemyImage = loadImage("enemy.png");
    maskImage = loadImage("enemy_mask.png");
    enemyImage.mask(maskImage);
    
    maskImage.loadPixels();
    
    enemyX = x;
    enemyY = y;
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
  
  void display()
  {
    image(enemyImage, enemyX, enemyY);
  }
}
