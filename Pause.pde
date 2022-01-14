void pause () {
  background (#DFB5EB);
  textSize (20);
  redButton.show();
  textSize (20);
  text ("You have" + myHero.xp + "XP", 100, 200);
  redButton1.show();
  textSize (20);
  text ("HP:" + myHero.hp, 300, 200);
  redButton2.show();
  textSize (20);
  text ("speed" + myHero.speed, 500, 200);
  //text ("Damage" + myHero.damage, 500, 200);
  redButton4.show();
  if (redButton.clicked) {
    //myHero.xp--;
  }
  if (redButton1.clicked && myHero.xp >= 5) {

    myHero.hp = myHero.hp + 5;
    myHero.xp -=5;
    if (myHero.hp >= 100) myHero.hp = 100;
  }
  if (redButton2.clicked && myHero.xp >=5) {

    myHero.speed++;
    myHero.xp = myHero.hp - 5;
  }
  if (redButton4.clicked) {

    mode = GAME;
  }
}

void pauseClicks () {
}
