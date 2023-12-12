import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // saber si tiene notch obteniendo el padding superior. video 4 seccion 11
    // double hasNotch = MediaQuery.viewPaddingOf(context).top;
    // double hasNotch = MediaQuery.of(context).padding.top;
    // print(hasNotch); //imprime 59 porque tiene notch sino imprime 24 mas o menos

    return Drawer(
      child: NavigationDrawer(
          selectedIndex: navDrawerIndex,
          onDestinationSelected: (value) {
            navDrawerIndex = value;
            setState(() {});
            Navigator.pop(
                context); //ver video 5 seccion 11 para usar el key para cerrar el drawer
            String link = appMenuItems[value].link;

            // context.go(link); no crea un stack y no muestra el icono de volver
            context.push(link);
          },
          children: [
            const Padding(
              padding: EdgeInsets.all(28),
              child: Center(child: Text("Menu")),
            ),
            ...appMenuItems
                .sublist(0,
                    3) //este metodo permite obtener los 3 primeros elementos
                .map((element) => NavigationDrawerDestination(
                      icon: Icon(element.icon),
                      label: Text(element.title),
                    )),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 16),
              child: Divider(),
            ),
            const Center(child: Text("Otras opciones")),
            ...appMenuItems
                .sublist(3,
                    6) //este metodo permite obtener los 3 primeros elementos
                .map((element) => NavigationDrawerDestination(
                      icon: Icon(element.icon),
                      label: Text(element.title),
                    )),
          ]),
    );
  }
}

class _NavigationDrawerDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const NavigationDrawerDestination(
      icon: Icon(Icons.add),
      label: Text("Home Screen"),
    );
  }
}
