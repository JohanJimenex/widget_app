import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentations/shared/widgets/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla de Botones"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_rounded)),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text("ElevatedButton()")),
          // Deshabilitar boton con null
          const ElevatedButton(
              onPressed: null, child: Text("ElevatedButton() disabled")),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.radio_button_checked),
              label: const Text("ElevatedButton.icon()")),
          FilledButton(
              onPressed: () {}, child: const Text("FillButton()")),
          FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    colors.secondary), // Cambia el color del ícono aquí
              ),
              icon: const Icon(Icons.tram_sharp),
              onPressed: () {},
              label: const Text("FillButton.icon()")),

          OutlinedButton(
              onPressed: () {}, child: const Text("OutlineButton")),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("OutlineButton.icon()")),
          TextButton(onPressed: () {}, child: const Text("TextButton")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.text_fields),
              label: const Text("TextButton")),
          IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              onPressed: () {},
              icon: const Icon(Icons.icecream_outlined)),
          const CustomButton()
        ],
      ),
    );
  }
}
