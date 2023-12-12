import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/providers/contador_provider.dart';
import 'package:widget_app/providers/theme_provider.dart';

//Par ausar Riverpod provider debemos cambair a un ConsumeWidget
class ContadorScreen extends ConsumerWidget {
  const ContadorScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //para obtener la referencia debemos colcoar el parametro "ref", .watch para subscribirnos
    final int contadorDeClicks = ref.watch(contadorProvider);
    final bool darkModeOn = ref.watch(darkModeOnProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador screen"),
        actions: [
          IconButton(
              onPressed: () {
                // .read para leer la variable y .notifier para poder obtener la referencia
                ref.read(darkModeOnProvider.notifier).state = !darkModeOn;
              },
              icon: darkModeOn
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text(
          "Valor: $contadorDeClicks",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.water_drop_outlined),
          onPressed: () {
            // ref.read(contadorProvider.notifier).state++;
            // ref.read(contadorProvider.notifier).update((state) => state + 1); es como el update de Angular Signal 17+
            ref.read(contadorProvider.notifier).update((state) {
              return state + 1;
            });
          }),
    );
  }
}
