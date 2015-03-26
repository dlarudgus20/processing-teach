PImage myImage;

void setup()
{
  myImage = loadImage("enemy.png");
  myImage.loadPixels();
  for (int i = 0; i < myImage.width * myImage.height; i++)
  {
    if (myImage.pixels[i] == 0xffffffff)
    {
      myImage.pixels[i] = 0xff000000;
    }
    else
    {
      myImage.pixels[i] = 0xffffffff;
    }
  }
  myImage.updatePixels();
  myImage.save("mask.png");
  println("mask.png was made.");
 
  size(800, 600);
}

void draw()
{
  image(myImage, 0, 0);
}
