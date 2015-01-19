void keyPressed() {
  char[] alphabet = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  };
  for (int i = 0; i < 26; i++) {
    if (key == alphabet[i]) {
      player1 += String.valueOf(alphabet[i]);
    }
  }
  if (key == BACKSPACE) {
    if (player1.length() > 0)
      player1 = player1.substring(0, player1.length()-1);
  }
}

