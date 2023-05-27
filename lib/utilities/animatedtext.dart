import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: SizedBox(
        width: 300.0,
        child: AnimatedTextKit(animatedTexts: [
          TyperAnimatedText('Tap the card for details', textStyle: const TextStyle(
            fontSize: 20
          ))
        ]),
      ),
    );
  }
}