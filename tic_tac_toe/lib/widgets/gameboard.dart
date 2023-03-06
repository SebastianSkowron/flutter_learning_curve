import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final List<List<String>> squares;
  final Function(int, int) onTap;

  Board({required this.squares, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: squares.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        int row = (index / 3).floor();
        int col = index % 3;

        return GestureDetector(
          onTap: () {
            if (squares[row][col] == '') {
              onTap(row, col);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: Text(
                squares[row][col],
                style: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
