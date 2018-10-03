PGraphics pg;

void setup() {
  size(800, 500);
  background(255);
  pg = createGraphics(width,height);
  pg.beginDraw();
  pg.background(255);
  pg.fill(0);
  pg.textSize(300);
  pg.text("TYPE", 50, 350);
  pg.endDraw();
}

void draw() {
  noStroke();
  for (int i = 0; i<20; i++) {
    float x = random(width);
    float y = random(height);
    color c = pg.get( int(x), int(y));
    if (brightness(c) < 128) {
      fill(random(200, 255), random(200), random(20), 100);
      float size = random(5, 20);
      ellipse(x, y, size, size);
    } else {
      //fill(255, 255, 255);
    }
  }
  //image(pg, mouseX, mouseY);
}
