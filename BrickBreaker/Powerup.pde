class Powerup {
  float vx, vy; 
  float x, y, d;
  boolean alive = true;

  Powerup(float incomingX, float incomingY) {
    x = incomingX;
    y = incomingY;
    d = 10;
    vx = 0;
    vy = 2;
  }

  void show() {
    fill(#4D4DFF);
    strokeWeight(2);
    ellipse(x, y, d, d);
    x = x + vx;
    y = y + vy;
  }
  void power() {
    if (rectBall(x, y, d, d, paddle.px, paddle.py, paddle.pw, paddle.ph)) {
     alive = false;
      paddle.grow();
      //ball.score();
      //powerups.remove(0);
    }
  }
}