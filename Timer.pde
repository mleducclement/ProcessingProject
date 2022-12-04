public class Timer {
   private int _saveTime;
   private int _targetTime;
   private boolean _hasFinished;
   
   public Timer(int targetMillis) {
     this._saveTime = millis();
     this._targetTime = targetMillis * 1000;
     this._hasFinished = false;
   }
   
   public void updateTimer() {
     int elapsedTime = millis() - _saveTime;
     
     if (elapsedTime > _targetTime) {
       this._hasFinished = true;
     }
   }
   
   // Getters
   public boolean getHasFinished() {
     return this._hasFinished;
   }
    
   // Setters
}
