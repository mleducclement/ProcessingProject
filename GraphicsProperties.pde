public class GraphicsProperties {
  
  private color _fillColor;
  private color _strokeColor;
  private color _hoverColor;
  
  public GraphicsProperties() {}
  
  public GraphicsProperties(color fillColor, color strokeColor, color hoverColor) {
    this._fillColor = fillColor;
    this._strokeColor = strokeColor;
    this._hoverColor = hoverColor;
  }
  
  // Getters 
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
