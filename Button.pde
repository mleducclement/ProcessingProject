class Button extends UIComponent {

  private String _label;
  private boolean _enabled = true;
  private color _textColor;
  
  // Constructors 
  public Button () { }
  
  public Button (String label, color textColor, int x, int y) {
    super(new Rect(x, y, Constants.DEFAULT_BTN_WIDTH, Constants.DEFAULT_BTN_HEIGHT), 
          new GraphicsProperties(Constants.DEFAULT_BTN_FILLCOLOR, 
                                 Constants.DEFAULT_BTN_STROKECOLOR, 
                                 Constants.DEFAULT_BTN_HOVERCOLOR));
    this._label = label;
    this._textColor = textColor;
  }
  
  public Button (String label, color textColor, int x, int y, GraphicsProperties gfxProps) {
    super(new Rect(x, y, Constants.DEFAULT_BTN_WIDTH, Constants.DEFAULT_BTN_HEIGHT), gfxProps);
    this._label = label;
    this._textColor = textColor;
  }
  
  public Button (String label, color textColor, int x, int y, int w, int h) { 
    super(new Rect(x, y, w, h), 
          new GraphicsProperties(Constants.DEFAULT_BTN_FILLCOLOR, 
                                 Constants.DEFAULT_BTN_STROKECOLOR, 
                                 Constants.DEFAULT_BTN_HOVERCOLOR));
    this._label = label;
    this._textColor = textColor;
  }
  
  public Button (String label, color textColor, int x, int y, int w, int h, GraphicsProperties gfxProps) {
    super(new Rect(x, y, w, h), gfxProps);
    this._label = label;
    this._textColor = textColor;
  }
  
  // Methods
  public void drawSelf() {
    super.drawRect();
    drawText();
  }
  
  public void drawText() {
    fill(_textColor);
    textAlign(CENTER, CENTER);
    text(_label, super._rect.getX() + (super._rect.getWidth()/2), super._rect.getY() + (super._rect.getHeight()/2));
  }
  
  public void onClick(IClickEventHandler clickHandler) {
     if (mousePressed && !clicked && checkMouseOver() && _enabled) {
       clickHandler.handleClick();
       clicked = true;
     }
  }
  
  // Getters 
  public String getLabel() {
    return _label; 
  }
  
  public boolean getEnabled() {
    return _enabled; 
  }
  
  // Setters
  public void setLabel(String value) {
    this._label = value;
  }
  
  public void setEnabled(boolean value) {
    this._enabled = value;
  }
}
