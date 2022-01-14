class Follower extends Enemy {
  
  Follower (int x, int y) {
    super(100, 50, x, y);
    xp = 5;
    
    
    
  }
   void show () {

    stroke (black);
    strokeWeight (2);
    fill (red);
    circle(location.x, location.y, size);
    fill (black);
    textSize (20);
    text(hp, location.x, location.y);
  }
  
  void act() {
    super.act();
    
    velocity = new PVector (myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(1);
  }
  
}
