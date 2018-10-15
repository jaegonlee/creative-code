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
