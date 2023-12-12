import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/go_router.dart';
import 'package:widget_app/config/themes/app_theme.dart';
import 'package:widget_app/providers/theme_provider.dart';

void main() {
  //Agregarmos el Provider "Riverpod" para manejrar el estados en widgets que son staless
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexOfColorTheme = ref.watch(selectedIndexColorProvider);
    final darkModeActivated = ref.watch(darkModeOnProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(
          indexOfColor: indexOfColorTheme, darkMode: darkModeActivated),
      //Se comento porque ahora se usa el GoRouter
      // home: const HomeScreen(),
      //Recuerda que esta forma no es recomendada si se usa FlutterWeb,
      // video 6 seccion 9
      // routes: {
      // "/buttons": (context) => const ButtonsScreen(),
      // "/cards": (context) => const CardsScreen(),
      // },
    );
  }
}
