public abstract class UIComponent {
  
  private Rect _rect;
  private GraphicsProperties _gfxProps;
  private boolean _visible;
  
  public UIComponent() {}
  
  public UIComponent(Rect rect, GraphicsProperties gfxProps) {
    this._rect = rect;
    this._gfxProps = gfxProps;
    this._visible = false;
  }
  
  public UIComponent(int x, int y, int w, int h, GraphicsProperties gfxProps) {
    this._rect = new Rect(x, y, w, h);
    this._gfxProps = gfxProps;
    this._visible = false;
  }
  
  public void drawRect() {
    if (_gfxProps.getHasFill()) {
      fill(_gfxProps.getFillColor());
    }
    else {
      noFill();
    }
    
    if (_gfxProps.getHasStroke()) {
      stroke(_gfxProps.getStrokeColor());
    }
    else {
      noStroke();
    }
    rect(_rect.getX(), _rect.getY(), _rect.getWidth(), _rect.getHeight());
  }
  
  public void toggleVisible() {
    this._visible = !this._visible;
  }  
  
  public void moveElement() {
    //Do Stuff
  }
  
  public boolean checkMouseOver() {
    boolean inX = mouseX >= this._rect.getX() && mouseX <= this._rect.getX() + this._rect.getWidth();
    boolean inY = mouseY >= this._rect.getY() && mouseY <= this._rect.getY() + this._rect.getHeight();
    
    return inX && inY;
  }
  
  public boolean checkOverlap(Rect rect) {
    if (rect.getVisible() && _rect.overlap(rect)) {
      return false;
    }
    return true;
  }
  
  // Getters
  public Rect getRect() {
    return _rect; 
  }
  
  public boolean getVisible() {
    return _visible; 
  }
  
  public GraphicsProperties getGFXProps() {
    return _gfxProps;
  }
  
  // Setters
  public void setVisible(boolean value) {
    this._visible = value;
  }
  
  public void setGFXProps(GraphicsProperties value) {
    this._gfxProps = value;
  }
}
