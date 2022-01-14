class DarknessCell {
  float opacity;
  float x, y, s, d;

  DarknessCell(float _x, float _y, float size) {
    s = size;
    x= _x;
    y = _y;
    opacity = random(0, 255);
  }

  void show () {

    d = dist (x, y, myHero.location.x, myHero.location.y);
    opacity = map (d, 0, 600, 0, 255);
    fill (black, opacity);
    square (x, y, s);
    noStroke();
  }
}
