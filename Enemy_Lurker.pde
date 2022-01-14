class Lurker extends Enemy {

  Lurker (int x, int y) {
    super(100, 50, x, y);
    xp =5;
  }
  void show () {

    stroke (black);
    strokeWeight (2);
    fill (blue);
    circle(location.x, location.y, size);
    fill (black);
    textSize (20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();


    if (dist(myHero.location.x, myHero.location.y, location.x, location.y )<100) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(1);
    }
  }
}
