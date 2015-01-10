class Token {
  // A Token has a PShape and an x and y value
  PShape shape;
  int x;
  int y;
  int boardX, boardY;
  int pointStop;
  // If the token is found to not be placed correctly, valid is set to false and the token is not added to the tokens arrayList
  boolean isValidToken = true;

  // Each variable is set by the constructor
  Token(PShape shape, int x, int y) {
    this.shape = shape;
    this.x = x;
    this.y = y;
    this.boardX = deterColumn(x, true);
    this.boardY = deterRow(y);
  }

  void boardLocation(int x, int y) {
    this.boardX = deterColumn(x, true);
    this.boardY = deterRow(y);
  }

  void setGameBoard() {
    if (turn % 2 == 0) {
      gameBoard[this.boardY][this.boardX] = 1;
    } else {
      gameBoard[this.boardY][this.boardX] = 2;
    }
  }

  void stopPoint(int x) {
    int gridCol = x / 100 - 1;
    int stopPoint = height - 100;
    int row = 0;
    while (row < rows - 1) {
      if (!gridFilled[row][gridCol].equals("")) {
        stopPoint = row * 100;
        break;
      }
      row++;
    }
    pointStop = stopPoint;
    if (row > 0) {
      if (turn % 2 == 0) {
        gridFilled[row - 1][gridCol] = "Red";
       // gameBoard[row - 1][gridCol]
      } else {
        gridFilled[row - 1][gridCol] = "Blue";
      }
    } else {
      isValidToken = false;
    }
  }
}

