class GameManager {
  final PApplet _pApp;
  
  private View _currentTopView; 
  
  private HashMap<String, View> _topViews;
  
  private GameManager(final PApplet pApp) {
    this._pApp = pApp;
    _topViews = new HashMap<String, View>();
    
    init();
    
    _currentTopView = _topViews.get("MainMenu");
  }

  public void manageCursor() {
    for (var b : _currentTopView.getButtons().values()) {
      if (b.getRect().checkMouseOver() && b.getRect().getVisible()) {
        _pApp.cursor(HAND);
        return;
      }
    }
    
    for (var v : _currentTopView.getActiveSubviews()) {
      for (var b : v.getButtons().values()) {
        if (b.getRect().checkMouseOver() && b.getRect().getVisible()) {
          _pApp.cursor(HAND);
          return;
        }
      }
    }
    
    _pApp.cursor(ARROW);
  }
  
  public void init() {
    fillTopViewsList();
  }
  
  public void loadTopView(String viewName) {
    deactivateAllViews();
    _currentTopView = _topViews.get(viewName);
  }
  
  public void updateView() {
    _currentTopView.drawView();
    manageCursor();
  }
  
  public void fillTopViewsList() {
    _topViews.put("MainMenu", new MainMenuView());
    _topViews.put("GameView", new GameView());
  }
  
  public void deactivateAllViews() {
    for (View v : _topViews.values()) {
      v.getRect().setVisible(false);
      v.disableAllSubviews(_currentTopView);
    }
  }
  
  // Getters
  public View getCurrentTopView() {
    return this._currentTopView;
  }
  
  // Setters
  public void setCurrentTopView(String name) {
    this._currentTopView = _topViews.get(name);
  }
  
  // DEBUG
  
  public void dumpViews() {
    for (View v : _topViews.values()) {
      println(v);
      for (String s : v.getButtons().keySet()) {
        println("Name: " + s);
      }
    }
  }
}
