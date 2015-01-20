FinalProject
============

Note: If the program is running slowly, increase Processing's maximum available memory.

1/1/15
-Added a grid animation for connect 4 (created the basic grid layout for the visual game board.)
-Clicking creates an ellipse that can be dragged.

1/6/15
-New Token class.
-Tokens alternate colors.
-Tokens fall to the bottom of the grid instead of being dragged.

1/7/15
-Tokens pile inside the grid.
-Prints message if there are 4 in a row.
-Grid size increased.

1/8/15
-Fixed placing of tokens after a winner exists.
-Winning color is displayed above grid.
-Added box to select player color.
-Added box to select whether there are 1 or 2 players.

1/9/15
-Fixed multiple window bug.
-Preparation within code for AI.

1/10/15
-Divided code into tabs.
-If "1 player" is selected, the computer makes a random move every other turn.

1/11/15
-Computer bug fixes.
-Added delay between when the player places tokens and when the computer places tokens.

1/12/15
-Computer can now make decisions based on current board.
-Added cases for which the computer makes certain moves in response to specific game Board scenarios.
-Computer blocks player if the player has 3 tokens in a row.

1/13/15
-Bug fixes.
-Computer searches to see if there is a case in which there are four slots, and its tokens occupy any three of them, then it makes the winning move and places its token to complete the four. 
-Computer prioritizes offense over defense. 

1/14/15
-Create method pursue() in which the computer finds two tokens of its own that have two spaces after them. If the two spaces are empty, then it adds its token into the third spot pursuing a win. 
-The computer avoids going in spaces that will let the player win on the next turn.

1/15/15
-Added option to show what a move will look like before it is made.
-Put winner message inside of a box with a "play again" button (does nothing yet).

1/16/15
-Clicking "play again" starts a new game.
-Mode and color are asked for when starting a new game.

1/17/15
-Added ability to choose computer difficulty (easy, medium, or hard).
-Difficulty affects how often the computer makes a calculated move.

1/18/15
-Player names are now displayed at the top of the screen.
-Still need to make an input window for names.

1/19/15
-Added window for entering player names.
-If there is 1 player, the name for player 2 is set to "Computer".
-Improved color selection pop-up window.
-If the grid is filled, "Tie" is displayed with the option to play again.
