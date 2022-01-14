class Message extends GameObject {
  int timer;
  int threshold;

  Message(float x, float y) {
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 20;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    c = yellow;
    timer = 0;
    threshold = 50;
  }

  void show () {
    timer++;

    fill(c);
    textSize (20);
    text ("1", location.x, location.y);
  }

  void act () {
    if (timer >= threshold) hp = 0;
  }
}
