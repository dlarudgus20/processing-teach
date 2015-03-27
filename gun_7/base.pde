class Base
{
  float baseX, baseY, baseWidth, baseHeight;
  float attackAreaSize;
  int baseHp, baseMaxHp;

  Base(float x, float y, float wid, float hei, int maxHp, float attackAreaSz)
  {
    baseX = x;
    baseY = y;
    baseWidth = wid;
    baseHeight = hei;
    baseHp = baseMaxHp = maxHp;
    attackAreaSize = attackAreaSz;
  }
  
  boolean isDie()
  {
    return (baseHp <= 0);
  }

  boolean isInAttackArea(float x, float y, float wid, float hei)
  {
    return (baseX - attackAreaSize <= x + wid &&
      baseY - attackAreaSize <= y + hei &&
      baseX + baseWidth + attackAreaSize >= x &&
      baseY + baseHeight + attackAreaSize >= y);
  }
  
  void attacked(int damage)
  {
    baseHp = max(baseHp - damage, 0);
  }

  void display()
  {
    noStroke();

    // body
    fill(0xff90ff33);
    rect(baseX, baseY, baseWidth, baseHeight);
    
    // HP bar
    float gapX = baseWidth / 10;
    float gapY = min(gapX, baseHeight / 10);
    float x = baseX + gapX;
    float y = baseY + gapY;
    float wid = baseWidth - gapX * 2;
    float hei = baseHeight - gapY * 2;
    fill(0xff000000);
    rect(x, y, wid, gapY);
    fill(0xffff0000);
    rect(x, y, wid * (float(baseHp) / baseMaxHp), gapY);
  }
}
