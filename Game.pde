void game () {
  drawRoom();
  drawGameObjects();
  //drawLightLayer();
  drawMiniMap();
  drawDarkness();
  redButton3.show();
  if (redButton3.clicked) {
    mode = PAUSE;
  }
}





void drawRoom () {
  background(brown);

  //draw corners
  stroke(black);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //Draw exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //draw the doors
  noStroke();
  fill(black);
  if (northRoom !=#FFFFFF) {
    ellipse (width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }
  ////draw floor
  rectMode(CENTER);
  stroke(black);
  fill(brown);
  rect (width/2, height/2, width*0.9, height*0.9);
  //  //draw floor
  //rectMode(CENTER);
  //stroke(black);
  //fill(brown);
  //rect (width/2, height/2, width*0.9, height*0.9);
}

void drawGameObjects () {
  for (int i=0; i <myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <=0) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}


void drawMiniMap () {
  float size = 10;
  int x =0;
  int y =0;
  while (y <map.height) {
    color c = map.get(x, y);
    fill(c);
    noStroke();
    square (x*size, y*size, size);
    x= x+1;
    if (x >= map.width) {
      x=0;
      y = y+1;
    }
  }
  fill (red);
  square (myHero.roomX*size, myHero.roomY*size, size);
}

void drawDarkness() {
  rectMode(CORNER);
  int i=0;
  while ( i < darkness.size()) {
    darkness.get(i).show();
    i++;
  }
  rectMode(CENTER);
}
