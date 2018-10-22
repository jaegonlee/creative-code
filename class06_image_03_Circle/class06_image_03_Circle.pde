PImage img;
float i = 0;

void setup() {
  size(600, 600);
  pixelDensity(2);
  img = loadImage("2.jpg");
  imageMode(CENTER);
  background(255);
}

void draw() { 
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);

  stroke(pix, 25);
  noFill();
  float rx = cos(radians(i)) * 300 + 300;
  float ry = sin(radians(i)) * 300 + 300;
  beginShape();
  vertex(300, 300);
  vertex(rx, ry);
  endShape();
  i+=1.0;
  i%=360;
}
