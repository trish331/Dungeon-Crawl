class AnimatedGIF {

  PImage[] pics;
  int currentFrame;
  int numFrames;
  int rate;
  float x, y, w, h;

  AnimatedGIF(int nf, String pre, String post) {
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  AnimatedGIF(int nf, int r, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }

  AnimatedGIF(int nf, int r, String pre, String post) {
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+post);
      i++;
    }
    currentFrame = 0;
    r = 7;
  }

  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image (pics[currentFrame], x, y, w, h);
    currentFrame++;
    
    //if (currentFrame >= pics.length) currentFrame = 0;
    //image(pics[currentFrame], 0, 0, width, height);
    //if (frameCount % rate == 0) currentFrame++;
  }

  void show (float x, float y, float w, float h) {
    if (currentFrame == numFrames) currentFrame = 0;
    image (pics[currentFrame], x, y, w, h);
    currentFrame++;
    
    //if (currentFrame >= pics.length) currentFrame = 0;
    //image(pics[currentFrame], 0, 0, width, height);
    //if (frameCount % rate == 0) currentFrame++;
  }
}
