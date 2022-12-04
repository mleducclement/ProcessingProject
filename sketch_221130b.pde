import java.util.*;

////////
/// TODO : Make subviews buttons follow panel and separate in subviews classes
/// make buttons inactive instead of checking if they are below a subview
////////

PFont font;

GameManager gm;
Timer timer;

boolean clicked = false;
boolean debugMode = true;

ArrayList<TimedText> timedTexts;
ArrayList<TimedText> timedTextsClone;

// Might be better to check only views that are visible by creating an ArrayList of them

void setup() {
  gm = new GameManager(this);
  font = createFont("courier new", 16);
  frameRate(Constants.FRAME_RATE);
  size(1280, 720);
  timedTexts = new ArrayList<TimedText>();
}

void draw() {
  background(0);
  
  gm.updateView();
    
  timedTextsClone = (ArrayList)timedTexts.clone();
  drawTimedTexts(); 
  
  if (debugMode) {
    showDebugInfo(); 
  }
}

void showDebugInfo() {
  fill(255);
  textFont(font, 18);
  textAlign(LEFT);
  text(String.format("x: %d / y: %d",mouseX, mouseY), 10, 20);
  //text(String.format("enabled: %b", mainMenuButtons.get(1).getEnabled()), 10, 40);
  text(String.format("fps: %d", (int)frameRate),10, 60);
  //text(String.format("fill: %s", hex(inventoryButtons.get(0).getGFXProps().getFillColor(), 6)), 10, 80);
}

void mouseReleased() {
  clicked = clicked ? false: clicked;
}

void addTimedText(TimedText timedText) {
  timedTexts.add(timedText);
}

void drawTimedTexts() {
  for (TimedText tt : timedTextsClone) {
    if (tt.getHasFinished()) {
      timedTexts.remove(tt); 
    }
    else {
      tt.draw(); 
    }
  }
}
