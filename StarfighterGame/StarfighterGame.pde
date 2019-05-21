PImage[] explosionPics;
PImage[] fighterPics;
PImage redfighter;
PImage bossfighter;
PImage enemyfollow;
PImage pausebutton;

PFont font;

import ddf.minim.*;
AudioPlayer introSong;
AudioPlayer gameSong;
AudioPlayer explosionSound;
Minim minim;//audio context
ExplosionManager explosionManager;

Starfield starfield;
Keyboard kbd;
Starfighter starfighter;
Gun gun;
EnemyManager enemyManager;

boolean power = false;
boolean BIGGUN = false;
int time;
int score = 0;
int hitPoints;
int lives = 15;
int highscore = 0;
boolean start = false;
boolean bosstime = false;
boolean gamewin = false;


final int INTRO = 1;
final int PLAYING = 2;
final int PAUSED = 3;
final int GAMEOVER = 4;

int Mode;

int life = 1000;

int n = 84;
ArrayList<Powerup> powerups;

int y = 1100;


void setup() {
  //tint(255, 255, 255,10);

  Mode = INTRO;
  noStroke();
  // frameRate(20);
  fullScreen();
  textAlign(CENTER);
  rectMode(CENTER);
  starfield = new Starfield();
  kbd = new Keyboard();
  starfighter = new Starfighter();
  //starfighterManager = new StarfighterManager();       
  gun = new Gun();
  enemyManager = new EnemyManager();


  explosionManager = new ExplosionManager();

  explosionPics = new PImage[24];

  for (int i = 0; i < explosionPics.length; i++) {
    explosionPics[i] = loadImage("Images/explosion_"+i+".png");
  }

  fighterPics = new PImage[11];

  for (int i = 0; i < fighterPics.length; i++) {
    fighterPics[i] = loadImage("Rocketship/fighter_"+i+".gif");
  }

  redfighter = loadImage("Images/redfighter.png");

  enemyfollow = loadImage("Images/shipfollow.png");

  bossfighter = loadImage("Images/bossfighter.png");

  pausebutton = loadImage("Images/pauseButton.png");


  powerups = new ArrayList<Powerup>(n);
  minim = new Minim(this);
  gameSong = minim.loadFile("Pulse.mp3", 2048);

  introSong = minim.loadFile("Video Game music.mp3", 2048);

  explosionSound = minim.loadFile("explosion.mp3", 2048);

  //player.rewind();
  //player.setVolume(0.5);
}

void draw() {
  if (Mode == INTRO) 
    introScreen();
  else if (Mode == PLAYING)
    drawGame();
  else if (Mode == PAUSED)
    pausedScreen();
  else if (Mode == GAMEOVER)
    gameOver();
  //println(Mode);

  int i = 0;
  while (i < powerups.size ()) {
    Powerup q = powerups.get(i);
    if (q.alive) {
      q.power();
      q.show();
    }
    i++;
  }
}

//if (framecount > 1000 && framecount < 1500 && frameCount % 160 == 0)



void introScreen() {
  introSong.play();

  font = loadFont("StarfighterItalic-200.vlw");
  textFont(font, 32);

  starfield.show();
  fill(0, 75);
  rect(0, 0, width + width, height + height);

  textSize(35);
  textAlign(CENTER);

  if (y <= height/2) {
    stroke(255);
    //  fill(#190AFF);
    //rect(width/2, height/2 + 100, 150, 100);
    fill(#FFFFFF);
    text("Start", width/2, height/2 + 115);
  }
  stroke(255);
  textSize(100);
  fill(#190AFF);
  text("StarFighter", width/2, y);
  if (y >= height/2 - 60) {
    y = y - 10;
  }
} 


void drawGame() {
  gamewin = false;
  fill(0, 75);

  //println("1");
  rect(0, 0, width + width, height + height);

  fill(#2BEFED);
  rect(width/2, height - 100, life, 10);

  image(pausebutton, width - 50, 25, 25, 25);

  gameSong.play();
  introSong.pause();

  // println("2");

  starfield.show();
  // println("3");

  starfighter.move();
  // println("4");
  starfighter.show();

  starfighter.time();

  // println("5");
  gun.update();
  // println("6");


  makeEnemies();


  enemyManager.update();

  //println("7");    
  explosionManager.update();




  drawScore();
  loop();
}

void makeEnemies() {
  if (!bosstime) {
    if (score <=100) {
      if (frameCount % 35 == 0) {
        enemyManager.add(new Enemy());
      }
      if (frameCount % 130 == 0) {
        enemyManager.add(new EnemyFollow());
      }
    } 
    if (score > 100 && score <= 200) {
      if (frameCount % 25 == 0) {
        enemyManager.add(new Enemy());
      }
      if (frameCount % 90 == 0) {
        enemyManager.add(new EnemyFollow());
      }
    }
    if (score >= 200) {
      if (frameCount % 15 == 0) {
        enemyManager.add(new Enemy());
      }
      if (frameCount % 60 == 0) {
        enemyManager.add(new EnemyFollow());
      }
    }
    if (score == 300 || score == 301) {
      bosstime = true;
      //enemyManager = new EnemyManager();
      enemyManager.add(new EnemyBoss());
    }
  }
}


void keyPressed() {
  println("\n\n\n keyPressed \n\n\n");
  kbd.pressKey(key, keyCode);
}

void keyReleased() {
  kbd.releaseKey(key, keyCode);
}


boolean rectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {

  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  } 
  else {            // if not, return false
    return false;
  }
}


void drawScore() {
  textAlign(LEFT);
  textSize(30);
  fill(#FFFFFF);
  text("Score " + score, 20, 40);

  text("Lives " + lives, 20, 90);

  text("Highscore " + highscore, 20, 140);

  if (lives < 0) {
    Mode = GAMEOVER;
  }
}

void mouseReleased() {
  println(Mode);
  if (Mode == INTRO) {
    if (y <= height/2) {
      Mode = PLAYING;
    }
  }
  if (lives < 0) {
    score = 0;
    lives = 14;
    starfighter.x = width/2;
    starfighter.y = height-100;
    Mode = PLAYING;
  }
  if (Mode == PLAYING) {
    if (mouseX >= width - 50 && mouseX <= width -25 && mouseY <= 50 && mouseY >= 25) {
      Mode = PAUSED;
    }
  } 
  else if (Mode == PAUSED) {
    Mode = PLAYING;
  } 
  else if (Mode == GAMEOVER) {
    Mode = PLAYING;
    start = true;
    enemyManager = new EnemyManager();
    gun = new Gun();
    starfighter = new Starfighter();
  } 
  else {
    println("???");
  }
}

void pausedScreen() {
  println("Hey");
  gameSong.pause();
  fill(#FFFFFF);
  textSize(100);
  textAlign(CENTER);
  text("PAUSED", width/2, height/2);
}


void gameOver() {
  if (gamewin == true) {
    start = false;
    enemyManager = new EnemyManager();
    gun = new Gun();
    bosstime = false;
    textAlign(CENTER);
    fill(#4EFF1A);
    textSize(100);
    text("YOU WIN!", width/2, height/2 - 100);
    text("RETRY", width/2, height/2 + 100);
  }
  if (lives < 0 && gamewin == false) {
    start = false;
    enemyManager = new EnemyManager();
    gun = new Gun();
    textAlign(CENTER);
    fill(#FF0000);
    textSize(100);
    text("GAME OVER", width/2, height/2 - 100);
    text("RETRY", width/2, height/2 + 100);
  }
  score = 0;
  life = 1000;
  lives = 15;
}

/* boolean rectBall(float rx, float ry, float rw, float rh, float bx, float by, float d) {
 
 // first test the edges (this is necessary if the rectangle is larger
 // than the ball) - do this with the Pythagorean theorem
 
 // if ball entire width position is between rect L/R sides
 if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
 return true;
 }
 // if not, check if ball's entire height is between top/bottom of the rect
 else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
 return true;
 }
 }
 */