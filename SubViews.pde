enum SubviewName {
  INVENTORY, 
}

public class InventoryView extends View {
  
  public InventoryView(Rect parentRect) {
    super(new Rect(new Vector2(350, 100), 600, 600, new GraphicsProperties(
      Constants.skyblue, 0, 0), ComponentType.VIEW));
    
    super.setParentRect(parentRect);
    this.prepareView();
  }
  
  public void prepareView() {
    GraphicsProperties gfxProps = new GraphicsProperties(
      Constants.darkblue, Constants.black, Constants.red);
     
    // WON'T WORK IF MORE THAN 2 VIEW LEVELS
    int subviewX = super.getRect().getX();
    int subviewY = super.getRect().getY();
      
    super.addButton("EquipSword", new Button(new Vector2(subviewX + 20, subviewY + 20), gfxProps, new RichText("Sword"), new EquipSword())); 
    super.addButton("EquipAxe", new Button(new Vector2(subviewX + 20, subviewY + 85), gfxProps, new RichText("Axe"), new EquipAxe()));
    super.addButton("EquipSaucepan", new Button(new Vector2(subviewX + 20, subviewY + 150), gfxProps, new RichText("Saucepan"), new EquipSaucepan()));
  }
}
