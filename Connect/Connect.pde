// 2D Array of objects
Cell[][] grid;
String[][] gridFilled = new String[6][7];
int[][] gameBoard = new int[6][7];
int[] topOpen = new int[7];
//int theX = 0;

// ArrayList of all tokens that have been placed
ArrayList<Token> tokens = new ArrayList<Token>();
int turn = 0; // even = red // odd = blue
PFont f; 

//for resetting
boolean resetDone = true;
boolean showWinner = false;

// The computer
Computer comp = new Computer(0);
// 0 = computer goes on even turns, 1 = computer goes on odd turns
int goesOn = 1;
// Whether the computer has made its first move (used to determine color)
boolean compMoveMade = false;

boolean playerCanMove = true;

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
boolean isColorRed = false;
boolean playerFirst = false;
boolean showMove = false;

void setup() { 
  drawGrid();
  for (int i = 0; i < rows - 1; i++) {
    for (int j = 0; j < cols - 1; j++) {
      gridFilled[i][j] = "";
    }
  }
  drawModeWindow(100, 100);
  if (int(random(0, 2)) == 0) {
    playerFirst = true;
  }
  for (int i = 0; i < 7; i++) {
    topOpen[i] = 6;
  }
}

void mousePressed() {
  reset();
    if (mouseX > 50 && mouseX < width - 50 && mouseY > 50 && mouseY < height - 50 && !isWinner && playerCanMove) {
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
        token.setGameBoard(true);

        // Adds the Token to the tokens ArrayList
        if (token.isValidToken) {
          tokens.add(token);
          turn++;
          topOpen[token.x/100 - 1] --;
          if (is1Player) {
            playerCanMove = false;
          }
        }
      } else if (isModeSelected) {
        if ( mouseX > 280 && mouseX < 380 && mouseY > 340 && mouseY < 390) {
          // Red chosen
          isColorSelected = true;
          isColorRed = true;
        } else if (mouseX > 410 && mouseX < 510 && mouseY > 340 && mouseY < 390) {
          // blue chosen
          isColorSelected = true;
          goesOn = 0;
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
    if (isModeSelected && isColorSelected && !isWinner && mouseX > 242 && mouseX < 278 && mouseY > 657 && mouseY < 693) {
      showMove = !showMove;
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
  if (isModeSelected && isColorSelected) {
    drawOption();
  }
  showMove();
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
  boolean allTokensAtBottom = true;
  for (int i = 0; i < tokens.size (); i++) {
    if (tokens.get(i).y < tokens.get(i).pointStop) {
      allTokensAtBottom = false;
    }
  }
  if (allTokensAtBottom) {
    if (is1Player && isColorSelected && !compMoveMade && !playerFirst) {
      turn = goesOn;
      comp.makeMove(false);
      compMoveMade = true;
    }
    if (is1Player && isColorSelected && turn % 2 == goesOn) {
      comp.makeMove(false);
    }
  }
  if (showWinner) {
    if (isWinner && isRed) {
      if (mouseX > 333 && mouseX < 463 && mouseY > 340 && mouseY < 390) {
        drawWinnerWindow("Red", 150);
      } else {
        drawWinnerWindow("Red", 100);
      }
    } else if (isWinner && !isRed) {
      if (mouseX > 333 && mouseX < 463 && mouseY > 340 && mouseY < 390) {
        drawWinnerWindow("Blue", 150);
      } else {
        drawWinnerWindow("Blue", 100);
      }
    }
  }
}

