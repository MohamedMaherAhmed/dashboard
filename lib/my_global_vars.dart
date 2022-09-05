library globals;

import 'package:flutter/material.dart';

bool isDark = false;

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF392c49),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFac5281), /// you can try this one too (0xFF9b4a74)
  ),
);

const Color darkModeColour = Color(0xFF392c49);
const Color lightModeColour = Colors.white;

Color getModeBackGroundColour() =>
    isDark ? const Color(0xFF392c49) : Colors.white;

Color getTextColour() => isDark ? Colors.white : Colors.black;
Color getButtonColour() => isDark ? const Color(0xFFac5281) : Colors.blue;
Color getIconColour() => isDark ? Colors.white : Colors.grey;