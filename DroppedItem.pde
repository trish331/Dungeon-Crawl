class DroppedItem extends GameObject {
  int type;
  Weapon w;

  DroppedItem (float x, float y, int rx, int ry) {
    type =int (random(1, 3));
    w = new ShotGun();
    //w = new AutoPistol();
    hp=1;
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = ipurple;
  }

  void show () {
    stroke (black);
    strokeWeight (2);
    if (type == HEALTH) {
      image (health, location.x, location.y);
      health.resize (100, 0);
      c = yellow;
    } else if (type == GUN) {
      c = ipurple;
      circle (location.x, location.y, size);
    }
    fill(c);
    
  }

  void act () {
    //do nothing, not evem get shot or move
  }
}
