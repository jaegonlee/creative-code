// code from minha.y and jihoon.b
import processing.video.*;
Capture cam;

// ball
float ballX, ballY;// location
float velX, velY;// velocity
float gravity = 0.1;  // gravity

void setup() {
  size(640, 480, P2D);
  cam = new Capture(this, 64, 48);
  ballX = 320;
  ballY = 10;
  velX = 0;
  velY = 0; 
  noStroke();
  cam.start();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    background(255);
    for (int y = 0; y<48; y++) {
      for (int x = 0; x<64; x++) {
        int br = int(brightness(cam.get(x, y)));
        if (br < mouseX) {
          fill(200);
          rect(x*10, y*10, 10, 10);
        }
      }
    }

    // reaction

    // movement
  }
}
