class Starfield {
  Star[] stars;
  int n = 50;

  Starfield() {
    stars = new Star[n];

    for (int i = 0; i < n; i++) {
      stars[i] = new Star();
    }
  }
  void show() {
    for (int i = 0; i < n; i++) {
      stars[i].show();
      stars[i].update();
    }
  }
}