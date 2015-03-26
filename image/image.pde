PImage myImage;

void setup()
{
  myImage = loadImage("enemy.png");
  size(800, 600);
}

void draw()
{
  image(myImage, 0, 0);
}
