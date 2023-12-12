import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/themes/app_theme.dart';

final darkModeOnProvider = StateProvider((ref) => false);
//con Provider() se crea un proveddor inmujtable solo para lectura, no se peude cambair el stado, es como el computer() de Angular signal 17+
final listaColoresProvider = Provider((ref) => listColors);
//Index del color seleccionado
final selectedIndexColorProvider = StateProvider((ref) => 0);


//Esta p[arte esta imcompleta, ver video 12 seccion 11
//Esto se usa para poder comunicarnos una Clases y Provider
//Objeto de tipo AppTheme (clase que creé)
// final themeNotifierProvider =
//     StateNotifierProvider<ThemeNotifier, AppTheme>(
//         (ref) => ThemeNotifier());

// //o ThemeController
// class ThemeNotifier extends StateNotifier<AppTheme> {
//   //Con ester constructor se crea una instancia de la clase new AppTheme()
//   ThemeNotifier() : super(AppTheme());
//   // ThemeNotifier(super.state); //forma corta

//   cambiarModoDark() {}

//   cambiarTema() {}
// }
