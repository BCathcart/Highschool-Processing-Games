class Enemy {
  float vx, vy;
  float x, y, d, s;

  int hp;


  Enemy() {
    x = random(width);
    y = 0;
    vx = 0;
    vy = random(1.5, 3.5);
    d = 50;
    s = 200;
    hp = 1;
  }


  void show() {
    fill(#FF0004);
    noStroke();
    image(redfighter, x - 25, y - 25, d, d);
  }

  void move() {
    x = x + vx;
    y = y + vy;
  }



  void fire() {
    if (frameCount % 60 == 0) {
      float bearing = -atan2(starfighter.y - y, starfighter.x - x);
      bearing = map(bearing, 0, TWO_PI, 0, 360);
      Bullet b = new Bullet(x, y + 50, bearing, 10, false);
      gun.add(b);
    }
    if (bosstime) {
      if (frameCount % 300 == 0) {
        for (int i = 30; i <= 360; i = i + 30) {
          Bullet b = new Bullet(x, y+ 50, i, 10, false);
          gun.add(b);
        }
      }
      /*
    if (frameCount % 75 == 10) {
       for (int i = 0; i <= 90; i = i + 180) {
       Bullet b = new Bullet(x, y+ 50, 270, 10, false);
       gun.add(b);
       println(i);
       }
       } */
    }
  }


  boolean hasPerished() {
    if (hp <= 0) {
      return true;
    }

    if (x > width || x < 0 || y < 0 || y > height) {
      return true;
    } 
    else {
      return false;
    }
  }
}