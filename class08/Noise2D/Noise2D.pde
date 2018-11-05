/**
 * Noise2D 
 * by Daniel Shiffman.  
 * 
 * Using 2D noise to create simple texture. 
 */

void setup() {
    size(640, 360);
}

void draw() {
    float xoff = 0.0; 
    for (int x = 0; x < width; x++) {
        xoff += 0.01;    
        float yoff = 0.0;   
        for (int y = 0; y < height; y++) {
            yoff += 0.01;
            float bright = random(0, 255);
//            float bright = noise();

            set(x, y, color(bright));
        }
    }
}
