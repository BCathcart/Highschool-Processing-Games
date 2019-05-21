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
    if (Mode == PLAYING) {
      x = x + vx;
      y = y + vy;
    }
  }

  void power() {
    if (Mode == GAMEOVER) {
      alive = false;
    }
    if (rectRect(x, y, d, d, starfighter.x, starfighter.y, starfighter.s, starfighter.s)) {
      alive = false;
      time = 100;
      BIGGUN = true;
    }
  }
}