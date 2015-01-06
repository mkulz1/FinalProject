// 2D Array of objects
Cell[][] grid;
int turn = 0;

// Number of columns and rows in the grid
int cols = 7;
int rows = 5;

void setup() {
  background(0);
  size(700, 500, P2D);
  grid = new Cell[cols][rows];
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*100, j*100, 100, 100);
      grid[i][j].display();
    }
  }
}

void mousePressed() {
  if ( turn % 2 == 0) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }
  PShape token = createShape(ELLIPSE, deterColumn(mouseX), mouseY, 90, 90);
  shape(token);
  turn++;
}


void draw() {
}

int deterColumn(int x) {
  int center = 0;
  if ( x > 50 && x < 150) {
    center = 100;
  } else if ( x >= 150 && x < 250) {
    center = 200;
  } else if ( x >= 250 && x < 350) {
    center = 300;
  } else if ( x >= 350 && x < 450) {
    center = 400;
  } else if ( x >= 450 && x < 550) {
    center = 500;
  } else if ( x >= 550 && x < 650) {
    center = 600;
  } else {
  }
  return center;
}

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

