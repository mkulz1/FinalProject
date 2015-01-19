void reset() {
  if (isWinner && mouseX > 333 && mouseX < 463 && mouseY > 340 && mouseY < 390) {
    resetDone = false;

    // clear Variables
    showWinner = false;
    turn = 0;
    compMoveMade = false;
    playerCanMove = true;
    isWinner = false;
    isRed = false;
    playerFirst = false;
    showMove = false;
    comp = new Computer(0);
    goesOn = 1;
    tokens.clear();
    isModeSelected = false;
    is1Player = false;
    is2Players = false;
    isNameSelected = false;
    isDifficultySelected = false;
    isColorSelected = false;
    isColorRed = false;
    playerFirst = false;
    showMove = false;
    askNameText = "Player 1, Please Enter Your Name:";
    onInputWindow = false;
    onPlayer2 = false;

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

