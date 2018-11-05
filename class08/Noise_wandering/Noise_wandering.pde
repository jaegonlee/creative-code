float xoff = 0.0;
float x, y;

void setup() {
    size(600, 600);
    background(0);
    noStroke();
}

void draw() {
    fill(0, 20);
    rect(0, 0, width, height);

    float n = noise(xoff) * TWO_PI;
    xoff += 0.005;

    fill(200);

    x += 1;
    y += 1;
    
    ellipse(x, y, 15, 15);
}