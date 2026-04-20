import 'dart:async';

import 'package:app/util/app_colors.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  static const ballAnimationDuration = Duration(milliseconds: 1000);

  var ballDirections = <Alignment>[
    .bottomLeft,
    .bottomCenter,
    .bottomRight,
    .centerLeft,
    .centerRight,
    .topLeft,
    .topCenter,
    .topRight,
  ];

  var ballColors = <Color>[
    AppColors.purple,
    AppColors.pink,
    AppColors.green,
    AppColors.blue,
    AppColors.knowitBlack,
  ];

  var emojis = <String>[
    '😀',
    '😅',
    '🥳',
    '🤓',
    '🤩',
  ];

  Timer? ballMovementTimer;

  var ballAlignment = Alignment.bottomCenter;
  var ballColor = AppColors.green;
  var ballEmoji = '😀';

  @override
  void initState() {
    super.initState();
    _startBallAnimation();
  }

  @override
  void dispose() {
    ballMovementTimer?.cancel();
    super.dispose();
  }

  void _startBallAnimation() {
    ballMovementTimer = Timer.periodic(
      ballAnimationDuration,
      (timer) {
        ballDirections.shuffle();
        ballColors.shuffle();
        emojis.shuffle();

        setState(() => ballAlignment = ballDirections.first);
        setState(() => ballColor = ballColors.first);
        setState(() => ballEmoji = emojis.first);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Animasjon',
      child: Column(
        children: [_bouncyBall()],
      ),
    );
  }

  Widget _bouncyBall() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(border: BoxBorder.all(width: 2, color: AppColors.knowitBlack)),
      child: AnimatedAlign(
        duration: ballAnimationDuration,
        curve: Curves.bounceOut,
        alignment: ballAlignment,
        child: AnimatedContainer(
          duration: ballAnimationDuration,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: ballColor,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Center(
            child: Text(
              ballEmoji,
              textAlign: .center,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
