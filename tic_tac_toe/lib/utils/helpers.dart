import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/constants.dart';

String? checkWinner(List<String> squares) {
  // Check rows
  for (int i = 0; i < 9; i += 3) {
    if (squares[i].isNotEmpty &&
        squares[i] == squares[i + 1] &&
        squares[i] == squares[i + 2]) {
      return squares[i];
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (squares[i].isNotEmpty &&
        squares[i] == squares[i + 3] &&
        squares[i] == squares[i + 6]) {
      return squares[i];
    }
  }

  // Check diagonals
  if (squares[0].isNotEmpty &&
      squares[0] == squares[4] &&
      squares[0] == squares[8]) {
    return squares[0];
  }

  if (squares[2].isNotEmpty &&
      squares[2] == squares[4] &&
      squares[2] == squares[6]) {
    return squares[2];
  }

  // Check for a tie
  if (!squares.contains('')) {
    return 'tie';
  }

  // No winner yet
  return null;
}

Color getSymbolColor(String symbol) {
  if (symbol == 'X') {
    return kSymbolXColor;
  } else if (symbol == 'O') {
    return kSymbolOColor;
  } else {
    throw ArgumentError('Invalid symbol: $symbol');
  }
}

String getNextSymbol(String symbol) {
  if (symbol == 'X') {
    return 'O';
  } else if (symbol == 'O') {
    return 'X';
  } else {
    throw ArgumentError('Invalid symbol: $symbol');
  }
}
