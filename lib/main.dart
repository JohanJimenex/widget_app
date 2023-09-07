import 'package:flutter/material.dart';
import 'package:widget_app/config/themes/app_theme.dart';
import 'package:widget_app/presentations/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().getTheme(),
        home: const HomeScreen());
  }
}
