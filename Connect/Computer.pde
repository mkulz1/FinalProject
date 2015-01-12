class Computer {
  // will include methods/decisions by which the computer which choose where to place its token. 
  // will use gameBoard as its reference.

  int difficulty = 0;
  boolean firstMoveMade = false;
  int nextX;
  int nextY;
  
  Computer(int difficulty) {
    this.difficulty = difficulty;
  }

  void makeMove() {
    if (!isWinner) {
      if ( turn % 2 == 0) {
        fill(255, 0, 0);
      } else {
        fill(0, 0, 255);
      }
      PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
      Token token = new Token(shape, determineX(), 100);
      token.stopPoint(token.x);
      token.boardLocation(token.x, token.pointStop);
      token.setGameBoard(false);
      if (token.isValidToken) {
        tokens.add(token);
        turn++;
        playerCanMove = true;
      }
      for (int i = 0; i < rows - 1; i++) {
        for (int j = 0; j < cols - 1; j++) {
          checkGrid(i, j);
        }
      }
    }
  }
  
  int determineX(){
    if (!firstMoveMade){
      firstMoveMade = true;
      return 400;
    } else {
      return int(random(1, 8)) * 100;
    }
  }
}

