// 2D Array of objects
Cell[][] grid;
String[][] gridFilled = new String[6][7];
int[][] gameBoard = new int[6][7];

// ArrayList of all tokens that have been placed
ArrayList<Token> tokens = new ArrayList<Token>();
int turn = 0; // even = red // odd = blue
PFont f; 

// gameBoard status type
// 0 = empty , 1 = player, 2 = computer

// Number of columns and rows in the grid
int cols = 8;
int rows = 7;

// Whether a winner exists
boolean isWinner = false;
boolean isRed = false;

boolean isModeSelected = false;
boolean is1Player = false;
boolean is2Players = false;
boolean isColorSelected = false;

void setup() { 
  drawGrid();
  for (int i = 0; i < rows - 1; i++) {
    for (int j = 0; j < cols - 1; j++) {
      gridFilled[i][j] = "";
    }
  }
  drawModeWindow(100, 100);
}

void mousePressed() {
  if (mouseX > 50 && mouseX < width - 50 && mouseY > 50 && mouseY < height - 50 && !isWinner) {
    if ( turn % 2 == 0) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
    if (isColorSelected) {
      // Creates a PShape as a token, which is more interactive than a regular ellipse
      PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
      // Adds the PShape to a new Token class
      Token token = new Token(shape, deterColumn(mouseX, false), mouseY);
      token.stopPoint(token.x);
      token.boardLocation(token.x, token.pointStop);
      token.setGameBoard();

      // Adds the Token to the tokens ArrayList
      if (token.isValidToken) {
        tokens.add(token);
        turn++;
      }
    } else if (isModeSelected) {
      if ( mouseX > 280 && mouseX < 380 && mouseY > 340 && mouseY < 390) {
        // Red chosen
        isColorSelected = true;
      } else if (mouseX > 410 && mouseX < 510 && mouseY > 340 && mouseY < 390) {
        // blue chosen
        isColorSelected = true;
        turn++;
      }
    } else {
      if ( mouseX > 280 && mouseX < 380 && mouseY > 340 && mouseY < 390) {
        isModeSelected = true;
        is1Player = true;
        drawGrid();
      } else if (mouseX > 410 && mouseX < 510 && mouseY > 340 && mouseY < 390) {
        isModeSelected = true;
        is2Players = true;
        drawGrid();
      }
    }
    // Checks if there is a winner for any spot on the grid
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < cols - 1; j++) {
        checkGrid(i, j);
      }
    }
  }
}

void draw() {
  if (isModeSelected) {
    if (isColorSelected) {
      drawGrid();
    } else if (mouseX > 280 && mouseX < 380 && mouseY > 340 && mouseY < 390) {
      drawColorWindow(80, 0);
    } else if (mouseX > 410 && mouseX < 510 && mouseY > 340 && mouseY < 390) {
      drawColorWindow(0, 80);
    } else {
      drawColorWindow(0, 0);
    }
  } else if (mouseX > 280 && mouseX < 380 && mouseY > 340 && mouseY < 390) {
    drawModeWindow(150, 100);
  } else if (mouseX > 410 && mouseX < 510 && mouseY > 340 && mouseY < 390) {
    drawModeWindow(100, 150);
  } else {
    drawModeWindow(100, 100);
  }
  // Goes through the ArrayList of tokens and displays them based on their current values
  for (int i = 0; i < tokens.size (); i++) {
    Token currentToken = tokens.get(i);
    shape(currentToken.shape, currentToken.x, currentToken.y);
    // Gradually lowers the y value if the token is not at the bottom
    if (currentToken.y < currentToken.pointStop) {
      currentToken.y = currentToken.y + 20;
    } 
    // If the token is placed below the bottom, sets it to the bottom of the grid
    if (currentToken.y > currentToken.pointStop) {
      currentToken.y = currentToken.pointStop;
    }
  }
  if (isWinner && isRed) {
    textFont(f, 24); 
    fill(255);                    
    text("Red Wins!", 340, 35);
  } else if (isWinner && !isRed) {
    textFont(f, 24);                
    fill(255);                    
    text("Blue Wins!", 340, 35);
  } else {
  }
}

// Goes in each possible direction to see if there are 4 tokens of the same color in a row
void checkGrid(int row, int col) {
  if (!isWinner) {
    checkGrid(row, col, 1, 0);
    checkGrid(row, col, 0, 1);
    checkGrid(row, col, 1, 1);
    checkGrid(row, col, -1, 0);
    checkGrid(row, col, 0, -1);
    checkGrid(row, col, -1, -1);
    checkGrid(row, col, 1, -1);
    checkGrid(row, col, -1, 1);
  }
}

void checkGrid(int row, int col, int dx, int dy) {
  // Check if 4 spaces exist in the specified direction
  if (!isWinner && !(row + dx * 4 < 0) && !(row + dx * 4 > rows - 1) && !(col + dy * 4 < 0) && !(col + dy * 4 > cols - 1) && !(gridFilled[row][col].equals(""))) {
    boolean allRed = true;
    boolean allBlue = true;
    for (int i = 0; i < 4; i++) {
      if (!gridFilled[row][col].equals("Red")) {
        allRed = false;
      }
      if (!gridFilled[row][col].equals("Blue")) {
        allBlue = false;
      }
      row += dx;
      col += dy;
    }
    if (allRed) {
      isWinner = true;
      isRed = true;
    }
    if (allBlue) {
      isWinner = true;
    }
  }
}

int deterColumn(int x, boolean forToken) {
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
  } else if ( x >= 650 && x < 750) {
    center = 700;
  }
  if (!forToken) {
    return center;
  } else {
    return center/100 - 1;
  }
}

int deterRow(int y) {
  int yLoc = 0;
  if ( y > 50 && y < 150) {
    yLoc = 5;
  } else if ( y >= 150 && y < 250) {
    yLoc = 4;
  } else if ( y >= 250 && y < 350) {
    yLoc = 3;
  } else if ( y >= 350 && y < 450) {
    yLoc = 2;
  } else if ( y >= 450 && y < 550) {
    yLoc = 1;
  } else if ( y >= 550 && y < 650) {
    yLoc = 0;
  } 
  return yLoc;
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

