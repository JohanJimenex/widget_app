import 'package:flutter/material.dart';
import 'package:widget_app/config/router/go_router.dart';
import 'package:widget_app/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,

      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),

      //Se comento porque ahora se usa el GoRouter
      // home: const HomeScreen(),
      //Recuerda que esta forma no es recomendada si se usar FlutterWeb,
      // video 6 seccion 9
      // routes: {
      // "/buttons": (context) => const ButtonsScreen(),
      // "/cards": (context) => const CardsScreen(),
      // },
    );
  }
}
