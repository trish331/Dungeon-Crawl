class Hero extends GameObject {

  float speed;
  Weapon myWeapon;
  AnimatedGIF currentAction;
  boolean immunity;
  int immunitytimer = 0;
  color c;

  Hero () {
    super();
    hpMax = hp = 100;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    immunity =false;
    myWeapon = new AutoPistol();
    currentAction = SkeletonDown;
    location = new PVector (100, 200);
  }

  void show () {
    imageMode(CENTER);
    //fill (blue);
    //stroke (black);
    //strokeWeight (2);  
    //circle (location.x, location.y, size);
    currentAction.show(location.x, location.y, size/1.5, size);
    //drawHealthbar();
    //println(SkeletonDown);
    //println (location);
  }

  //void drawHealthbar {

  //}

  void act() {
    super.act();

    if (immunity) {
      immunitytimer++;
    }

    if (immunitytimer >5) {
      immunity = false;
      immunitytimer =0;
      c = dark;
    }
    if (wkey) velocity.y =-speed;
    if (akey) velocity.x =-speed;
    if (skey) velocity.y =speed;
    if (dkey) velocity.x = speed;

    if (velocity.mag () >speed)
      velocity.setMag(speed);

    if (!wkey && !skey) velocity.y =velocity.y* 0.8;
    if (!akey && !dkey) velocity.x =velocity.x* 0.8;


    //check exits
    if (abs(velocity.y) >abs (velocity.x)) {
      if (velocity.y >=0) currentAction = SkeletonDown;
      else currentAction = SkeletonUp;
    } else {
      if (velocity.x >0) currentAction = SkeletonRight;
      else currentAction = SkeletonLeft;
    }

    if (!wkey && !skey && !akey && !dkey) currentAction = SkeletonDown;

    //north
    if (northRoom != #FFFFFF && location.y == height *0.1 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY--;
      location = new PVector(width/2, height *0.9-10);
      cleanUp();
    }
    if (southRoom != #FFFFFF && location.y == height *0.9 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY++;
      location = new PVector(width/2, height *0.1+10);
      cleanUp();
    }
    if (eastRoom != #FFFFFF && location.x == width *0.9 && location.y >= height/2-50 && location.y <= height/2+50) {
      println("??");
      roomX++;
      location = new PVector(width*0.1+10, height/2);
      cleanUp();
    }
    if (westRoom != #FFFFFF && location.x == width *0.1 && location.y >= height/2-50 && location.x <= height/2+50) {
      roomX--;
      location = new PVector(width*0.9-10, height/2);
        cleanUp();
    }
    myWeapon.update();
    if (spacekey) {
      println("blah");
      myWeapon.shoot();
    }
    fill (blue);
    textSize (200);
    text (hp, location.x, location.y);
    int i =0;
    if (hp == 0) {
      mode = GAMEOVER;
    }
    while (i <myObjects.size()) {
      GameObject obj = myObjects.get(i);

      //if (obj instanceof Bullet && isCollidingWith(obj)) {
      //  hp = hp - int (obj.velocity.mag());
      //  obj.hp = 0;
      //}
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp=0;
        }
        if (item.type == HEALTH) {
          hp = hp + 5;
          item.hp=0;
          if (hp >= 100) hp = 100;
        }
      }
      i++;
    }
  }
  void cleanUp() {
    int i = 0;
    while (i<myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet||obj instanceof Bullet) {
        if (!inRoomWith(obj)) {
          myObjects.remove(i);
          i--;
        }
      }
      i++;
    }
  }
}
