// perlin noise based terrain generation
// author: info@toxi.co.uk

float xoff=0;
float yoff=0;
float z = 0;
float zoff = 0;
void setup() {
  size(600, 600, P3D);
  noStroke();
}

void draw() {
  background(255);
  translate(-20, height/2.5, -90);
  rotateX(PI/4);
  //stroke(0);
  for (int y=0; y<60; y++) {
    beginShape(QUAD_STRIP);  
    for (int x=0; x<60; x++) {
      z = noise(x * 0.05 + xoff, yoff+y*0.05, 0.1);
      //fill(z * 400);
      vertex(x*10, y*10, z * 200);
      vertex(x*10, (y+1)*10, noise(xoff+x*0.05, yoff+(y+1)*0.05, 0.1)*200);
      vertex((x+1)*10, y*10, noise(xoff+(x+1)*0.05, yoff+y*0.05, 0.1)*200);
      vertex((x+1)*10, (y+1)*10, noise(xoff+(x+1)*0.05, yoff+(y+1)*0.05, 0.1)*200);
    }
    endShape();
  }
  xoff += 0.01;
  yoff += 0.01;
}
