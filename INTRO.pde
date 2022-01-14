void intro () {
  imageMode(CENTER);
  background(bkg);
  ourGIF.show();
  myGIF.show();
  yourGIF.show();
  //blueButton.show();
  //darkButton.show();
  brownButton.show();
  //blackButton.show();

  //if (blueButton.clicked) {
  //  bkg = blue;
  //}
  //if (darkButton.clicked) {
  //  bkg = dark;
  //}
  if (brownButton.clicked) {
    mode = GAME;
  }
}

void introClicks () {
  mode=GAME;
}
