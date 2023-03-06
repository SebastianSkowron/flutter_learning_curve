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
    }
  }
}
