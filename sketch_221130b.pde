enum Screen {
  MAIN_MENU,
  GAME
}

PFont font;

boolean clicked = false;
boolean debugMode = true;
boolean mouseOver = false;

ArrayList<Button> mainMenuButtons = new ArrayList<Button>();
ArrayList<Rect> mainMenuSubviews = new ArrayList<Rect>();
ArrayList<ClickHandler> mainMenuCommands = new ArrayList<ClickHandler>();
// Might be better to check only views that are visible by creating an ArrayList of them

Screen currentScreen = Screen.MAIN_MENU;

void setup() {
  font = createFont("courier new", 16);
  prepareMainMenu();  
  size(1280, 720);
}

void draw() { 
  switch(currentScreen) {
  case MAIN_MENU:
    showMainMenu();
    showSubView(); 
    break;
  case GAME:
    showGameScreen();
    break;
  }
  
  if (debugMode) {
    showDebugInfo(); 
  }
}

void showMainMenu() {
  background(64, 64, 96);

  for (int i = 0; i < mainMenuButtons.size(); i++) {
    Button currButton = mainMenuButtons.get(i);
    currButton.drawSelf();
    currButton.onClick(mainMenuCommands.get(i));
  }
  
  for (Rect r : mainMenuSubviews) {
    for (Button b : mainMenuButtons) {
      b.checkOverlap(r);
    }
  }
}

void prepareMainMenu() {
  mainMenuButtons.add(new Button("Play", 200, 200));
  mainMenuButtons.add(new Button("Exit", 500, 500));
  mainMenuButtons.add(new Button("TEST", 800, 500));
  
  mainMenuSubviews.add(new Rect(400, 300, 250, 250));
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      screenChange(); 
    }
  });
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      mainMenuSubviews.get(0).setVisible(true);
    }
  });
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      mainMenuSubviews.get(0).setVisible(false);
    }
  });
}

void showGameScreen() {
  background(96, 64, 64);
  
  fill(128, 32, 32);
  rect(200, 200, 160, 50);
  rect(400, 200, 160, 50);
  
  fill(255);
  textFont(font, 18);
  textAlign(CENTER, CENTER);
  text("Main Menu", 280, 225);
  text("Open View", 480, 225);
}

void screenChange() {
  if (currentScreen == Screen.MAIN_MENU) {
    currentScreen = Screen.GAME;
  }
  else {
    currentScreen = Screen.MAIN_MENU; 
  }
}

void showSubView() {
  fill(255, 64);
  for (Rect r : mainMenuSubviews) {
    if (r.getVisible()) r.drawRect();   
  }
}

void showDebugInfo() {
  fill(255);
  textFont(font, 18);
  textAlign(LEFT);
  text(String.format("x: %d / y: %d",mouseX, mouseY), 10, 20);
  text(String.format("enabled: %b", mainMenuButtons.get(1).getEnabled()), 10, 40);
}

void mouseReleased() {
  clicked = clicked ? false: clicked;
}
