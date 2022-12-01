class Rect {
  
  private Vector2 _position;
  private int _width, _height;
  private boolean _visible;
  
  public Rect() {}
  
  public Rect(int x, int y, int w, int h) {
    this._position = new Vector2(x, y);
    this._width = w;
    this._height = h;
  }
  
  public Rect(Vector2 position, int w, int h) {
    this._position = position;
    this._width = w;
    this._height = h;
  }
  
  public void drawRect() {
    rect(_position.getX(), _position.getY(), _width, _height);
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
  
  public boolean getVisible() {
    return _visible;
  }
  
  // Setters
  public void setVisible(boolean value) {
    this._visible = value;
  }
}
