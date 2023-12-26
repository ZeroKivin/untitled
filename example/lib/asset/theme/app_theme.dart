import 'package:flutter/material.dart';

import '../color/app_color.dart';
import '../color/color_extension.dart';
import '../typography/app_typography.dart';

final class AppTheme {
  final ThemeData themeData;

  AppTheme._(this.themeData);

  factory AppTheme.light() {
    return AppTheme._(
      ThemeData(
        useMaterial3: false,
        fontFamily: 'PTSans',
        pageTransitionsTheme: const PageTransitionsTheme(),
        scaffoldBackgroundColor: AppColor.background,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColor.mainPrimary,
          onPrimary: AppColor.background,
          secondary: AppColor.mainPrimary,
          onSecondary: AppColor.background,
          error: AppColor.error,
          onError: AppColor.background,
          background: AppColor.background,
          onBackground: AppColor.mainPrimary,
          surface: AppColor.background,
          onSurface: AppColor.mainPrimary,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColor.background,
          foregroundColor: AppColor.mainPrimary,
          titleTextStyle: AppTypography.bold19.withColor(
            AppColor.mainText,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColor.background,
          selectedLabelStyle: AppTypography.normal11.withColor(
            AppColor.mainPrimary,
          ),
          unselectedLabelStyle: AppTypography.normal11.withColor(
            AppColor.disable,
          ),
          selectedIconTheme: const IconThemeData(
            size: 24,
            color: AppColor.mainPrimary,
          ),
          unselectedIconTheme: const IconThemeData(
            size: 24,
            color: AppColor.disable,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColor.divider,
          space: 1,
          thickness: 1,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.mainPrimary,
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColor.background,
            backgroundColor: AppColor.mainPrimary,
            disabledForegroundColor: AppColor.background,
            disabledBackgroundColor: AppColor.disable,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
            fixedSize: const Size.fromHeight(52),
            minimumSize: Size.zero,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColor.mainText,
            backgroundColor: AppColor.background,
            disabledForegroundColor: AppColor.disable,
            disabledBackgroundColor: AppColor.background,
            elevation: 0,
            side: const BorderSide(
              color: AppColor.divider,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6,
              ),
            ),
            fixedSize: const Size.fromHeight(52),
            minimumSize: Size.zero,
          ),
        ),
        badgeTheme: const BadgeThemeData(
          backgroundColor: AppColor.badge,
        ),
        extensions: [
          ColorExtension(
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
          ),
        ],
      ),
    );
  }

  factory AppTheme.dark() => AppTheme.light();
}
