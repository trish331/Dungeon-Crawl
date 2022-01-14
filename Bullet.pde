class Bullet extends GameObject {

  int timer;
  int size;
  int c;


  Bullet(PVector _aim, int _colour, int _size) {
    timer=60;
    hp = 70;
    location = new PVector(myHero.location.x, myHero.location.y);
    //velocity = new PVector(myHero.direction.x, myHero.direction.y);

    size=10;
    velocity = _aim;
    velocity.setMag(10);
    c = _colour;
    size = _size;
    velocity=_aim;
    velocity.setMag (5);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    //println ("moo");                   
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    //println ("instant");

    super.act();
    timer --;
    if (timer <=0) {
      hp=0;
    }
  }
}
