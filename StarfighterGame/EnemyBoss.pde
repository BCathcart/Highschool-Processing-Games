class EnemyBoss extends Enemy {

  EnemyBoss() {
    super();
    x = width/2;
    y = 125;
    vx = 5;
    vy = 5;
    d = 200;
    hp = 300;
  }
  void show() {
    fill(#4EFF1A);
    image(bossfighter, x - 100, y - 100, d, d);
    if (hp <= 2) {
      gamewin = true;
      Mode = GAMEOVER;
    }
    println(hp);
  }

  void move() {
    x = x + vx;
    y = y + vy;
    if ((x > width - s/2) || (x < s/2)) {
      vx = vx * -1;
    }

    if ((y > height - s/2) || (y < s/2)) {
      vy = vy * -1;
    }
  }
}