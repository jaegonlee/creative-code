/**
 * Noise1D. 
 * 
 * Using 1D Perlin Noise to assign location. 
 */

float xoff = 0.0;

void setup() {
    size(640, 360);
    background(0);
    noStroke();
}

void draw() {
    fill(0, 10);
    rect(0, 0, width, height);

//    float n = random(0, width); 
    float n = noise(xoff);
    xoff += 0.01;

    fill(200);
    ellipse(n, height/2, 64, 64);
}
