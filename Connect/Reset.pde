void reset() {
  if (isWinner && mouseX > 333 && mouseX < 463 && mouseY > 340 && mouseY < 390) {

    // clear Variables
    int turn = 0;
    boolean compMoveMade = false;
    boolean playerCanMove = true;
    boolean isWinner = false;
    boolean isRed = false;
    boolean playerFirst = false;
    boolean showMove = false;
    boolean firstMoveMade = false;
    int nextX = -1;
    int pursueX = -1;
    int playerWinX = -1; 
    comp.invalidCols.clear(); // clear
    tokens.clear();

    // clear gridFilled
    for (int i  = 0; i < 6; i++) {
      for (int j = 0; j < 7; j++) {
        gridFilled[i][j] = "";
      }
    }

    // clear gameBoard
    for (int i  = 0; i < 6; i++) {
      for (int j = 0; j < 7; j++) {
        gameBoard[i][j] = 0;
      }
    }

    // clear topOpen
    for (int i = 0; i < 7; i++) {
      topOpen[i] = 6;
    }

    setup();
    
  }
}

