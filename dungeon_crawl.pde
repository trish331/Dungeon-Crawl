//Tricia Sun
//Oct 20 2021
//1-3


boolean mouseReleased;
boolean wasPressed;
boolean wkey, skey, akey, dkey;
boolean upkey, downkey, rightkey, leftkey, spacekey;

Button blueButton, darkButton, redButton, blackButton, brownButton, redButton1, redButton2, redButton3, redButton4;
color bkg;

//color pallete
color blue   = #4D30D6;
color dark  = #0E5175;
color red   = #F76DDC;
color brown = #752C1D;
color black  = #000000;
color iblue = #1c80d7;
color igreen = #1cd747;
color pink = #d71c83;
color purple = #b71cd7;
color ipurple = #a8329e;
color green = #2cc61f;
color darkred = #c6311f;
color yellow = #F7F3E1;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int SHOTGUN_THRESHOLD =50;
final int SHOTGUN_BULLETSPEED = 5;
final int SPAWNINGPOOL_HP =50;
final int SPAWNINGPOOL_SIZE =100;
final int SPAWNINGPOOL_THRESHOLD =100;
final int SNIPER_RIFLE_THRESHOLD =100;
final int SNIPER_RIFLE_BULLETSPEED=20;
final int AUTOPISTOL_THRESHOLD=10;
final int AUTOPISTOL_BULLETSPEED=5;


//dropped item types
final int AMMO =0;
final int HEALTH=1;
final int GUN=2;
//GIF
AnimatedGIF myGIF;
AnimatedGIF yourGIF;
AnimatedGIF ourGIF;
AnimatedGIF myGIFGameOver;
AnimatedGIF yourGIFGameOver;
AnimatedGIF ourGIFGameOver;
AnimatedGIF SkeletonUp;
AnimatedGIF SkeletonDown;
AnimatedGIF SkeletonLeft;
AnimatedGIF SkeletonRight;
ArrayList<GameObject> myObjects;
Hero myHero;
ArrayList<DarknessCell> darkness;


//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//health image
PImage health;


void setup () {
  size (800, 600);
  //Create objects
  myObjects = new ArrayList <GameObject>(100);
  myGIF = new AnimatedGIF (56, 10, "frame_", "_delay-0.06s.png", 100, 100, 200, 200);
  yourGIF = new AnimatedGIF (56, 10, "frame_", "_delay-0.06s.png", 500, 500, 300, 300);
  ourGIF = new AnimatedGIF (56, "frame_", "_delay-0.06s.png");
  myGIFGameOver = new AnimatedGIF (48, 10, "frame_", "_delay-0.04s.gif", 100, 100, 200, 200);
  yourGIFGameOver = new AnimatedGIF (48, 10, "frame_", "_delay-0.04s.gif", 500, 500, 300, 300);
  ourGIFGameOver = new AnimatedGIF (48, "frame_", "_delay-0.04s.gif");
  SkeletonUp = new AnimatedGIF (4, 10, "Skeleton/_up/SkeletonUp_", ".png", 100, 100, 200, 200);
  SkeletonDown = new AnimatedGIF (4, 10, "Skeleton/_down/SkeletonDown_", ".png", 100, 100, 200, 200);
  SkeletonLeft = new AnimatedGIF (4, 10, "Skeleton/_left/SkeletonLeft_", ".png", 100, 100, 200, 200);
  SkeletonRight = new AnimatedGIF (4, 10, "Skeleton/_right/SkeletonRight_", ".png", 100, 100, 200, 200);
  myHero = new Hero();
  myObjects.add(myHero);
  //myObjects.add(new Enemy());
  //myObjects.add(new Follower(1, 2));
  //myObjects.add(new Follower(2, 1));
  //myObjects.add(new Lurker(1, 3));
  //myObjects.add(new Lurker(3, 1));


  myObjects.add(new Spawner(3, 2));
  //myObjects.add(new Spawner(5,2));


  //create darkness
  darkness = new ArrayList <DarknessCell> (1000);
  float size = 5;
  int x=0;
  int y=0;
  while (y <height) {
    darkness.add (new DarknessCell(x, y, size));
    x += size;
    if (x>= width) {
      x=0;
      y +=size;
    }
  }


  bkg = black;

  brownButton  = new Button("START", 400, 400, 200, 100, red, blue);
  mode = INTRO;
  textSize (1);
  darkButton = new Button ("RESTART", 600, 200, 200, 100, #0F67FA, #ED0FFA);
  blackButton = new Button ("EXIT", 200, 200, 200, 100, #169D8C, #459D16);
  redButton = new Button (":)", 150, 150, 50, 50, #FFFFFF, #000000);
  redButton1 = new Button (":)", 350, 150, 50, 50, #FFFFFF, #000000);
  redButton2 = new Button (":)", 550, 150, 50, 50, #FFFFFF, #000000);
  redButton3 = new Button ("X", 100, 600, 50, 50, #FFFFFF, #000000);
  redButton4 = new Button ("X", 100, 600, 50, 50, #FFFFFF, #000000);

  map = loadImage ("map.png");
  health = loadImage ("health.png");



  //Loading the enemies from the map
  x=0;
  y=0;
  while (y<map.height) {
    color roomColor = map.get(x, y);
    if (roomColor ==igreen) {
      myObjects.add (new Enemy (x, y));
    }

    if (roomColor ==iblue) {
      myObjects.add(new Follower (x, y));
    }

    if (roomColor == pink) {
      myObjects.add (new Lurker (x, y));
    }

    if (roomColor == purple) {
      myObjects.add (new Spawner (x, y));
    }
    x++;
    if (x== map.width) {
      x=0;
      y++;
    }
  }
}

void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Mode error: " + mode);
  }



  //mousePressed;
  //!mousePressed;
  click();
}


void click() {
  //if (mode == INTRO) {
  //  intro ();
  //} else if (mode == GAME) {
  //  game ();
  //} else if (mode == PAUSE) {
  //  pause ();
  //} else if (mode == GAMEOVER) {
  //  gameover ();
  //} else {
  //  println ("Mode error: " + mode);
  //}



  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
