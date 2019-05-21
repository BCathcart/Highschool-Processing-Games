class EnemyManager {
  ArrayList<Enemy> enemies;


  EnemyManager() {
    enemies = new ArrayList<Enemy>();
  }
  void update() {
    for (int i = enemies.size () - 1; i > 0; i--) {
      Enemy e = enemies.get(i);
      if (e.hasPerished()) {
        enemies.remove(i);
      } 
      else {
        e.show();
        e.move();
        e.fire();
      }
    }
  }

  void add(Enemy e) {
    enemies.add(e);
  }

  void checkCollision (Bullet b) {
    int i = 0;
    while (i < enemies.size ()) {
      Enemy e = enemies.get(i);
      if ((rectRect(b.x, b.y, b.d, b.d, e.x, e.y, e.d, e.d) && b.good)) {  //|| (rectRect(starfighter.x, starfighter.y, starfighter.s, starfighter.s, e.x, e.y, e.d, e.d))
        int rng = (int)random(20);
        if (rng > 17 && !bosstime) {
          Powerup p = new Powerup(e.x, e.y);
          powerups.add(p);
        }
        Explosion exp = new Explosion(e.x - 50, e.y - 50);
        explosionManager.add(exp);
        e.hp--;
        score++;
        b.alive = false;
      } 
      if (score > highscore) {
        highscore++;
      }
      i++;
      println(enemies.size());
    }
  }
}