import 'package:flutter/material.dart';

// Board constants
const int kBoardSize = 300;
const double kBoardBorderWidth = 6.0;
final Color kBoardBorderColor = Colors.grey[700]!;

// Square constants
const double kSquareSize = kBoardSize / 3;
const double kSymbolSize = kSquareSize * 0.6;
const double kSymbolFontSize = kSymbolSize * 0.5;

// Message constants
const double kMessageFontSize = 32.0;

// Symbol colors
final Color kSymbolXColor = Colors.red;
final Color kSymbolOColor = Colors.blue;

// Winning symbol color
final Color kWinningSymbolColor = Colors.green;

// constants.dart
// const double kBoardSize = 3;
const double kBoardPadding = 16.0;
// const double kSquareSize = 60.0;
// const double kSymbolSize = 48.0;
const double kBorderWidth = 4.0;
const Color kBorderColor = Colors.black;

const kLightSquareColor = Color(0xFFFAF3DD);
const kDarkSquareColor = Color(0xFF3D315B);

// Tie message
const String kTieMessage = 'It\'s a tie!';

Color getSquareColor(int row, int col) {
  if ((row + col) % 2 == 0) {
    return kLightSquareColor;
  } else {
    return kDarkSquareColor;
  }
}

Widget getSymbol(String symbol) {
  if (symbol == 'X') {
    return const Icon(Icons.close, size: kSymbolSize);
  } else if (symbol == 'O') {
    return const Icon(Icons.circle, size: kSymbolSize);
  } else {
    return const SizedBox.shrink();
  }
}
