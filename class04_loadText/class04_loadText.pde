PFont font;

void setup() {
  size(600, 600, P3D);
  String[] lines = loadStrings("frankenstein.txt");
  String allText = join(lines, " ");
  String[] words = splitTokens(allText, " ,.?!:;[]-\"'");
  font = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(font, 24);
}

void draw() {
  background(255);
  fill(0);
}

void keyPressed() {
  save("test.png");
}
