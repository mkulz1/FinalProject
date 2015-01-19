char[] alphabet = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
};

void keyPressed() {
  // player 1
  if (pCount == 0) {
    for (int i = 0; i < 26; i++) {
      if (key == alphabet[i]) {
        player1 += String.valueOf(alphabet[i]);
      }
    }
    if (key == BACKSPACE) {
      if (player1.length() > 0)
        player1 = player1.substring(0, player1.length()-1);
    }
    if (key == ENTER)
      pCount++;

    // player 2
  } else {
    for (int i = 0; i < 26; i++) {
      if (key == alphabet[i]) {
        player2 += String.valueOf(alphabet[i]);
      }
    }
    if (key == BACKSPACE) {
      if (player2.length() > 0)
        player2 = player2.substring(0, player2.length()-1);
    }
  }
}
