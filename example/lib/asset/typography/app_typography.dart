import 'package:flutter/material.dart';

final class AppTypography {
  static const TextStyle normal11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normal13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normal14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normal16 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bold13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bold34 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  AppTypography._();
}

extension ColoredText on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
