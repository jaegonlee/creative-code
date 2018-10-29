import geomerative.*;           
import processing.pdf.*;       
import processing.sound.*;

AudioIn input;
Amplitude loudness;

boolean saveOneFrame = false;   
RShape shape;                   
RPoint[][] allPaths;            

void setup() {
  size(1280, 720);

  input = new AudioIn(this, 0);
  input.start();
  loudness = new Amplitude(this);
  loudness.input(input);

  RG.init(this);
  RFont font = new RFont("Roboto-Thin.ttf", 350);
  shape = font.toShape("CODE");
  shape.translate(width/2 - shape.getWidth()/2, height/2 + shape.getHeight()/2);
  RCommand.setSegmentLength(10); 
  allPaths = shape.getPointsInPaths();
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, "type-" + timestamp() + ".pdf");
  }
  float volume = loudness.analyze() * 80;

  background(255);
  noFill();
  stroke(0, 225, 255);
  //shape.draw();

  stroke(0);
  strokeWeight(2);
  beginShape(POINTS);
  for (RPoint[] singlePath : allPaths) {
    for (RPoint p : singlePath) {
      //vertex(p.x, p.y);
    }
  }
  endShape();

  stroke(0, 125);
  strokeWeight(0.75);
  for (RPoint[] singlePath : allPaths) {
    beginShape();
    for (int i=0; i<singlePath.length; i++) {
      RPoint p = singlePath[i];
      float a = 0;//random(-volume, volume);
      float b = random(-volume, volume);
      if (i % 2 == 0) {
        a = random(volume);
//        b = random(volume);
      } else {
        a = random(-volume);
//        b = random(-volume);
      }
      vertex(p.x + a, p.y + b);
    }
    endShape();
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
