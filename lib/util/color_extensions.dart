import 'dart:math' as math;
import 'package:flutter/material.dart';

extension ColorExtentions on Color {
  /// Based on an extension method from the [https://pub.dev/packages/tinycolor2] package. Returns a color which is
  /// [amount] percent darker  than the original color.
  Color darken(int amount) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final colorAsHslColor = HSLColor.fromColor(this);
    final lightness = math.min(1.0, math.max(0.0, colorAsHslColor.lightness - p));
    return colorAsHslColor.withLightness(lightness).toColor();
  }
}