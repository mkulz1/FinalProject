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
}

// gameBoard status
// 0 = empty , 1 = player, 2 = computer


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
