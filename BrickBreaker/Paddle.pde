class Paddle {
  float px, py, pw, ph;



  Paddle() {
    px = mouseX;
    py = 700;
    pw = 100;
    ph = 15;
  }

  void show() {
    px = mouseX;
    fill(blue);
    stroke(black);
    strokeWeight(5);
    rect(px, py, pw, ph);

    /*if (mouseX <= 50) {
      x = 50;
    } 
    else {
      x = mouseX;
    }*/
  }
  
  void grow() {
    pw = pw + 5;
  }
  
  void shrink() {
    pw = pw - 1.25;
  }
}