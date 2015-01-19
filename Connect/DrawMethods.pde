void drawGrid() {
  background(0);
  size(800, 700, P2D);
  grid = new Cell[cols][rows];
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*100, j*100, 100, 100);
      grid[i][j].display();
    }
  }
    displayName();
}

void drawModeWindow(int selectionTint1, int selectionTint2) {
  rectMode(CENTER);
  fill(255);
  strokeWeight(4);
  stroke(0);
  rect(400, 350, 380, 100);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(0);                    
  text("Please Select The Game Mode", 225, 325);
  fill(selectionTint1, selectionTint1, selectionTint1);
  strokeWeight(1);
  stroke(0);
  rect(330, 365, 110, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("1 Player", 285, 370);
  fill(selectionTint2, selectionTint2, selectionTint2);
  strokeWeight(1);
  stroke(0);
  rect(460, 365, 110, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("2 Players", 410, 370);
}

void drawDifficultyWindow(int selectionTint1, int selectionTint2, int selectionTint3) {
  rectMode(CENTER);
  fill(255);
  strokeWeight(4);
  stroke(0);
  rect(400, 350, 380, 100);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(0);                    
  text("Please Select The Difficulty", 255, 325);
  fill(selectionTint1, selectionTint1, selectionTint1);
  strokeWeight(1);
  stroke(0);
  rect(280, 365, 110, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Easy", 253, 370);
  fill(selectionTint2, selectionTint2, selectionTint2);
  strokeWeight(1);
  stroke(0);
  rect(400, 365, 110, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Medium", 360, 370);
  fill(selectionTint3, selectionTint3, selectionTint3);
  strokeWeight(1);
  stroke(0);
  rect(520, 365, 110, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Hard", 494, 370);
}

void drawColorWindow(int redColorTint, int blueColorTint) {
  rectMode(CENTER);
  fill(255);
  strokeWeight(4);
  stroke(0);
  rect(400, 350, 350, 100);
  // Please Select Your Color
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(0);
  text("Please Select Your Color", 275, 325);
  // Red Choice
  fill(255, redColorTint, redColorTint);
  strokeWeight(1);
  stroke(0);
  rect(330, 365, 100, 50);
  // Red (word)
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Red", 310, 370);
  // Blue Choice
  fill(blueColorTint, blueColorTint, 255);
  strokeWeight(1);
  stroke(0);
  rect(460, 365, 100, 50);
  // Blue (word)
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Blue", 438, 370);
}

void drawWinnerWindow(String winner, int selectionTint) {
  rectMode(CENTER);
  fill(255);
  strokeWeight(4);
  stroke(0);
  rect(400, 350, 200, 100);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(0);                    
  text(winner + " Wins!", 343, 325);
  fill(selectionTint, selectionTint, selectionTint);
  strokeWeight(1);
  stroke(0);
  rect(398, 365, 130, 50);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Play Again", 342, 370);
}

void drawOption() {
  rectMode(CENTER);
  if (mouseX > 242 && mouseX < 278 && mouseY > 657 && mouseY < 693) {
    fill(80);
  } else {
    fill(0);
  }
  strokeWeight(1);
  stroke(255);
  rect(260, 675, 35, 35);
  if (showMove) {
    fill(255);
    rect(260, 675, 20, 20);
  }
  f = createFont("Arial", 24, true);
  textFont(f, 24);
  fill(255);
  text("Show moves in advance", 285, 683);
}

void askName(){
  rectMode(CENTER);
  fill(255);
  strokeWeight(4);
  stroke(0);
  rect(400, 350, 400, 100);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(0);                    
  text(askNameText, 210, 325);
  fill(150);
  strokeWeight(2);
  rect(400, 365, 330, 45);
  f = createFont("Arial", 24, true);
  textFont(f, 24);
  fill(255);
  if (!onPlayer2){
    text(player1, 240, 375);
  } else {
    text(player2, 240, 375);
  }
}


void displayName(){
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Player 1: " + player1, 25, 40);
  f = createFont("Arial", 24, true);
  textFont(f, 24);                
  fill(255);                    
  text("Player 2: " + player2, 450, 40);
}

