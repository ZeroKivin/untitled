import 'package:flutter/material.dart';

import 'app_color.dart';

final class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color background;
  final Color mainPrimary;
  final Color minorPrimary;
  final Color disable;
  final Color mainText;
  final Color minorText;
  final Color divider;
  final Color error;
  final Color badge;
  final Color stroke;

  ColorExtension({
    required this.background,
    required this.mainPrimary,
    required this.minorPrimary,
    required this.disable,
    required this.mainText,
    required this.minorText,
    required this.divider,
    required this.error,
    required this.badge,
    required this.stroke,
  });

  factory ColorExtension.fallback() {
    return ColorExtension(
      background: AppColor.background,
      mainPrimary: AppColor.mainPrimary,
      minorPrimary: AppColor.minorPrimary,
      disable: AppColor.disable,
      mainText: AppColor.mainText,
      minorText: AppColor.minorText,
      divider: AppColor.divider,
      error: AppColor.error,
      badge: AppColor.badge,
      stroke: AppColor.stroke,
    );
  }

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? background,
    Color? mainPrimary,
    Color? minorPrimary,
    Color? disable,
    Color? mainText,
    Color? minorText,
    Color? divider,
    Color? error,
    Color? badge,
    Color? stroke,
  }) {
    return ColorExtension(
      background: background ?? this.background,
      mainPrimary: mainPrimary ?? this.mainPrimary,
      minorPrimary: minorPrimary ?? this.minorPrimary,
      disable: disable ?? this.disable,
      mainText: mainText ?? this.mainText,
      minorText: minorText ?? this.minorText,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      badge: badge ?? this.badge,
      stroke: badge ?? this.stroke,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (other is! ColorExtension) {
      return this;
    }

    return ColorExtension(
      background: Color.lerp(background, other.background, t)!,
      mainPrimary: Color.lerp(mainPrimary, other.mainPrimary, t)!,
      minorPrimary: Color.lerp(minorPrimary, other.minorPrimary, t)!,
      disable: Color.lerp(disable, other.disable, t)!,
      mainText: Color.lerp(mainText, other.mainText, t)!,
      minorText: Color.lerp(minorText, other.minorText, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      error: Color.lerp(error, other.error, t)!,
      badge: Color.lerp(badge, other.badge, t)!,
      stroke: Color.lerp(stroke, other.stroke, t)!,
    );
  }
}

extension CustomColor on BuildContext {
  ColorExtension get colors =>
      Theme.of(this).extension<ColorExtension>() ?? ColorExtension.fallback();
}
