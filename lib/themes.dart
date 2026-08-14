// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// This file is adapted from
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/gallery/themes.dart

final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: Colors.white,
    error: const Color(0xFFB00020),
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // ! `toggleableActiveColor`/`backgroundColor`/`errorColor` were removed from
    // ! ThemeData, the equivalents now live in `ColorScheme`/component themes.
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF1E88E5)
            : null,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF1E88E5)
            : null,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF1E88E5)
            : null,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: const Color(0xFF202124),
    error: const Color(0xFFB00020),
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF6997DF)
            : null,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF6997DF)
            : null,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? const Color(0xFF6997DF)
            : null,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
  );
}
