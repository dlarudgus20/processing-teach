package egun;

import processing.core.*;

class Enemy
{
	private PImage enemyImage, maskImage;
	private int attackPower;
	private float enemyX, enemyY;

	public Enemy(PApplet applet, float x, float y, int power)
	{
		enemyImage = applet.loadImage("enemy.png");
		maskImage = applet.loadImage("enemy_mask.png");
		enemyImage.mask(maskImage);
		
		maskImage.loadPixels();

		attackPower = power;

		enemyX = x;
		enemyY = y;
	}

	public float getCoordX()
	{
		return enemyX;
	}
	public float getCoordY()
	{
		return enemyY;
	}
	
	public void move(float x, float y)
	{
		enemyX = x;
		enemyY = y;
	}
	
	public boolean isHitted(float bulletX, float bulletY)
	{
		// first check
		if (enemyX <= bulletX && bulletX <= enemyX + enemyImage.width
				&& enemyY <= bulletY && bulletY <= enemyY + enemyImage.height)
		{
			// second check
			int x = (int)(bulletX - enemyX);
			int y = (int)(bulletY - enemyY);
			if (maskImage.pixels[x + enemyImage.width * y] == 0xffffffff)
			{
				return true;
			}
		}
		
		return false;
	}
	
	public boolean tryAttack(Base b)
	{
		if (b.isInAttackArea(enemyX, enemyY, enemyImage.width, enemyImage.height))
		{
			PApplet.println("attack on" + this);
			b.attacked(attackPower);
			return true;
		}
		
		return false;
	}
	
	public void display(PApplet applet)
	{
		applet.image(enemyImage, enemyX, enemyY);
	}
}
