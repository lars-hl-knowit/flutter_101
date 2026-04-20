import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  Future<T?> push<T>(Widget screen) => Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
}