import geomerative.*;           
import processing.pdf.*;       

boolean saveOneFrame = false;   
RShape shape;                   
RPoint[][] allPaths;            

void setup() {
  size(1280, 720);
  RG.init(this);
  RFont font = new RFont("FreeSans.ttf", 350);
  shape = font.toShape("CODE");
  shape.translate(width/2 - shape.getWidth()/2, height/2 + shape.getHeight()/2);
  RCommand.setSegmentLength(10); 
  allPaths = shape.getPointsInPaths();
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, "type-" + timestamp() + ".pdf");
  }
  background(255);
  noFill();
  stroke(0, 225, 255);
  //shape.draw();

  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (RPoint[] singlePath : allPaths) {
    for (RPoint p : singlePath) {
      vertex(p.x, p.y);
    }
  }
  endShape();

  stroke(0, 125);
  strokeWeight(0.75);
  for (RPoint[] singlePath : allPaths) {
    int x = 0;
    int y = 0;
    int centerX = 0;
    int centerY = 0;

    for (RPoint p : singlePath) {
      x += p.x;
      y += p.y;
      centerX = x / singlePath.length;
      centerY = y / singlePath.length;
    }
    for (RPoint p : singlePath) {
      line(p.x, p.y, centerX, centerY);
      //      ellipse(p.x, p.y, random(40), random(40));
    }
  }
  if (saveOneFrame) {
    endRecord();
    saveOneFrame = false;
  }
}

void keyPressed() {
  if (key == 's') { 
    saveOneFrame = true;
  }
}

String timestamp() {
  return year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
}
