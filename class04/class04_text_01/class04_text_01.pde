PFont font;
String[] words;
float[] tx;
float[] ty;
float[] mx;
float[] my;
float[] origX;
float[] origY;

void setup() {
  size(650, 650, P3D);
  String[] lines = loadStrings("frankenstein.txt");
  String allText = join(lines, " ");
  words = splitTokens(allText, " ,.?!:;[]-\"'");
  tx = new float[words.length];
  ty = new float[words.length];
  mx = new float[words.length];
  my = new float[words.length];  
  origX = new float[words.length];
  origY = new float[words.length];  

  font = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(font, 24);

  float x = 0;
  float y = 0;
  origX[0] = 20;
  origY[0] = 30;
  tx[0] = 20;
  ty[0] = 30;

  for (int i = 1; i< words.length; i++) {
    x = x + textWidth(words[i-1]) + 10;
    if (x > width - 100) {
      x = 0;
      y = y + 40;
    }
    origX[i] = x + 20;
    origY[i] = y + 30;
    mx[i] = random(600);
    my[i] = random(600);   
    tx[i] = origX[i];
    ty[i] = origY[i];
  }
}

void draw() {
  background(255);
  fill(0);
  float x = 0;
  float y = 0;
  for (int i = 0; i< words.length; i++) {
    mx[i] = mx[i] + (tx[i] - mx[i]) * 0.1;
    my[i] = my[i] + (ty[i] - my[i]) * 0.5;
    text(words[i], mx[i], my[i]);
  }
}

void keyPressed() {
  if (key == '1') {
    for (int i = 0; i<words.length; i++) {
      tx[i] = random(-50,700);
      ty[i] = random(-50,700);
    }
  }
  if (key == ' ') {
    for (int i = 0; i<words.length; i++) {
      tx[i] = origX[i];
      ty[i] = origY[i];
    }
  }
}
