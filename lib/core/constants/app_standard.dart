import 'package:flutter/material.dart';

class AppStandard {
  AppStandard._();

  static final theme = ThemeData(
    colorScheme: _AppThemes.colorScheme,
    brightness: Brightness.light,

    inputDecorationTheme: _AppThemes.inputDecoration,
    filledButtonTheme: _AppThemes.filledButton,
    textButtonTheme: _AppThemes.textButton,
  );

  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const pagePaddingAll = EdgeInsets.all(16);

  static final borderRadius = BorderRadius.circular(16);
}

class _AppThemes {
  static final colorScheme = ColorScheme.fromSeed(seedColor: Colors.cyan);

  static final filledButton = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: AppStandard.borderRadius),
    ),
  );

  static final textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: AppStandard.borderRadius),
    ),
  );

  static final inputDecoration = InputDecorationThemeData(
    filled: true,
    fillColor: colorScheme.surfaceContainer,

    border: OutlineInputBorder(
      borderRadius: AppStandard.borderRadius,
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: AppStandard.borderRadius,
      borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
    ),

    contentPadding: const EdgeInsets.all(16),
  );
}
