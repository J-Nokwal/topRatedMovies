import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingFilling.square(
            size: 70,
          ),
          SizedBox(
            height: 40,
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.grey.shade900,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Loading...',
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              isRepeatingAnimation: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 300),
            ),
          ),
        ],
      )),
    );
  }
}
