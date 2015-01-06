// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 7;
int rows = 5;

void setup() {
  background(0);
  size(700, 500);
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
  ellipse(mouseX,mouseY,100,100);
}


void draw() {

}



// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x, y;   // x,y location
  float w, h;   // width and height

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 


  void display() {
    stroke(0);
    fill(255, 255, 0);
    rectMode(CENTER);
    rect(x, y, w, h); 
    stroke(255);
    fill(255, 200, 40);
    ellipse(x, y, 90, 90);
  }
}



