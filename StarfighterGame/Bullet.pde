class Bullet {
  float vx, vy;
  float x, y, d;
  boolean good, alive;

  //Bullet(float x, float y) {
  //this.x (instance variable) = x;
  //this.y = y;
  Bullet(float x, float y, boolean g) {
    this.good = g;
    this.x = x;
    this.y = y;
    vx = 0;
    vy = -10;
    d = 10;
    alive = true;
  }

  Bullet(float x, float y, float angle, float speed, boolean g) {
    this.good = g;  
    this.x = x;
    this.y = y;

    angle = map(angle, 0, 360, 0, TWO_PI);
    vx = cos(angle) * speed;
    vy = sin(angle) * -speed;
    d = 10;
    alive = true;
  }

  void show() {
    //fill(#7F00F0);
    noStroke();
    if (good) {
      fill(#2BEFED);
      ellipse(x, y, d, d);
    } else {
      fill(#FF0049);
      ellipse(x, y, d, d);
    }
  }

  void move() {
    x = x + vx;
    y = y + vy;
  }

  void ememyShow() {
    fill(#ffffff);
    noStroke();
    ellipse(x, y, 50, 50);
  }

  void enemyMove() {
    x = x + -vx;
    y = y + -vy;
  }

  boolean hasPerished() {
    if (alive == false) {
      return true; 
    }
    if (x > width || x < 0 || y < 0 || y > height) {
      return true;
    } else {
      return false;
    }
  }
}