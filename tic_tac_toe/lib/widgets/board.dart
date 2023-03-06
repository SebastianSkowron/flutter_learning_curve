import 'package:flutter/material.dart';
import 'square.dart';
import '/models/game.dart';

class Board extends StatelessWidget {
  final Game game;
  final Function(int) onTap;

  const Board({
    Key? key,
    required this.game,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: game.boardSize,
      ),
      itemBuilder: (context, index) {
        return Square(
          symbol: game.board[index],
          onTap: () {
            if (game.board[index] == '') {
              onTap(index);
            }
          },
        );
      },
      itemCount: game.boardSize * game.boardSize,
    );
  }
}
