class Enemy extends GameObject {

  Enemy() {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    size = 50;
    roomX = 1;
    roomY= 1;
    xp =5;
  }
  Enemy(int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    size = 50;
    roomX = x;
    roomY= y;
    xp = 5;
  }

  Enemy(int _hp, int s, int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY= y;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (dark);
    circle(location.x, location.y, size);
    fill (black);
    textSize (20);
    text(hp, location.x, location.y);
  }

  void act () {
    super.act();

    int i =0;


    while (i <myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {

        hp = hp - int(obj.velocity.mag());
        obj.hp=0;
        if (hp <=0) {
          myObjects.add (new DroppedItem(location.x, location.y, roomX, roomY));
          myObjects.add (new Message (location.x, location.y));
          myHero.xp = myHero.xp + xp;
          //myObjects.add (new DroppedItemHealth()));
        }
      } 
      if (myHero.immunity == false) {
        if (obj instanceof Hero && isCollidingWith(obj)) {
          obj.hp--;
          myHero.immunity = true;
          println ("e;c");
        }
      }
      i++;
    }
  }
}
