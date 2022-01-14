class Spawner extends Enemy {
  int timer = 0;
  Spawner (int x, int y) {
    super(SPAWNINGPOOL_SIZE, SPAWNINGPOOL_HP, x, y);
    xp =5;
  }
  void show () {

    stroke (black);
    strokeWeight (2);
    fill (blue);
    square(location.x, location.y, 50);
    fill (black);
    textSize (20);
    text(hp, location.x, location.y);
  }

  void act() {
println (timer);
    timer++;
    super.act();
    if (timer == 10) {
      myObjects.add(new Follower (roomX, roomY));
      println ("scre");
     
      timer = 0;
    }
  }
}
