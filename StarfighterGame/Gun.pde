class Gun {
  ArrayList<Bullet> bullets;

  Gun() {
    bullets = new ArrayList<Bullet>();
  }
  void update() {
    for (int i = bullets.size () - 1; i > 0; i--) {
      Bullet b = bullets.get(i);
      if (b.hasPerished()) {
        bullets.remove(i);
      } 
      else {
        enemyManager.checkCollision(b);
        starfighter.checkCollision(b);
        b.show();
        b.move();
      }
    }
  }

  int size() {
    return bullets.size();
  }

  void add(Bullet b) {
    bullets.add(b);
  }
}