import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

void setup() {
    size(600, 600);
    oscP5 = new OscP5(this, 12000); //listen for OSC messages on port 12000 (Wekinator default)
    dest = new NetAddress("127.0.0.1", 6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
}
void draw() {  
    background(200);
}


void oscEvent(OscMessage theOscMessage) {
    if (theOscMessage.checkAddrPattern("/output_1")==true) {
        println("left");
    } else if (theOscMessage.checkAddrPattern("/output_2")==true) {
        println("right");
    } else if (theOscMessage.checkAddrPattern("/output_3") == true) {
        println("jump");
    } else {
        println("Unknown OSC message received");
    }
}
