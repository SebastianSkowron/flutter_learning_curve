class Game {
  List<String> board;
  String currentPlayer;
  int boardSize;
  bool isGameOver;

  Game({
    required this.boardSize,
  })  : board = List.filled(boardSize * boardSize, ''),
        currentPlayer = 'X',
        isGameOver = false;

  void playMove(int index) {
    if (board[index] == '') {
      board[index] = currentPlayer;
      checkForWinner();
      switchPlayer();
    }
  }

  void switchPlayer() {
    if (currentPlayer == 'X') {
      currentPlayer = 'O';
    } else {
      currentPlayer = 'X';
    }
  }

  void checkForWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (var combination in winningCombinations) {
      String firstSymbol = board[combination[0]];
      if (firstSymbol != '' &&
          combination.every((index) => board[index] == firstSymbol)) {
        isGameOver = true;
        return;
      }
    }

    if (board.every((symbol) => symbol != '')) {
      isGameOver = true;
    }
  }

  void reset() {
    board = List.filled(boardSize * boardSize, '');
    currentPlayer = 'X';
    isGameOver = false;
  }
}
