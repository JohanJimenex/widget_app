import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFF0066);

List<Color> _listColors = [
  _customColor,
  Colors.amber,
  Colors.red,
  Colors.black
];

class AppTheme {
  AppTheme();

  ThemeData getTheme({int indexOfColor = 0}) {
    return ThemeData(
        colorSchemeSeed: _listColors[indexOfColor],
        appBarTheme: const AppBarTheme(centerTitle: false));
  }
}
