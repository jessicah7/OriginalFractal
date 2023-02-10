int points = 0; 
int siz = 200;

public void setup() {
  size(800,800);
  rectMode(CENTER);
}
public void draw() {
  background(255);
  myFractal(400,400,siz);
}

void mouseClicked() {
  points++;
  if (points > 10)
    points = 0;
}

public void keyPressed() {
  if(keyCode == UP)
    siz+=20;
  if(keyCode == DOWN)
    siz-=20;
}
public void myFractal(int x, int y, int mySize) {
  fill(243, 209, 221);
  star(x,y,mySize,mySize*2,5 + points);
  fill(247, 207, 197);
  star(x,y,mySize*2, mySize,5 + points);
  fill(229, 89, 130);
  star(x,y,mySize/2, mySize,5 + points);
  fill(222, 141, 174);
  star(x, y, mySize, mySize/2, 5 + points);
  if(mySize > 20) {
    myFractal(x,y, mySize/2);
  }
}

//star function from processing.org
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
