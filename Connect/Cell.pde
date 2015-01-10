// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x, y;   // x,y location
  float w, h;   // width and height
  boolean filled;

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    filled = false;
  } 

  void display() {
    stroke(0);
    fill(255, 255, 0);
    rectMode(CENTER);
    rect(x, y, w, h); 
    stroke(255);
    fill(255, 200, 40);
    ellipse(x, y, 90, 90);
    shapeMode(CENTER);
  }
}
