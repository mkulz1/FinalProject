class Computer {
  // will include methods/decisions by which the computer which choose where to place its token. 
  // will use gameBoard as its reference.

  int difficulty = 0;

  Computer(int difficulty) {
    this.difficulty = difficulty;
  }

  void makeMove() {
    if ( turn % 2 == 0) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
    PShape shape = createShape(ELLIPSE, 0, 0, 90, 90);
    Token token = new Token(shape, int(random(1, 8)) * 100, 100);
    token.stopPoint(token.x);
    token.boardLocation(token.x, token.pointStop);
    token.setGameBoard();
    if (token.isValidToken) {
      tokens.add(token);
      turn++;
    }
  }
}

