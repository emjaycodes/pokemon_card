import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Liquidtext extends StatelessWidget {
  const Liquidtext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: TextLiquidFill(
        text: 'TAP',
        waveColor: Colors.yellow,
        boxBackgroundColor: Colors.purpleAccent,
        textStyle: TextStyle(
          fontSize: 80.0,
          fontWeight: FontWeight.bold,
        ),
        boxHeight: 120.0,
      ),
    );
  }
}