public class GraphicsProperties {
  
  private boolean _hasStroke;
  private boolean _hasFill;
  private boolean _hasHover;
  private color _strokeColor;
  private color _fillColor;
  private color _hoverColor;
  
  public GraphicsProperties() {}
  
  public GraphicsProperties(color fillColor) {
    this._hasFill = true;
    this._hasStroke = false;
    this._hasHover = false;
    this._fillColor = fillColor;
    this._strokeColor = Constants.white;
  }
  
  public GraphicsProperties(color fillColor, color strokeColor) {
    this._hasFill = true;
    this._hasStroke = true;
    this._hasHover = false;
    this._fillColor = fillColor;
    this._strokeColor = strokeColor;
    this._hoverColor = Constants.white;
  }
  
  public GraphicsProperties(color fillColor, color strokeColor, color hoverColor) {
    this._hasFill = true;
    this._hasStroke = true;
    this._hasHover = true;
    this._fillColor = fillColor;
    this._strokeColor = strokeColor;
    this._hoverColor = hoverColor;
  }
  
  // Getters
  public boolean getHasStroke() {
    return _hasStroke;
  }
  
  public boolean getHasFill() {
    return _hasFill;
  }
  
  public boolean getHasHover() {
    return _hasHover;
  }
  
  public color getStrokeColor() {
    return _strokeColor;
  }
  
  public color getFillColor() {
    return _fillColor;
  }
  
  public color getHoverColor() {
    return _hoverColor;
  }
  
  // Setters
  public void setHasStroke(boolean value) {
    this._hasStroke = value;
  }
  
  public void setHasFill(boolean value) {
    this._hasFill = value;
  }
  
  public void setHasHover(boolean value) {
    this._hasHover = value;
  }
  
  public void setStrokeColor(color value) {
    this._strokeColor = value;
  }
  
  public void setFillColor(color value) {
    this._fillColor = value; 
  }
  
  public void setHoverColor(color value) {
    this._hoverColor = value;
  }
}
