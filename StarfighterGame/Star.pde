class Star {

  float x, y;
  float vx, vy;
  float s;

  Star() {
    x = random(width);
    y = random(height);
    vx = 0;
    vy = random(0.5, 5);
  }
  void show() {
    fill(#FFFFFF);
    ellipse(x, y, vy, vy);
  }
  void update() {
    y = y + 2*vy;
    x = x + vx;
    if (y > height) {
      y = 0;
      x = random(width);
    }
  }
}