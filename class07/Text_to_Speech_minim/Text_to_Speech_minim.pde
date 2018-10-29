import ddf.minim.*;

Minim minim;
AudioPlayer soundfile;

String file;

String[] str = new String[4];
int index = 0;
PFont font;

String clientId = "7wjrp2jqox";//애플리케이션 클라이언트 아이디값";
String clientSecret = "y5ZXz97uPNRM3jQIujTxA59OI8jpzRms5rjY4lbO";//애플리케이션 클라이언트 시크릿값";
String apiURL = "https://naveropenapi.apigw.ntruss.com/voice/v1/tts";

void setup() {
    pixelDensity(2);
    size(600, 600);
    minim = new Minim(this);
    font = createFont("Arita-buriL.otf", 16);
    str[0] = "안녕하세요.";
    str[1] = "오늘 날씨는 어떤가요.";
    str[2] = "내일은 날씨가 춥습니다.";
    str[3] = "잘 가요.";
    textFont(font, 16);
}

void draw() {
    background(255);
    fill(0);
    for (int i = 0; i<4; i++) {
        text(str[i], 30, 50 + i * 30);
    }
    index%=str.length;
}

void mousePressed() {
    clova(str[index]);
    index++;
}
