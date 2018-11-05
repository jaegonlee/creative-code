int no = 400;
float zoff = 0.0;  
float[] px = new float[no];
float[] py = new float[no];

void setup() {
    size(600, 600, P2D);
    int i = 0;
    for (int x = 0; x < 20; x++) { 
        for (int y = 0; y < 20; y++) {
            px[i] = x * 30;   
            py[i] = y * 30;
            i++;
        }
    }
    background(255);
}

void draw() {
    noStroke();
    fill(255, 60);
    rect(0, 0, width, height);
    stroke(0);
    int i = 0;
    for (int x = 0; x < 20; x++) { 
        for (int y = 0; y < 20; y++) {
            float z = noise(x * 0.01, y * 0.01, zoff) * TWO_PI * 2.0;
            pushMatrix();
            translate(px[i], py[i]);
            rotate(z);
            line(0, 0, 20, 0);
            popMatrix();
            i++;
        }
    }
    zoff += 0.005;
}
