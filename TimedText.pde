public class TimedText {
  private RichText _text;
  private Timer _timer; 
  
  public TimedText(RichText text, Timer timer) {
    this._text = text;
    this._timer = timer;
  }
  
  public void draw() {
    this._timer.updateTimer();
    
    if (_timer.getHasFinished() == false) {
       fill(this._text.getTextColor());
       text(this._text.getText(), this._text.getPosition().getX(), this._text.getPosition().getY(), 32);
    }
  }
  
  // Getters
  public boolean getHasFinished() {
    return this._timer.getHasFinished();
  }
}
