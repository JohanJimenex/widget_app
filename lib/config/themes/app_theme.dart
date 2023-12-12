import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFF0066);

List<Color> listColors = [
  _customColor,
  Colors.amber,
  Colors.purple,
  Colors.black,
  Colors.green,
  Colors.blue
];

class AppTheme {
  AppTheme();

  ThemeData getTheme({int indexOfColor = 0, darkMode = false}) {
    return ThemeData(
        useMaterial3: true,
        brightness: darkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: listColors[indexOfColor],
        appBarTheme: const AppBarTheme(centerTitle: false));
  }
}
