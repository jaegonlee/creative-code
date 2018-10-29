PImage img;
int smallPoint, largePoint;
int i = 0;

void setup() {
  size(600, 600);
  img = loadImage("moonwalk.jpg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  stroke(pix);
  line(i,0,i,600);
  i++;
  i%=600;
}
