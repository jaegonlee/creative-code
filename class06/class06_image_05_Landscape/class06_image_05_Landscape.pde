/**
 * Transform: Transcoded Landscape
 * from Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 * 
 * This code was written for Processing 1.2+
 * Get Processing at http://www.processing.org/download
 */

PImage img;
float angle;

void setup() {
  size(1024, 768, P3D);
  noFill();

  img = loadImage("nasa-iceberg.jpg");
}

void draw() {

  background(0);                     // Set black background
  translate(width/2, height/2, 0);   // Move to the center
  scale(1.0);                        // 

  angle += 0.005;
  rotateY(angle);  

  for (int i = 0; i < img.height; i += 2) {
    for (int j = 0; j < img.width; j += 2) {
      stroke(img.get(j,i));
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = -brightness(img.get(j,i))/2;
      float x2 = j-img.width/2;
      float y2 = i-img.height/2;
      float z2 = -brightness(img.get(j,i))/2-4;
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}
