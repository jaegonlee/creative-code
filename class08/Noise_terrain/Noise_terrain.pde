// perlin noise based terrain generation
// author: info@toxi.co.uk

float xoff=0;
float yoff=0;
float z = 0;

void setup() {
    size(600, 600, P3D);
    noStroke();
}

void draw() {
    background(255);

    //    translate(-20, height/2.5, -90);
    //    rotateX(PI/4);
    stroke(0);
    for (int y=0; y<60; y++) {
        for (int x=0; x<60; x++) {
            pushMatrix();
            translate(x*10, y*10, z*200);
            rect(0, 0, 10, 10);
            popMatrix();
            //vertex(x*10, y*10, z * 200);
            //vertex(x*10, (y+1)*10, noise(xoff+x*0.1, yoff+(y+1)*0.1, 0.1)*200);
            //vertex((x+1)*10, y*10, noise(xoff+(x+1)*0.1, yoff+y*0.1, 0.1)*200);
            //vertex((x+1)*10, (y+1)*10, noise(xoff+(x+1)*0.1, yoff+(y+1)*0.1, 0.1)*200);
        }
    }
}
