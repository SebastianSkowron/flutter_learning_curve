import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/constants.dart';
import 'package:tic_tac_toe/models/game.dart';

class GameLogic {
  final Game game = Game(boardSize: kBoardSize);
  List<List<String>> _board = List.generate(
      kBoardSize.toInt(), (_) => List.generate(kBoardSize.toInt(), (_) => ''));

  List<List<String>> get board => _board;

  void playMove(int index) {
    if (!game.isGameOver) {
      game.playMove(index);
    }
  }

  void reset() {
    game.reset();
  }

  Widget getSymbol(int index) {
    String symbol = game.board[index];
    if (symbol == 'X') {
      return Icon(
        Icons.clear,
        color: Colors.red,
        size: kSymbolSize,
      );
    } else if (symbol == 'O') {
      return Icon(
        Icons.radio_button_unchecked,
        color: Colors.blue,
        size: kSymbolSize,
      );
    } else {
      return Container();
    }
  }

  String getMessage() {
    if (game.isGameOver) {
      if (game.currentPlayer == 'X') {
        return 'O Wins!';
      } else {
        return 'X Wins!';
      }
    } else {
      return '${game.currentPlayer}\'s Turn';
    }
  }
}
