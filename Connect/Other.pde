// Shows what oyur move
void showMove() {
  if (isModeSelected && isColorSelected && !isWinner && mouseY > 50 && mouseY < 650 && showMove) {
    if (mouseX > 50 && mouseX < 150) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(100, topOpen[0]*100, 90, 90);
    }
    if (mouseX > 150 && mouseX < 250) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(200, topOpen[1]*100, 90, 90);
    }
    if (mouseX > 250 && mouseX < 350) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(300, topOpen[2]*100, 90, 90);
    }
    if (mouseX > 350 && mouseX < 450) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(400, topOpen[3]*100, 90, 90);
    }
    if (mouseX > 450 && mouseX < 550) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(500, topOpen[4]*100, 90, 90);
    }
    if (mouseX > 550 && mouseX < 650) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      }
      ellipse(600, topOpen[5]*100, 90, 90);
    }
    if (mouseX > 650 && mouseX < 750) {
      if (turn % 2 == 0){
        fill(255, 80, 80);
      } else {
        fill(80, 80, 255);
      } 
      ellipse(700, topOpen[6]*100, 90, 90);
    }
  }
}




