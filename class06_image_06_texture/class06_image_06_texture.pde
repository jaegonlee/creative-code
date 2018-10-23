PImage img;

void setup() {
  size(400, 400, P2D);
  img = loadImage("durer.jpg");
}


void draw() {
  background(0);

  beginShape();
  texture(img);
  vertex(0, 0, 0, 0);  
  vertex(400, 0, 400, 0);  
  vertex(400, 400, 400, 400);  
  vertex(0, 400, 0, 400);  
  endShape();
}
