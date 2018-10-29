import processing.video.*;
import oscP5.*;
import netP5.*;

int numPixelsOrig;
int numPixels;
boolean first = true;

int boxWidth = 16;
int boxHeight = 12;

int numHoriz = 320/boxWidth;
int numVert = 240/boxHeight;

color[] downPix = new color[numHoriz * numVert];

Capture video;

OscP5 oscP5;
NetAddress dest;

void setup() {
    size(320, 240, P2D);
    video = new Capture(this, 320, 240);
    video.start();
    numPixelsOrig = video.width * video.height;
    loadPixels();
    noStroke();
    oscP5 = new OscP5(this, 9000);
    dest = new NetAddress("127.0.0.1", 6448);
}

void draw() {

    if (video.available() == true) {
        video.read();

        video.loadPixels(); // Make the pixels of video available
        int boxNum = 0;
        int tot = boxWidth*boxHeight;
        for (int x = 0; x < 320; x += boxWidth) {
            for (int y = 0; y < 240; y += boxHeight) {
                float red = 0, green = 0, blue = 0;

                for (int i = 0; i < boxWidth; i++) {
                    for (int j = 0; j < boxHeight; j++) {
                        int index = (x + i) + (y + j) * 320;
                        red += red(video.pixels[index]);
                        green += green(video.pixels[index]);
                        blue += blue(video.pixels[index]);
                    }
                }
                downPix[boxNum] =  color(red/tot, green/tot, blue/tot);
                // downPix[boxNum] = color((float)red/tot, (float)green/tot, (float)blue/tot);
                fill(downPix[boxNum]);

                int index = x + 320*y;
                red += red(video.pixels[index]);
                green += green(video.pixels[index]);
                blue += blue(video.pixels[index]);
                // fill (color(red, green, blue));
                rect(x, y, boxWidth, boxHeight);
                boxNum++;
            }
        }
        if (frameCount % 2 == 0)
            sendOsc(downPix);
    }
    first = false;
    fill(0);
    text("Sending 400 inputs to port 6448 using message /wek/inputs", 10, 10);
}

float diff(int p, int off) {
    if (p + off < 0 || p + off >= numPixels)
        return 0;
    return red(video.pixels[p+off]) - red(video.pixels[p]) +
        green(video.pixels[p+off]) - green(video.pixels[p]) +
        blue(video.pixels[p+off]) - blue(video.pixels[p]);
}

void sendOsc(int[] px) {
    OscMessage msg = new OscMessage("/wek/inputs");
    for (int i = 0; i < px.length; i++) {
        msg.add(float(px[i]));
    }
    oscP5.send(msg, dest);
}
