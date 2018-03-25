import http.requests.*;

PFont font;
JSONObject json;

int currentTime = 0;
int pastTime = 0;
int interval = 3000;
int result;


void setup() {
  fullScreen();
  //size(500, 500);
  noStroke();
  fill(0);
  font=createFont("Monospaced-Bold", 700);
  textFont(font);
  textAlign(CENTER, CENTER);
  pastTime = millis();
}

void draw() {
  background(204);
  fill(0);
  currentTime = millis();
  if (currentTime - pastTime > interval) {
    json = loadJSONObject("https://api.particle.io/v1/devices/3a0022000d51353532343635/bpm?access_token=73324860de578a16cbb22bb4810a326d5e0610b4");
      if (json == null) {
        println("JSONArray could not be parsed");
      } else {
        result = json.getInt("result");
        println(result);
      }
      text(result, width/2, height/2);
    }
  }