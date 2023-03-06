import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/gameboard.dart';
import 'package:tic_tac_toe/widgets/scoreboard.dart';

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> _squares = List.generate(3, (_) => List.filled(3, ''));
  int _player1Score = 0;
  int _player2Score = 0;
  bool _player1Turn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        children: <Widget>[
          Scoreboard(
            player1Score: _player1Score,
            player2Score: _player2Score,
            player1Turn: _player1Turn,
          ),
          Expanded(
            child: Board(
              squares: _squares,
              onTap: (int row, int col) => _onTapBoard(row, col),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Reset Game'),
              onPressed: _resetGame,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapBoard(int row, int col) {
    if (_squares[row][col].isNotEmpty) {
      return;
    }
    setState(() {
      _squares[row][col] = _player1Turn ? 'X' : 'O';
      if (_checkForWinner()) {
        _player1Score += _player1Turn ? 1 : 0;
        _player2Score += _player1Turn ? 0 : 1;
        _resetBoard();
      } else if (_isBoardFull()) {
        _resetBoard();
      } else {
        _player1Turn = !_player1Turn;
      }
    });
  }

  bool _checkForWinner() {}

  bool _isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_squares[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  void _resetBoard() {
    setState(() {
      _squares = List.generate(3, (_) => List.filled(3, ''));
    });
  }

  void _resetGame() {
    setState(() {
      _squares = List.generate(3, (_) => List.filled(3, ''));
      _player1Score = _player2Score = 0;
      _player1Turn = true;
    });
  }
}
