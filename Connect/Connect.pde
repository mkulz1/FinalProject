// 2D Array of objects
Cell[][] grid;
// ArrayList of all tokens that have been placed
ArrayList<Token> tokens = new ArrayList<Token>();
int turn = 0;

// Number of columns and rows in the grid (+1 than actual)
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
<<<<<<< HEAD
  ellipse(deterColumn(mouseX), deterRow(mouseY), 90, 90);
=======
  // Creates a PShape as a token, which is more interactive than a regular ellipse
  PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
  // Adds the PShape to a new Token class
  Token token = new Token(shape, deterColumn(mouseX), mouseY);
  // Adds the Token to the tokens ArrayList
  tokens.add(token);
>>>>>>> FETCH_HEAD
  turn++;
}
  
void draw() {
  setup();
  // Goes through the ArrayList of tokens and displays them based on their current values
  for (int i = 0; i < tokens.size(); i++){
    Token currentToken = tokens.get(i);
    shape(currentToken.shape, currentToken.x, currentToken.y);
    // Gradually lowers the y value if the token is not at the bottom
    if (currentToken.y < height - 100){
      currentToken.y = currentToken.y + 20;
    }
    // If the token is placed below the bottom, sets it to the bottom of the grid
    if (currentToken.y > height - 100){
      currentToken.y = height - 100;
    }
  }
}

//Determines which column player wants to put their token in.
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

<<<<<<< HEAD
//Determines the row closest to the column.
int deterRow(int y) {
  int centerRow = 0;
  if ( y > 50 && y < 150) {
    centerRow = 100;
  } else if ( y >= 150 && y < 250) {
    centerRow = 200;
  } else if ( y >= 250 && y < 350) {
    centerRow = 300;
  } else if ( y >= 350 && y < 450) {
    centerRow = 400;
  } else {
  }
  return centerRow;
}
=======
class Token{
  // A Token has a PShape and an x and y value
  PShape shape;
  int x;
  int y;
  
  // Each variable is set by the constructor
  Token(PShape shape, int x, int y){
    this.shape = shape;
    this.x = x;
    this.y = y;
  }
}
  
>>>>>>> FETCH_HEAD
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

