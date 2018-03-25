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
    json = loadJSONObject("https://api.particle.io/v1/devices/DEVICEID/bpm?access_token=ACCESSTOKEN");
      if (json == null) {
        println("JSONArray could not be parsed");
      } else {
        result = json.getInt("result");
        println(result);
      }
      text(result, width/2, height/2);
    }
  }
