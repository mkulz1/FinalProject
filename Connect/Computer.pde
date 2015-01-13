class Computer {
  // will include methods/decisions by which the computer which choose where to place its token. 
  // will use gameBoard as its reference.

  int difficulty = 0;
  boolean firstMoveMade = false;
  int nextX = -1;

  Computer(int difficulty) {
    this.difficulty = difficulty;
  }

  void makeMove(boolean isRandomX) {
    if (!isWinner) {
      if ( turn % 2 == 0) {
        fill(255, 0, 0);
      } else {
        fill(0, 0, 255);
      }
      PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
      Token token;
      if (!isRandomX){
        token = new Token(shape, determineX(), 100);
      } else {
        token = new Token(shape, int(random(1, 8)) * 100, 100);
      }
      token.stopPoint(token.x);
      token.boardLocation(token.x, token.pointStop);
      token.setGameBoard(false);
      if (token.isValidToken) {
        tokens.add(token);
        turn++;
        playerCanMove = true;
      } else {
        makeMove(true);
      }
      for (int i = 0; i < rows - 1; i++) {
        for (int j = 0; j < cols - 1; j++) {
          checkGrid(i, j);
        }
      }
    }
  }

  int determineX() {
    checkIf3();
    if (!firstMoveMade) {
      firstMoveMade = true;
      return 400;
    } else if (nextX != -1){
      int temp = nextX;
      nextX = -1;
      return (temp + 1) * 100;
    } else {
      return int(random(1, 8)) * 100;
    }
  }

  void checkIf3() {
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < cols - 1; j++) {
        check3Grid(i, j);
      }
    }
  }
}

