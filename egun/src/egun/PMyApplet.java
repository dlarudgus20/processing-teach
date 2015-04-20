package egun;

import processing.core.*;

public class PMyApplet extends PApplet
{
	private static final long serialVersionUID = -1176777433010750858L;

	private static final int AfterImageDelTimer = 0;
	private static final int AfterImageDelFreq = 333;
	private static final int SpawnEnemyTimer = 1;
	private static final int SpawnEnemyFreq = 2000;
	private static final int EnemyActionTimer = 2;
	private static final int EnemyActionFreq = 1000;

	private static final int EnemyPower = 10;

	private Gun gun;

	private Base base;
	private Enemies enemies;

	private Timer timer;

	private int score = 0;

	@Override
	public void setup()
	{
		size(600, 400);

		gun = new Gun();
		base = new Base(430, 10, 160, 380, 100, 10);
		enemies = new Enemies(10, 10, 0, 40, 8, 10, 0, EnemyPower);
		timer = new Timer();

		timer.addTimer(SpawnEnemyTimer, SpawnEnemyFreq, true);
		timer.addTimer(EnemyActionTimer, EnemyActionFreq, true);
	}

	@Override
	public void draw()
	{
		background(180);

		if (mousePressed)
		{
			Gun.FireInfo fi = gun.fire(this, mouseX, mouseY);
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

		int timer_hit = timer.update(1000.0f / frameRate);
		if (timer_hit == AfterImageDelTimer)
		{
			if (!gun.deleteCrosshairAfterImage())
			{
				timer.enableTimer(AfterImageDelTimer, false, true);
			}
		}
		else if (timer_hit == SpawnEnemyTimer)
		{
			enemies.spawnEnemy(this);
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

		base.display(this);
		enemies.display(this);

		gun.display(this, mouseX, mouseY);
	}
}
