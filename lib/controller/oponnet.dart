import 'dart:math' as Math;

class Oponent {
  int opponent = 0;
  int player = 1;
  bool isMovesLeft(List<int> board) => board.contains(-1);

  int evaluate(List<int> b) {
    for (int row = 0; row < 3; row++) {
      if (b[row * 3] == b[row * 3 + 1] &&
          b[row * 3 + 1] == b[row * 3 + 2]) {
        if (b[row * 3] == player)
          return 10;
        else if (b[row * 3] == opponent) return -10;
      }
    }

    for (int col = 0; col < 3; col++) {
      if (b[col] == b[3 + col] && b[3 + col] == b[6 + col]) {
        if (b[col] == player)
          return 10;
        else if (b[col] == opponent) return -10;
      }
    }

    if (b[0] == b[4] && b[4] == b[8]) {
      if (b[0] == player)
        return 10;
      else if (b[0] == opponent) return -10;
    }

    if (b[2] == b[4] && b[4] == b[6]) {
      if (b[2] == player)
        return 10;
      else if (b[2] == opponent) return -10;
    }

    return 0;
  }

  int minimax(List<int> board, int depth, bool isMax) {
    int score = evaluate(board);

    if (score == 10) return score;

    if (score == -10) return score;

    if (isMovesLeft(board) == false) return 0;

    if (isMax) {
      int best = -1000;

      for (int i = 0; i < 9; i++) {
        if (board[i] == -1) {
          board[i] = player;

          best = Math.max(best, minimax(board, depth + 1, !isMax));

          board[i] = -1;
        }
      }
      return best;
    }

    // If this minimizer's move
    else {
      int best = 1000;

      // Traverse all cells
      for (int i = 0; i < 9; i++) {
        // Check if cell is empty
        if (board[i] == -1) {
          // Make the move
          board[i] = opponent;

          // Call minimax recursively and choose
          // the minimum value
          best = Math.min(best, minimax(board, depth + 1, !isMax));

          // Undo the move
          board[i] = -1;
        }
      }
      return best;
    }
  }

// This will return the best possible
// move for the player
  int findBestMove(List<int> board) {
    int bestVal = -1000;
    int bestMove = -1;

    // Traverse all cells, evaluate minimax function
    // for all empty cells. And return the cell
    // with optimal value.
    for (int i = 0; i < 9; i++) {
      // Check if cell is empty
      if (board[i] == -1) {
        // Make the move
        board[i] = player;

        // compute evaluation function for this
        // move.
        int moveVal = minimax(board, 0, false);

        // Undo the move
        board[i] = -1;

        // If the value of the current move is
        // more than the best value, then update
        // best/
        if (moveVal > bestVal) {
          bestMove = i;
          bestVal = moveVal;
        }
      }
    }

    print("The value of the best Move " + "is : $bestVal\n\n");

    return bestMove;
  }
}
