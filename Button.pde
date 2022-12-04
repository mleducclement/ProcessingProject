class Button extends UIComponent {

  private RichText _text;
  private IClickEventHandler _command;
  
  // Constructors
  public Button (Vector2 position, GraphicsProperties gfxProps, RichText text, IClickEventHandler command) {
    super(new Rect(position, Constants.DEFAULT_BTN_WIDTH, Constants.DEFAULT_BTN_HEIGHT, gfxProps, ComponentType.BUTTON));
    this._text = text;
    this._command = command;
  }
  
  // Methods
  public void drawSelf() {
    super._rect.drawRect();
    drawText();
    onClick(_command);
  }
  
  public void drawText() {
    fill(_text.getTextColor());
    textSize(_text.getFontSize());
    textAlign(CENTER, CENTER);
    text(_text.getText(), super._rect.getX() + (super._rect.getWidth()/2), super._rect.getY() + (super._rect.getHeight()/2));
  }
  
  // Might be a good thing to implement events eventually ?
  public void onClick(IClickEventHandler command) {
     if (mousePressed && !clicked && super._rect.checkMouseOver()) {
       command.handleClick();
       clicked = true;
     }
  }
   
  // Setters
  public void setLabel(String value) {
    this._text.setText(value);
  }
  
  public void setLabelColor(color value) {
    this._text.setTextColor(value);
  }
}
