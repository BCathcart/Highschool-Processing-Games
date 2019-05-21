class Block {
  float x, y;
  float w, h;
  boolean alive;
  color c;

  Block(float incomingX, float incomingY) {
    y = incomingY;
    x = incomingX;
    w = 50;
    h = 50;
    alive = true;
    //c  = color((int)random(255), (int)random(255), (int)random(255));
    c = #6FFF00;
  }
  void show() {
    if (alive) {
      fill(c);
      rect(x, y, w, h);
    }
  }


  void hit() {
    int bounceDirection = rectBallDirected(x, y, w, h, ball.bx, ball.by, ball.d, ball.d);
    if (bounceDirection != 0) {
      alive = false;
      ball.hitBlock(bounceDirection);
      int rng = (int)random(10);
      if (rng > 7) {
        Powerup p = new Powerup(x, y);
        powerups.add(p);
      }
    } else {
      alive = true;
    }
  }
}