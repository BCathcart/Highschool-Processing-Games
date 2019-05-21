class Starfighter {
  float x, y;
  float vx, vy;
  float s;
  int costume;

  Starfighter() {
    x = width/2;
    y = height/2;
    vx = 0;
    vy = 0;
    s = 60;
    costume = 5;
  }
  void move() {

    x = x + vx;
    y = y + vy;

    vx = vx*0.95;
    vy = vy*0.95;


    if (kbd.holdingLeft) {
      vx = vx - 1;
      vx = max(vx, -15);
      if (costume > 0) {
        costume--;
      }
    }
    if (kbd.holdingRight) {
      vx = vx + 1;
      vx = min(vx, 15);
      if (costume < 10) {
        costume++;
      }
    }
    if (kbd.holdingUp) {
      vy = vy - 1;
      vy = max(vy, -15);
    }

    if (kbd.holdingDown) {
      vy = vy + 1;
      vy = min(vy, 15);
    }
    if (!kbd.holdingRight && !kbd.holdingLeft) {
      if (costume > 5) {
        costume--;
      }
      if (costume < 5) {
        costume++;
      }
    }
  }

  void show() {
    fill(#1533EA);
    image(fighterPics[costume], x - 30, y - 30, s, s);

    //rect(x, y, s, s);

    if (kbd.holdingSpace) {

      if (frameCount % 5 == 0) {
        if (BIGGUN == true && time > 0) {
          for (int i = 20 ; i <= 360; i = i + 20) {
            Bullet b = new Bullet(x, y, i, 10, true);
            gun.add(b);
          }
        } 
        else {
          for (int i = 60 ; i <= 120 ; i = i + 30) {
            Bullet b = new Bullet(x, y, i, 10, true);
            gun.add(b);
          }
        }
      }
    }
  }

  void checkCollision (Bullet b) {
    if (rectRect(b.x, b.y, b.d, b.d, x, y, s, s) && !b.good) {
      b.y = b.y * -1;
      b.x = b.x * -1;
      lives--;
      life = life - 67;
      if (!bosstime) {
        enemyManager = new EnemyManager();
        gun = new Gun();
      }
    }
  }

  /*  void checkCollision (Enemy e) {
   if (rectRect(e.x, e.y, e.d, e.d, x, y, s, s)) {s
   starfighter.x=1000;
   lives--;
   enemyManager = new EnemyManager();
   gun = new Gun();
   }
   }
   */

  void time() {

    if (time > 0) {
      if (frameCount % 1 == 0) {
        time--;
      }
    }
  }
}


/* if (kbd.holdingSpace) {
 Bullet b = new Bullet(x, y);
 gun.add(b);
 } */


/*float bearing = -atan2(enemies.y - y, enemies.x - x);
 bearing = map(bearing, 0, TWO_PI, 0, 360);
 Bullet b = new Bullet(x, y, bearing, 10, true);
 gun.add(b); */

//if (gun.size() == 10) {