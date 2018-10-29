import processing.video.*;

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

String currentMessage = "";
int input;

Movie mov0;
Movie mov1;

void setup() {
    size(340, 280, P3D);
    oscP5 = new OscP5(this, 12000);
    frameRate(30);
}

void draw() {
    background(255);
    if (input == 1) {
    }
    if (input == 2) {
    }
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
    println("received message");
    if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
        if (theOscMessage.checkTypetag("f")) {
            float f = theOscMessage.get(0).floatValue();
            println("received");
            input = int(f);

        }
    }
}
