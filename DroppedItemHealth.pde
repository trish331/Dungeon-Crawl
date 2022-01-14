class DroppedItemHealth extends GameObject {
  int type;
  Weapon w;
  
  DroppedItemHealth (float x, float y, int rx, int ry) {
    type = HEALTH;
    w = new ShotGun();
    //w = new AutoPistol();
    hp=1;
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = yellow;
    
    
    
  }
  
  void show () {
    stroke (black);
    strokeWeight (2);
    fill(c);
    circle (location.x, location.y, size);
    
    
    
    
  }
  
  void act () {
   //do nothing, not evem get shot or move 
    
    
  }
  
  
}
