//color blue = #0039FF;
color blue = #993CF3;
color red = #FF0004;
color black = #000000;
int n = 84;
Ball ball = new Ball();  //easier
Paddle paddle;
Block[] blocks;
int x = 0;

int BOUNCE_UP = 1;
int BOUNCE_DOWN = 2;
int BOUNCE_LEFT = 3;
int BOUNCE_RIGHT = 4;

ArrayList<Powerup> powerups;


void setup() {
  size(720, 720);
  imageMode(CENTER);
  rectMode(CENTER);
  strokeWeight(5);
  paddle = new Paddle();  //can go here also
  blocks = new Block[n];
  powerups = new ArrayList<Powerup>(n);

  int i = 0;
  int x = 83;
  int y = 85;

  while (y <= 400) {
    while (x <= 660) {
      blocks[i] = new Block(x, y);
      i++;
      x = x + 50;
    }
    x = 83;
    y = y + 50;
  }
}

void draw() {

  background(233);

  ball.show();
  ball.move();
  paddle.show();
  int i = 0;
  while (i < n) {
    if (blocks[i].alive) {
      blocks[i].show();
      blocks[i].hit();
    } 
    i++;
  }
  x = 0;
  i = 0;
  while (i < powerups.size ()) {
    Powerup q = powerups.get(i);
    if (q.alive) {
      q.power();
      q.show();
    }
    i++;
    println(i);
    //println(powerups.size());
  }
}



boolean rectBall(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  } 
  else {            // if not, return false
    return false;
  }
}

int rectBallDirected(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    // Determine which direction ball should bounce
    if (y2+h2/2 > y1+h1/2) {
      return BOUNCE_DOWN; // bounce down
    } else if (y2-h2/2 < y1-h1/2) {
      return BOUNCE_UP; // bounce up
    } else if (x2-w2/2 < x1-w1/2) {
      return BOUNCE_LEFT; // bounce left
    } else {
      return BOUNCE_RIGHT; // bounce right
    }
  } 
  else {
    return 0; // no hit
  }
}


void mouseReleased() {
  if (ball.lives<=0) {
    ball.lives = 3;
    ball.score = 0;
    ball.bx  = 8;
    ball.by  = 710;
    ball.vx  = 0.5;
    ball.vy  = -2;
    paddle.pw = 100;
    loop();

    int i = 0;
    int x = 83;
    int y = 85;

    while (y <= 400) {
      while (x <= 660) {
        blocks[i] = new Block(x, y);
        i++;
        x = x + 50;
      }
      x = 83;
      y = y + 50;
    }
  }
  if (ball.score==84) {
    ball.lives = 3;
    ball.score = 0;
    ball.bx  = 8;
    ball.by  = 710;
    ball.vx  = 0.5;
    ball.vy  = -2;
    paddle.pw = 100;
    loop();

    int i = 0;
    int x = 83;
    int y = 85;

    while (y <= 400) {
      while (x <= 660) {
        blocks[i] = new Block(x, y);
        i++;
        x = x + 50;
      }
      x = 83;
      y = y + 50;
    }
  }
}