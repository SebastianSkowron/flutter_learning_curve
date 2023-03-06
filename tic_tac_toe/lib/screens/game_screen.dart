import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/constants.dart';
import 'package:tic_tac_toe/logic/game_logic.dart';

class GameScreen extends StatefulWidget {
  final GameLogic gameLogic;

  const GameScreen({required this.gameLogic})

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameLogic gameLogic = GameLogic();

    void _onSquareTapped(int row, int col) {
    setState(() {
      widget.gameLogic.playMove(row, col);
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(kBoardPadding),
          decoration: BoxDecoration(
            border: Border.all(
              color: kBorderColor,
              width: kBorderWidth,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: kBoardSize.toInt(),
              ),
              itemBuilder: (context, index) {
                int row = (index / kBoardSize).floor();
                int col = (index % kBoardSize).floor();
                return GestureDetector(
                  onTap: () => _onSquareTapped(row, col),
                  child: Container(
                  width: kSquareSize,
                  height: kSquareSize,
                  color: getSquareColor(row, col),
                  child: getSymbol(gameLogic.board[row][col]),
                ),
              );
            },
          ),
        ),
      ),
    )
    );
}
}}