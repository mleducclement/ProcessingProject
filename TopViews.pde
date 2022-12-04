public final class MainMenuView extends View {
  
  public MainMenuView() {
    super(new Rect(new Vector2(), width, height, new GraphicsProperties(
      Constants.black, 0, 0), ComponentType.VIEW));
    this.prepareView();
  }
  
  public void prepareView() {
    GraphicsProperties gfxProps = new GraphicsProperties(
      Constants.burgundy, 0, Constants.blue);
      
    super.addButton("Play", new Button(new Vector2(200, 100), gfxProps, new RichText("Play"), new LoadGameView()));  
    super.addButton("OpenInventory", new Button(new Vector2(200, 165), gfxProps, new RichText("Inventory"), new OpenInventory()));
    super.addButton("CloseInventory", new Button(new Vector2(200, 230), gfxProps, new RichText("Status"), new CloseInventory()));
    
    super.addSubview(SubviewName.INVENTORY, new InventoryView(this.getRect()));
  }
}

public final class GameView extends View {
  
  
  public GameView() {
    super(new Rect(new Vector2(), width, height, new GraphicsProperties(
      Constants.burgundy, 0, 0), ComponentType.VIEW));
    this.prepareView();
  }
  
  public void prepareView() {
    GraphicsProperties gfxProps = new GraphicsProperties(
      Constants.black, 0, Constants.blue);
  
    super.addButton("MainMenu", new Button(new Vector2(200, 100), gfxProps, new RichText("Main Menu"), new LoadMainMenuView()));
    super.addButton("OpenView", new Button(new Vector2(200, 165), gfxProps, new RichText("Open"), new ClickHandler()));
  }
}
