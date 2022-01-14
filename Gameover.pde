void gameover () {
  ourGIFGameOver.show();
  myGIFGameOver.show();
  yourGIFGameOver.show();
  fill (#FA320F);
  textSize (100);
  text ( "GAMEOVER", width/2, height/2);
  darkButton.show();
  blackButton.show();
  if (darkButton.clicked) {
    setup();
    mode = GAME;
  }
  if (blackButton.clicked) {
    setup();
    mode = INTRO;
  }
  
  myHero.hp = 100;
}

void gameoverClicks () {
  //if ( == 0) {
  //  mode = GAMEOVER;
  //}
}
