import processing.net.*;

boolean myServerRunning = true;

Server myServer;
String txt="";
String t = "";

void setup()
{
  size(600, 400, P2D);
  pixelDensity(2);
  textFont(createFont("SanSerif", 28));
  myServer = new Server(this, 10005);
}

void mousePressed()
{
  //myServer.stop();
  //myServerRunning = false;
}

int tw;

void draw() {
  background(255);
  if (myServerRunning == true)
  {
    Client thisClient = myServer.available();
    if (thisClient != null) {
      if (thisClient.available() > 0) {
        txt = thisClient.readString();
        println(txt);
        tw = 0;
        t = "";
        for (int i = 0; i<txt.length(); i++) {
          char c = txt.charAt(i);
          if (i == 0 && c == ' ') {
          } else {
            t += c;    
            tw++ ;//textWidth(c);
            if (tw > 30) {
              t+= '\n';
              tw=0;
            }
          }
        }
      }
    }
  } else 
  {
    //    text("server", 15, 45);
    //    text("stopped", 15, 65);
  }
  fill(0);
  text(t, 20, 100);
}
