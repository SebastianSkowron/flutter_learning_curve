import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Game game = Game();

  void makeMove(int row, int col) {
    setState(() {
      game.makeMove(row, col);
      if (game.isOver()) {
        showGameOverPopup();
      }
    });
  }

  void showGameOverPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: game.winner == null
            ? Text('Draw')
            : Text('${game.winner} wins!'),
        actions: [
          ElevatedButton(
            child: Text('Play Again'),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                game.reset();
              });
            },
          ),
        ],
      ),
    );
  }