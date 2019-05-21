class EnemyFollow extends Enemy {

  EnemyFollow() {
    super();
    vy = 5;
    d = 40;
  }
  void show() {
    image(enemyfollow, x - 20, y - 20, d, d);
  }

  void move() {
    super.move();
    if (starfighter.x > x) {
      vx = 5;
    }
    if (starfighter.x < x) {
      vx = -5;
    }
  }
}