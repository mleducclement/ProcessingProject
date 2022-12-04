// TODO change ClickHandler to IClickEventHandler

class ClickHandler implements IClickEventHandler {
  public void handleClick() {
    println("clicked!");
  }
}

class LoadGameView implements IClickEventHandler {
  public void handleClick() {
    gm.loadTopView("GameView");
  }
}

class OpenInventory implements IClickEventHandler {
  public void handleClick() {
    View v = gm.getCurrentTopView();
    v.toggleSubview(v.getSubview(SubviewName.INVENTORY));
    println("test");
  }
}

class CloseInventory implements IClickEventHandler {
  public void handleClick() {
    println("Closing Inventory...!"); 
  }
}

class LoadMainMenuView implements IClickEventHandler {
  public void handleClick() {
    gm.loadTopView("MainMenu");
  }
}

class EquipSword implements IClickEventHandler {
  public void handleClick() {
    RichText t = new RichText("You equip the Sword!", new Vector2(370, 80), Constants.red);
    addTimedText(new TimedText(t, new Timer(2)));
  }
}

class EquipAxe implements IClickEventHandler {
  public void handleClick() {
    RichText t = new RichText("You equip the Axe!", new Vector2(370, 80), Constants.red);
    addTimedText(new TimedText(t, new Timer(2)));
  }
}

class EquipSaucepan implements IClickEventHandler {
  public void handleClick() {
    RichText t = new RichText("You equip the Saucepan!", new Vector2(370, 80), Constants.red);
    addTimedText(new TimedText(t, new Timer(2)));
  }
}
