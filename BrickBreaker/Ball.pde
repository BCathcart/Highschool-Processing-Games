class Ball {

  float bx, by, bw, bh, d;
  float vx, vy; 
  int lives = 3;
  int score = 0;
  int highscore = score;
  // Constructors
  Ball() {
    bx  = 8;
    by  = 710;
    vx = 0;
    vy = -2.4;
    bw = 12;
    bh = 12;
    d = 20;
  }  
  //Behaviours
  void show() {
    strokeWeight(2);
    fill(red);
    ellipse(bx, by, bw, bh);
    bounce();
    lives();
     score();
  }
  void move() {
    by = by + vy;
    bx = bx + vx;
  }

  void bounce() { 

    if ((bx > width) || (bx < 0)) {
      vx = vx * -1;
    }

    if (by < 0) {
      vy = vy * -1;
    }
    by = by + vy;
    bx = bx + vx;

    if (rectBall(bx, by, bw, bh, paddle.px, paddle.py, paddle.pw, paddle.ph)) {
      vx = (bx - paddle.px)/20;
      vy = -vy;
    }
  }
  void hitBlock(int bounceDirection) {
    if (bounceDirection == BOUNCE_DOWN) {
      if (vy < 0) {
        vy = -vy;
      }
    } else if (bounceDirection == BOUNCE_UP) {
      if (vy > 0) {
        vy = -vy;
      }
    } else if (bounceDirection == BOUNCE_LEFT) {
      if (vx > 0) {
        vx = -vx;
      }
    } else if (bounceDirection == BOUNCE_RIGHT) {
      if (vx < 0) {
        vx = -vx;
      }
    }
    bx = bx + vx;
    by = by + vy;
    paddle.shrink();
    score++;
  }

  void lives() {
    fill(black);
    textSize(20);
    textAlign(LEFT);
    text("Lives " + lives, 10, 18);
    text("Score " + score, 10, 35);
    text("Highscore " + highscore, 10, 52);

    if (by >= 725) {
      lives=lives - 1;
      vy = vy * -1;
      vx = vx * -1;
      bx  = 710;
      by  = 690;


      if (lives<0) {
        //code for game over screen
        textAlign(CENTER);
        fill(#FF0000);
        textSize(20);
        text("GAME OVER", width/2, 440);
        text("RETRY", width/2, 490);
        lives=lives - 1;
        noLoop();
      } else {
        loop();
      }
    }
  }



  void score() {
    if (score > highscore) {
      highscore++;
    }
    if (score>=84) {
      textAlign(CENTER);
      text("YOU WIN!", width/2, height/2 - 25);
      //text("Score " + score, width/2, 490);
      text("RETRY", width/2, height/2 +25);
      noLoop();
    }
  }
}








  /*
rectBall(padddle.x, paddle.y, paddle.w, paddle.y, x, y, d)
   
   if (rectball(...)) {
   vy = -vy;
   vx =  (x - paddle.x)/20; (ball's x - paddle's x)
   
   
   }
   */