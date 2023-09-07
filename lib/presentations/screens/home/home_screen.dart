import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTitle(this.menuItem);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        //1ra forma: no se necesita configurar los routers
        // Navigator.of(context).push(MaterialPageRoute(builder: (contex) => const ButtonsScreen()));

        //2da forma:
        // Navigator.of(context).pushNamed(menuItem.link);

        //3ra forma: Se necesita configurar el la propiedad 'routes' en el main/MaterialApp
        // Navigator.pushNamed(context, menuItem.link);

        //4ta forma: Con nombre, es con go_router que lo vamos a implementar mas adelante
        // context.pushNamed("CardsScreen");// este nombre lo tomaria de la variable static CardsName.name

        //5ta forma:
        // context.go(menuItem.link);//Esto cambia la pantalla sin colocar el icono arriba para regresar
        //Apila la pantalla arriba colocando el icono del Back arrow
        context.push(menuItem.link);
      },
    );
  }
}
