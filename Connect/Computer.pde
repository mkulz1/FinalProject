class Computer {
  // will include methods/decisions by which the computer which choose where to place its token. 
  // will use gameBoard as its reference.

  int difficulty = 0;
  boolean firstMoveMade = false;
  int nextX = -1;
  int pursueX = -1;
  int playerWinX = -1; 
  ArrayList<Integer> invalidCols = new ArrayList<Integer>();

  Computer(int difficulty) {
    this.difficulty = difficulty;
  }

  void makeMove(boolean isRandomX) {
    invalidCols.clear();
    if (!isWinner) {
      if ( turn % 2 == 0) {
        fill(255, 0, 0);
      } else {
        fill(0, 0, 255);
      }
      PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
      Token token;
      if (!isRandomX) {
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
    checkMAte();
    checkIf3();
    if (!firstMoveMade) {
      firstMoveMade = true;
      if (gameBoard[0][1] == 1) {
        return 300;
      } else if (gameBoard[0][5] == 1) {
        return 500;
      } else {
        return 400;
      }
    } else if (nextX != -1) {
      int temp = nextX;
      nextX = -1;
      return (temp + 1) * 100;
    } else {
      return pickRandomX();
    }
  }


  void checkMAte() {
    if (gameBoard[0][2] == 0) {
      comp.nextX = 2;
    } else if (gameBoard[0][4] == 0) {
      comp.nextX = 4;
    } else if (gameBoard[0][3] == 1 && gameBoard[0][2] == 1 && gameBoard[0][4] == 0) {
      comp.nextX = 4;
    } else if (gameBoard[0][3] == 1 && gameBoard[0][4] == 1 && gameBoard[0][2] == 0) {
      comp.nextX = 2;
    }
  }

  void checkIf3() {
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < cols - 1; j++) {
        pursue(i, j);
      }
    }
    // Looks to defend first, overrides pursuit
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < cols - 1; j++) {
        check3Grid(i, j, 1, false);
      }
    }
    // If it can win, then the nextX is overwritten 
    for (int i = 0; i < rows - 1; i++) {
      for (int j = 0; j < cols - 1; j++) {
        check3Grid(i, j, 2, false);
      }
    }
  }

  int pickRandomX() {
    int randomX = -1;
    if (invalidCols.size() == 7) {
      invalidCols.clear();
      if (pursueX != -1){
        randomX = pursueX;
        pursueX = -1;
      } else {
        randomX = int(random(7));
      }
      return (randomX + 1) * 100;
    } else {
      randomX = int(random(7));
    }
    int stopY = deterStopY(randomX);
    if (stopY > 5) {
      if (!invalidCols.contains(randomX)) {
        invalidCols.add(randomX);
      }
      return pickRandomX();
    } else {
      gameBoard[stopY][randomX] = 2;
      for (int i = 0; i < rows - 1; i++) {
        for (int j = 0; j < cols - 1; j++) {
          check3Grid(i, j, 1, true);
        }
      }
      gameBoard[stopY][randomX] = 0;
      if (playerWinX == -1) {
        return (randomX + 1) * 100;
      } else {
        playerWinX = -1;
        if (!invalidCols.contains(randomX)) {
          invalidCols.add(randomX);
        }
        return pickRandomX();
      }
    }
  }
}

