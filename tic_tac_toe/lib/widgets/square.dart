import 'package:flutter/material.dart';
import '/utils/constants.dart';

class Square extends StatelessWidget {
  final String symbol;
  final Function onTap;

  const Square({
    Key? key,
    required this.symbol,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        width: 80,
        height: 80,
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: kSymbolFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
