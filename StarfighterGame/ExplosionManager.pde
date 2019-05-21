 class ExplosionManager {
  ArrayList<Explosion> explosions;

  ExplosionManager() {
    explosions = new ArrayList<Explosion>();
  }
  void update() {
    for (int i = explosions.size() - 1; i > 0; i--) {
      Explosion e = explosions.get(i);
      //explosionSound.play();
      if (e.hasPerished()) {
        explosions.remove(i);
        //explosionSound.rewind();
      } 
      else {
        // enemyManager.checkCollision(b);
        e.show();
      }
    }
  }

  int size() {
    return explosions.size();
  }

  void add(Explosion e) {
    explosions.add(e);
  }
}