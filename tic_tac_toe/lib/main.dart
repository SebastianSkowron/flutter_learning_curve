import 'package:flutter/material.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _handleTap(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  _board[index],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleTap(int index) {
    if (_board[index] == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      });
      String winner = _checkWinner();
      if (winner != '') {
        _showWinnerDialog(winner);
      } else if (_board.every((element) => element != '')) {
        _showDrawDialog();
      }
    }
  }

  String _checkWinner() {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var line in lines) {
      if (_board[line[0]] != '' &&
          _board[line[0]] == _board[line[1]] &&
          _board[line[1]] == _board[line[2]]) {
        return _board[line[0]];
      }
    }
    return '';
  }

  void _resetBoard() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
    });
    Navigator.of(context).pop();
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner'),
          content: Text('$winner has won!'),
          actions: <Widget>[
            TextButton(
              child: Text('Play again'),
              onPressed: () {
                _resetBoard();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Draw'),
          content: Text('There are no more empty spaces.'),
          actions: <Widget>[
            TextButton(
              child: Text('Play again'),
              onPressed: () {
                _resetBoard();
              },
            ),
          ],
        );
      },
    );
  }
}
