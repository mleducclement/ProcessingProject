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

ArrayList<Button> inventoryButtons;
ArrayList<ClickHandler> inventoryCommands;
// Might be better to check only views that are visible by creating an ArrayList of them

Screen currentScreen = Screen.MAIN_MENU;

void setup() {
  font = createFont("courier new", 16);
  frameRate(Constants.FRAME_RATE);
  prepareMainMenu();
  prepareInventorySubView();
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
  background(128, 128, 128);

  for (int i = 0; i < mainMenuButtons.size(); i++) {
    Button currButton = mainMenuButtons.get(i);
    currButton.drawSelf();
    currButton.onClick(mainMenuCommands.get(i));
  }
  
  for (Rect r : mainMenuSubviews) {
    for (Button b : mainMenuButtons) {
      b.setEnabled(b.checkOverlap(r));
    }
  }
  
  for (Button b : mainMenuButtons) {
    b.checkMouseOver();
  }
}

void prepareMainMenu() {
  mainMenuButtons.add(new Button("Play", 200, 100));
  mainMenuButtons.add(new Button("Exit", 200, 165));
  mainMenuButtons.add(new Button("TEST", 200, 230));
  
  mainMenuSubviews.add(new Rect(200, 165, 800, 600));
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      screenChange(); 
    }
  });
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      mainMenuSubviews.get(0).toggleVisible();
    }
  });
  
  mainMenuCommands.add(new ClickHandler() {
    @Override
    public void handleClick() {
      mainMenuSubviews.get(0).setVisible(false);
    }
  });
}

void prepareInventorySubView() {
  inventoryButtons = new ArrayList<Button>();
  inventoryCommands = new ArrayList<ClickHandler>();
  
  inventoryButtons.add(new Button("A", 370, 120));
  inventoryButtons.add(new Button("B", 370, 180));
  inventoryButtons.add(new Button("C", 370, 240));
  
  inventoryCommands.add(new ClickHandler() {
    @Override 
    public void handleClick() {
      println("Option A");
    }
  });
  
    inventoryCommands.add(new ClickHandler() {
    @Override 
    public void handleClick() {
      println("Option B");
    }
  });
  
    inventoryCommands.add(new ClickHandler() {
    @Override 
    public void handleClick() {
      println("Option C");
    }
  });
}

void showInventory() {
    for (int i = 0; i < inventoryButtons.size(); i++) {
      Button b = inventoryButtons.get(i);
      b.drawSelf();
      b.onClick(inventoryCommands.get(i));
    }
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
  
  showInventory();
}

void showDebugInfo() {
  fill(255);
  textFont(font, 18);
  textAlign(LEFT);
  text(String.format("x: %d / y: %d",mouseX, mouseY), 10, 20);
  text(String.format("enabled: %b", mainMenuButtons.get(1).getEnabled()), 10, 40);
  text(String.format("fps: %d", (int)frameRate),10, 60);
  text(String.format("fill: %s", hex(inventoryButtons.get(0).getGFXProps().getFillColor(), 6)), 10, 80);
}

void mouseReleased() {
  clicked = clicked ? false: clicked;
}
