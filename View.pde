public abstract class View  {
  
  private Rect _rect;
  private Rect _parentRect;
  
  // List of buttons contained in view (both for subview and main view (could replace to enum map)
  HashMap<String, Button> _buttons;

  // List of the subviews contained in view
  EnumMap<SubviewName, View> _subviews;
     
  // List of active subview for code optimization
  ArrayList<View> _activeSubviews;
  
  public View(Rect rect) {
    this._rect = rect;
    this._buttons = new HashMap<String, Button>();
    this._subviews = new EnumMap<SubviewName, View>(SubviewName.class);
    this._activeSubviews = new ArrayList<View>();
  }
  
  public abstract void prepareView();
  
  public void drawView() {
    this.getRect().setVisible(true);
    this.getRect().drawRect();
    
    for (Button b : _buttons.values()) {
      b.drawSelf();
      b.getRect().setVisible(true);
      b.setEnabled(true);
    }
    
    for (View v : _activeSubviews) {
      v.getRect().drawRect();
      
      for (Button b : v.getButtons().values()) {
        b.getRect().setVisible(true);
        b.drawSelf();
      }
    }
  }
  
  public void disableAllSubviews(View v) {
    for (View sv :  v._subviews.values()) {
       sv.getRect().setVisible(false);
    }
    this._activeSubviews.clear();  
  }
     
  public void enableSubview(View v) {
    v.getRect().setVisible(true);
    this._activeSubviews.add(v); 
  }
  
  public void disableSubview(View v) {
    v.getRect().setVisible(false);
    this._activeSubviews.remove(v);
  }
  
  public void toggleSubview(View v) {
    if (v.getRect().getVisible() == false) {
      this.enableSubview(v); 
    } else {
      this.disableSubview(v);
    }  
  }
  
// internal grid for each subview that starts at 0,0 and is the size of the subview rect
  
  // GETTERS
  public Rect getRect() {
    return this._rect;
  }
  
  public Rect getParentRect() {
    return this._parentRect;
  }
  
  public HashMap<String, Button> getButtons() {
    return this._buttons;
  }
  
  public EnumMap<SubviewName, View> getSubviews() {
    return this._subviews;
  }
  
  public ArrayList<View> getActiveSubviews() {
    return this._activeSubviews;
  }
  
  public View getSubview(SubviewName name) {
    return this._subviews.get(name);
  }
  
  // MUTATORS
  public void setParentRect(Rect value) {
    this._parentRect = value;
  }
  
  public void addButton(String name, Button button) {
    this._buttons.put(name, button);
  }
  
  public void addSubview(SubviewName name, View subview) {
    this._subviews.put(name, subview);
  }
}
