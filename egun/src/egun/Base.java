package egun;

import processing.core.*;

class Base
{
	private float baseX, baseY, baseWidth, baseHeight;
	private float attackAreaSize;
	private int baseHp, baseMaxHp;

	public Base(float x, float y, float wid, float hei, int maxHp, float attackAreaSz)
	{
		baseX = x;
		baseY = y;
		baseWidth = wid;
		baseHeight = hei;
		baseHp = baseMaxHp = maxHp;
		attackAreaSize = attackAreaSz;
	}
	
	public boolean isDie()
	{
		return (baseHp <= 0);
	}

	public boolean isInAttackArea(float x, float y, float wid, float hei)
	{
		return (baseX - attackAreaSize <= x + wid &&
			baseY - attackAreaSize <= y + hei &&
			baseX + baseWidth + attackAreaSize >= x &&
			baseY + baseHeight + attackAreaSize >= y);
	}
	
	public void attacked(int damage)
	{
		baseHp = PApplet.max(baseHp - damage, 0);
	}

	public void display(PApplet applet)
	{
		applet.noStroke();

		// body
		applet.fill(0xff90ff33);
		applet.rect(baseX, baseY, baseWidth, baseHeight);
		
		// HP bar
		float gapX = baseWidth / 10;
		float gapY = PApplet.min(gapX, baseHeight / 10);
		float x = baseX + gapX;
		float y = baseY + gapY;
		float wid = baseWidth - gapX * 2;
		applet.fill(0xff000000);
		applet.rect(x, y, wid, gapY);
		applet.fill(0xffff0000);
		applet.rect(x, y, wid * ((float)baseHp / baseMaxHp), gapY);
	}
}
