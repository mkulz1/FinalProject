void reset() {
  if (isWinner && mouseX > 333 && mouseX < 463 && mouseY > 340 && mouseY < 390) {

    // clear Variables
    showWinner = false;
    turn = 0;
    compMoveMade = false;
    playerCanMove = true;
    isWinner = false;
    isRed = false;
    playerFirst = false;
    showMove = false;
    comp.firstMoveMade = false;
    comp.nextX = -1;
    comp.pursueX = -1;
    comp.playerWinX = -1; 
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

