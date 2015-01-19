char[] alphabetLower = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
};
char[] alphabetUpper = {
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
};

void keyPressed() {
  // player 1
  if (pCount == 0) {
    if (player1.length() < 15) {
      for (int i = 0; i < 26; i++) {
        if (key == alphabetLower[i]) {
          player1 += String.valueOf(alphabetLower[i]);
        }
      }
      for (int i = 0; i < 26; i++) {
        if (key == alphabetUpper[i]) {
          player1 += String.valueOf(alphabetUpper[i]);
        }
      }
      if (key == BACKSPACE) {
        if (player1.length() > 0)
          player1 = player1.substring(0, player1.length()-1);
      }
      if (key == ' ') {
        if (player1.length() > 0)
          player1 += " ";
      }
    }
    if (key == ENTER)
      pCount++;

    // player 2
  } else {
    if ( pCount == 1 && player2.length() < 15) {
      for (int i = 0; i < 26; i++) {
        if (key == alphabetLower[i]) {
          player2 += String.valueOf(alphabetLower[i]);
        }
      }
      for (int i = 0; i < 26; i++) {
        if (key == alphabetUpper[i]) {
          player2 += String.valueOf(alphabetUpper[i]);
        }
      }
      if (key == BACKSPACE) {
        if (player2.length() > 0)
          player2 = player2.substring(0, player2.length()-1);
      }
       if (key == ' ') {
        if (player2.length() > 0)
          player2 += " ";
      }
    }
  }
}

