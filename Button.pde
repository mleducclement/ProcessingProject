class Button {
  private Rect _rect;
  private String _label;
  private boolean _mouseOver;
  private boolean _enabled = true;
  
  // Constructors 
  public Button () {}

  public Button (String label, Rect rect) {
    this._label = label;
    this._rect = rect;
  }
  
  public Button (String label, int x, int y) {
    this._label = label;
    this._rect = new Rect(x, y, 100, 40);
  }
  
  public Button (String label, int x, int y, int w, int h) {
    this._label = label;
    this._rect = new Rect(x, y, w, h);
  }
  
  public void drawSelf() {
    drawRect();
    drawText();
  }
  
  public void drawRect() {
    fill(128);
    rect(_rect.getX(), _rect.getY(), _rect.getWidth(), _rect.getHeight());
  }
  
  public void drawText() {
    fill(255);
    textAlign(CENTER, CENTER);
    text(_label, _rect.getX() + (_rect.getWidth()/2), _rect.getY() + (_rect.getHeight()/2));
  }
  
  public void onClick(IClickEventHandler clickHandler) {
     if (mousePressed && !clicked && checkMouseOver() && _enabled) {
       clickHandler.handleClick();
       clicked = true;
     }
  }
  
  public boolean checkMouseOver() {
    boolean inX = mouseX >= this._rect.getX() && mouseX <= this._rect.getX() + this._rect.getWidth();
    boolean inY = mouseY >= this._rect.getY() && mouseY <= this._rect.getY() + this._rect.getHeight();
    
    return inX && inY;
  }
  
  public void checkOverlap(Rect rect) {
    _enabled = true;
    if (rect.getVisible() && _rect.overlap(rect)) {
      _enabled = false;
    }  
  }
  
  // Getters
  public Rect getRect() {
    return _rect; 
  }
  
  public String getLabel() {
    return _label; 
  }
  
  public boolean getMouseOver() {
    return _mouseOver;
  }
  
  public boolean getEnabled() {
    return _enabled; 
  }
}
