class Explosion {

  float vx, vy;
  float x, y, d;
  int costumeNumber;
  boolean alive = true;

  Explosion(float incX, float incY) {
    x = incX;
    y = incY;
    vx = 0;
    vy = 3;
    d = 100;
    costumeNumber = 0;
  }

  void show() {
    PImage costume = explosionPics[costumeNumber];
    image(costume, x, y, d, d);
    costumeNumber++;
    //explosionSound.play();
    
  }


  boolean hasPerished() {
    if (costumeNumber==explosionPics.length - 1) {
      return true;
    } 
    else {
      return false;
    }
  }
}