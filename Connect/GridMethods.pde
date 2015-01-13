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

void check3Grid(int row, int col, int c) {
  if (!isWinner) {
    check3Grid(row, col, 1, 0, c);
    check3Grid(row, col, 0, 1, c);
    check3Grid(row, col, 1, 1, c);
    check3Grid(row, col, -1, 0, c);
    check3Grid(row, col, 0, -1, c);
    check3Grid(row, col, -1, -1, c);
    check3Grid(row, col, 1, -1, c);
    check3Grid(row, col, -1, 1, c);
  }
}

void check3Grid(int row, int col, int dx, int dy, int c) {
  int origRow = row;
  int origCol = col;
  if (!isWinner && !(row + dx * 4 < 0) && !(row + dx * 4 > rows - 1) && !(col + dy * 4 < 0) && !(col + dy * 4 > cols - 1)) {
    boolean allPlayer1 = true;
    for (int i = 0; i < 4; i++) {
      if (i < 3) {
        if (gameBoard[row][col] != c) {
          allPlayer1 = false;
        }
      }
      if (i == 3) {
        if (gameBoard[row][col] != 0) {
          allPlayer1 = false;
        }
        if (row == 0 || gameBoard[row - 1][col] == 0) {
          allPlayer1 = false;
        }
      }
      if (i < 3) {
        row += dx;
        col += dy;
      }
    }
    if (allPlayer1) {
      comp.nextX = col;
    } else {
      row = origRow;
      col = origCol;
      int rightCol = -1;
      boolean allPlayer2 = true;
      for (int i = 0; i < 4; i++) {
        if (i < 2) {
          if (gameBoard[row][col] != c) {
            allPlayer2 = false;
          }
        }
        if (i == 2) {
          if (gameBoard[row][col] != 0) {
            allPlayer2 = false;
          }
          if (row == 0 || gameBoard[row - 1][col] == 0) {
            allPlayer2 = false;
          }
          rightCol = col;
        }
        if (i == 3) {
          if (gameBoard[row][col] != c) {
            allPlayer2 = false;
          }
        }
        if (i < 3) {
          row += dx;
          col += dy;
        }
      }
      if (allPlayer2) {
        comp.nextX = rightCol;
      }
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

