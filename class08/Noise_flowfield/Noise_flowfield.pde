int no = 800;
float zoff = 0.0;  
float[] px = new float[no];
float[] py = new float[no];

void setup() {
    size(600, 600);
    for (int i = 0; i<no; i++) {
        px[i] = random(600);   
        py[i] = random(600);
    }   
    background(255);
    smooth();
}

void draw() {
    noStroke();
    stroke(0, 10);
    for (int i = 0; i<no; i++) {
        float z = noise(px[i] * 0.005, py[i] * 0.005) * TWO_PI * 2.0;
        //if (px[i] > width) px[i] = 0;
        //if (px[i] < 0) px[i] = width;
        //if (py[i] > height) py[i] = 0;
        //if (py[i] < 0) py[i] = height;
        px[i] += cos(z);
        py[i] += sin(z);
        line(px[i], py[i], px[i]+cos(z), py[i]+sin(z));
    }
}
