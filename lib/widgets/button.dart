import 'dart:async';

import 'package:app/util/app_colors.dart';
import 'package:app/util/color_extensions.dart';
import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = .primary,
  });

  final FutureOr<dynamic> Function()? onPressed;
  final String label;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(_getBackgroundColor),
        minimumSize: WidgetStatePropertyAll(Size(150, 60)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, color: _getTextColor),
      ),
    );
  }

  Color get _getTextColor {
    return switch (variant) {
      .primary => AppColors.blue,
      .secondary => Colors.black,
    };
  }

  Color _getBackgroundColor(Set<WidgetState> states) {
    final isPressed = states.contains(WidgetState.pressed);

    return switch (variant) {
      .primary => isPressed ? AppColors.purple.darken(10) : AppColors.purple,
      .secondary => isPressed ? AppColors.knowitWhite.darken(30) : AppColors.knowitWhite,
    };
  }
}
