//class health {

//  int health;
//  int hp;
//}
//void show () {
//  health = loadImage ("health.png");
//}

//void act () {
//  boolean isCollidingWith (GameObject myObj) {
//    float d = dist (myObj.location.x, myObj.location.y, location.x, location.y);
//  }
//  int i =0;
//  while (i <myObjects.size()) {
//    GameObject obj = myObjects.get(i);
//    //if (obj instanceof Bullet && isCollidingWith(obj)) {
//    //  hp = hp - int (obj.velocity.mag());
//    //  obj.hp = 0;
//    //}
//    if (obj instanceof DroppedItem && isCollidingWith(obj)) {
//      DroppedItem item = (DroppedItem) obj;
//      if (item.type == HEALTH) {
//        Health = item.w;
//        item.hp=0;
//      }
//    }
//    i++;
//  }
//  if (hp <=0) {
//    myObjects.add (new DroppedItem(location.x, location.y, roomX, roomY));
//  }
//}
