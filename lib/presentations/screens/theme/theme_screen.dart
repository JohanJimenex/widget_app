import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/themes/app_theme.dart';
import 'package:widget_app/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  ThemeScreen({super.key});

  // final List<int> list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkModeActivated = ref.watch(darkModeOnProvider);
    final listaColores = ref.watch(listaColoresProvider);
    final int selectedIndexColor = ref.watch(selectedIndexColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Dark mode")),
        actions: [
          Switch(
              value: darkModeActivated,
              onChanged: (value) {
                ref.read(darkModeOnProvider.notifier).state =
                    !darkModeActivated;
                AppTheme().getTheme(indexOfColor: 2);
              })
        ],
      ),
      body: ListView.builder(
          itemCount: listaColores.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.all(30),
                color: listaColores[index],
                child: RadioListTile(
                    activeColor: Colors.white,
                    title: const Text("Este color"),
                    subtitle: Text("${listaColores[index]}"),
                    value: index,
                    groupValue: selectedIndexColor,
                    onChanged: (value) {
                      ref.read(selectedIndexColorProvider.notifier).state =
                          value!;
                    }));
          }),
      //     Column(
      //   children: [...list.map((e) => Text("$e"))],
      // )
    );
  }
}
