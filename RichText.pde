public class RichText { 
  private Vector2 _position;
  private String _text;
  private color _textColor;
  private int _fontSize;
  
  public RichText(String text) {
    this._text = text;
    this._textColor = Constants.DEFAULT_TEXTCOLOR;
    this._fontSize = Constants.DEFAULT_FONTSIZE;
  }
  
  public RichText (String text, Vector2 position) {
    this(text, position, Constants.DEFAULT_TEXTCOLOR);
    
  }
  
  public RichText (String text, Vector2 position, color textColor) {
    this(text, position, textColor, Constants.DEFAULT_FONTSIZE);
    this._text = text;
    this._position = position;
    this._textColor = textColor;
  }
  
  public RichText (String text, Vector2 position, color textColor, int fontSize) {
    this._text = text;
    this._position = position;
    this._textColor = textColor;
    this._fontSize = fontSize;
  }
  
  // Getters
  public String getText() {
     return this._text;
  }
  
  public Vector2 getPosition() {
    return this._position;
  }
  
  public color getTextColor() {
    return this._textColor;
  }
  
  public int getFontSize() {
    return this._fontSize; 
  }
  
  // Setters
  public void setText(String value) {
    this._text = value;
  }
  
  public void setTextColor(color value) {
    this._textColor = value;
  }
}
