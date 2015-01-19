char[] alphabetLower = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
};
char[] alphabetUpper = {
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
};
char[] numbers = {
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
};

void keyPressed() {
<<<<<<< HEAD
  // player 1
  if (!namePutPlayer1) {
    if (player1.length() < 15) {
      for (int i = 0; i < 26; i++) {
        if (key == alphabetLower[i]) {
          player1 += String.valueOf(alphabetLower[i]);
=======
  if (onInputWindow) {
    // player 1
    if (!onPlayer2) {
      if (player1.length() < 15) {
        for (int i = 0; i < 26; i++) {
          if (key == alphabetLower[i]) {
            player1 += String.valueOf(alphabetLower[i]);
          }
>>>>>>> FETCH_HEAD
        }
        for (int i = 0; i < 26; i++) {
          if (key == alphabetUpper[i]) {
            player1 += String.valueOf(alphabetUpper[i]);
          }
        }
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {
            player1 += String.valueOf(numbers[i]);
          }
        }
        if (key == ' ') {
          if (player1.length() > 0)
            player1 += " ";
        }
      }
      if (key == BACKSPACE) {
        if (player1.length() > 0)
          player1 = player1.substring(0, player1.length()-1);
      }
      if (key == ENTER) {
        if (is1Player) {
          player2 = "Computer";
          isNameSelected = true;
          onInputWindow = false;
          strokeWeight(1);
          drawGrid();
        } else {
          strokeWeight(1);
          drawGrid();
          onPlayer2 = true;
          key = '.';
        }
      }
    }
<<<<<<< HEAD
    if (key == ENTER)
      namePutPlayer1 = true;

    // player 2
  } else {
    if (!namePutPlayer2) {
      if (player2.length() < 15) {
=======
    if (onPlayer2) {
      askNameText = "Player 2, Please Enter Your Name:";
      // player 2
      if ( player2.length() < 15) {
>>>>>>> FETCH_HEAD
        for (int i = 0; i < 26; i++) {
          if (key == alphabetLower[i]) {
            player2 += String.valueOf(alphabetLower[i]);
          }
        }
        for (int i = 0; i < 26; i++) {
          if (key == alphabetUpper[i]) {
            player2 += String.valueOf(alphabetUpper[i]);
          }
<<<<<<< HEAD
        }
        if (key == BACKSPACE) {
          if (player2.length() > 0)
            player2 = player2.substring(0, player2.length()-1);
        }
        if (key == ' ') {
          if (player2.length() > 0)
            player2 += " ";
        }
        if (key == ENTER)
          namePutPlayer1 = true;
=======
        }
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {
            player2 += String.valueOf(numbers[i]);
          }
        }
        if (key == ' ') {
          if (player2.length() > 0)
            player2 += " ";
        }
      }
      if (key == BACKSPACE) {
        if (player2.length() > 0)
          player2 = player2.substring(0, player2.length()-1);
      }
      if (key == ENTER) {
        isNameSelected = true;
        onInputWindow = false;
        strokeWeight(1);
        drawGrid();
>>>>>>> FETCH_HEAD
      }
    }
  }
}

