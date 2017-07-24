/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/133956*@* */

//image import variable
PImage fg;
PImage ffg;
PImage mg;
PImage bg;


boolean flag=false;
float fgX, ffgX, mgX, bgX;
float speed, bx, track;
float xOffset=0.0;


void setup() {
  size(1150, 700);
  track=bx=1200;
  bg = loadImage("bg.jpg");
  mg = loadImage("3_N.png");
  fg = loadImage("2_N.png");
  ffg = loadImage("1_N.png");
  speed = 950;
}

void draw() {
  fill(50);
  rect(0, 0, width, height);
  //logic
  if (flag) {
    ffgX = map(width-bx, 0, width, 0, -speed);
    fgX = map(width-bx, 0, width, 0, -speed*0.85);
    mgX = map(width-bx, 0, width, 0, -speed*0.7);
    bgX = map(width-bx, 0, width, 0, -speed/5);
    track = bx;
  } else {
    ffgX = map(width-track, 0, width, 0, -speed);
    fgX = map(width-track, 0, width, 0, -speed*0.85);
    mgX = map(width-track, 0, width, 0, -speed*0.7);
    bgX = map(width-track, 0, width, 0, -speed/5);
  }
  //draw
  image(bg, bgX-200, 0);
  image(mg, mgX, 0);
  image(fg, fgX, 0);
  image(ffg, ffgX, 0);
}

void mousePressed() {
  xOffset = mouseX-bx;
}

void mouseReleased() {
  flag=false;
}

void mouseDragged() {
  flag=true;
  bx = mouseX-xOffset;
}