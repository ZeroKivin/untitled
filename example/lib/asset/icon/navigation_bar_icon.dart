import 'package:flutter/material.dart';

final class NavigationBarIcon {
  static const IconData logo = IconData(
    0xe901,
    fontFamily: _kFontFamily,
  );

  static const IconData catalog = IconData(
    0xe902,
    fontFamily: _kFontFamily,
  );

  static const IconData cart = IconData(
    0xe903,
    fontFamily: _kFontFamily,
  );

  static const IconData favorite = IconData(
    0xe904,
    fontFamily: _kFontFamily,
  );

  static const IconData profile = IconData(
    0xe900,
    fontFamily: _kFontFamily,
  );

  static const _kFontFamily = 'NavigationBarIcons';

  NavigationBarIcon._();
}
