public enum ComponentType {
  BUTTON,
  VIEW,
}

public abstract class UIComponent {
  
  private Rect _rect;
  private boolean _enabled;
  
  public UIComponent() {}
  
  public UIComponent(Rect rect) {
    this._rect = rect;
    this._enabled = true;
  }
  
  public void toggleEnable() {
     this._enabled = !this._enabled;
  }
  
  // TODO Implement
  public void moveElement() {
    //Do Stuff
  }
  
  // IF NEED TO IMPLEMENT COLLISION
  //public boolean checkOverlap(Rect rect) {
  //  if (rect.getVisible() && _rect.overlap(rect)) {
  //    return false;
  //  }
  //  return true;
  //}
  
  // Getters
  public Rect getRect() {
    return this._rect; 
  }
  
  public boolean getEnabled() {
    return this._enabled; 
  }
   
  // Setters  
  public void setEnabled(boolean value) {
    this._enabled = value;
  }
}
