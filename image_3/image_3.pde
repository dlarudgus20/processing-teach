PImage myImage, myMaskImg;

void setup()
{
  myImage = loadImage("enemy.png");
  myMaskImg = loadImage("mask.png");
  myImage.mask(myMaskImg);
 
  size(800, 600);
}

void draw()
{
  image(myImage, 0, 0);
}
