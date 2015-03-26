void setup()
{
  println(gcd(4, 2));
  println(gcd(36, 21));
}

int gcd(int a, int b)
{
  if (a < b)
    return gcd(b, a);
  else if(a % b == 0)
    return b;
  else
    return gcd(b, a % b);
}
