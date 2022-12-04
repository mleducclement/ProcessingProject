class Rect {
  
  private Vector2 _position;
  private int _width, _height;
  private GraphicsProperties _gfxProps;
  private boolean _visible;
  private ComponentType _ownerType;
  
  public Rect() {}
  
  public Rect(Vector2 position, int w, int h, GraphicsProperties gfxProps, ComponentType componentType) {
    this._position = position;
    this._width = w;
    this._height = h;
    this._gfxProps = gfxProps;
    this._visible = false;
    this._ownerType = componentType;
  }
  
  public void drawRect() {
    if (_visible == false) { return; } //<>//
    
    if (_gfxProps.getFillColor() != 0) {     //<>//
      if (checkMouseOver() && _ownerType == ComponentType.BUTTON) {
        fill(_gfxProps.getHoverColor()); //<>//
      } else {
        fill(_gfxProps.getFillColor()); //<>//
      }
    }
    else {
      noFill();
    }  
    
    if (_gfxProps.getStrokeColor() != 0) {
      stroke(_gfxProps.getStrokeColor());
    }
    else {
      noStroke();
    }
    
    rect(_position.getX(), _position.getY(), _width, _height);
  }
  
  public boolean checkMouseOver() {
    boolean inX = mouseX >= this._position.getX() && mouseX <= this._position.getX() + this._width;
    boolean inY = mouseY >= this._position.getY() && mouseY <= this._position.getY() + this._height;
    
    return inX && inY;
  }
  
  public boolean overlap(Rect other) {
    if (_width == 0 || _height == 0 || other.getWidth() == 0 || other.getHeight() == 0) {
      return false; 
    }
    
    if (_position.getX() > other.getX() + other.getWidth() || _position.getX() + _width < other.getX()) {
      return false;
    }
    
    if (_position.getY() > other.getY() + other.getHeight() || _position.getY() + _height < other.getY()) {
      return false;
    }
    
    return true;
  }
  
  // Getters
  public Vector2 getPosition() {
    return _position;
  }
  
  public int getX() {
    return _position.getX();
  }
  
  public int getY() {
    return _position.getY();
  }
  
  public int getWidth() {
    return _width; 
  }
  
  public int getHeight() {
    return _height; 
  }
  
  public GraphicsProperties getGFXProps() {
    return this._gfxProps;
  }
  
  public boolean getVisible() {
     return this._visible;
  }
  
  // Setters
  public void setVisible(boolean value) {
    this._visible = value;
  }
}
