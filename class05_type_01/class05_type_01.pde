import processing.pdf.*;        
import geomerative.*;           

boolean saveOneFrame = false;   
RShape shape;                   
RPoint[][] allPaths;            

float maxOceanSpeed = 0.5;

void setup() {
  size(1280, 720, P2D); 
  RG.init(this);
  RFont font = new RFont("Georgia.ttf", 350);
  shape = font.toShape("Type");
  shape.translate(width/2 - shape.getWidth()/2, height/2 + shape.getHeight()/2);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); 
  RCommand.setSegmentLength(5); 
  allPaths = shape.getPointsInPaths();
}

void draw() {
  // begin recording to PDF
  if (saveOneFrame == true) {
    beginRecord(PDF, "Ocean-" + timestamp() + ".pdf");
  }

  background(255);

  noFill();

  strokeWeight(1);
  stroke(0);
  for (RPoint[] singlePath : allPaths) {
    beginShape();
    for (RPoint p : singlePath) {
      PVector vel = getVelocity(p.x, p.y);
      p.translate(vel.x, vel.y);
      vertex(p.x, p.y);
    }
    endShape();
  }
  
  // end recording to PDF
  if (saveOneFrame) {
    endRecord();
    saveOneFrame = false;
  }
}

void keyPressed() {

  if (key == 's') { saveOneFrame = true; } // save a PDF
}

String timestamp() {
  return year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
}


PVector getVelocity(float x, float y) {
  float angle = noise(x * 0.01, y * 0.01, frameCount * 0.01) * TWO_PI;
  PVector vel = PVector.fromAngle(angle);
  vel.limit(maxOceanSpeed); 
  return vel;
}
