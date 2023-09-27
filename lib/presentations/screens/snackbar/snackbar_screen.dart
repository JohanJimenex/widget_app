import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sncakbar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(
                      context: context, children: [const Text("klk")]);
                },
                child: const Text("Licencias usadas")),
            FilledButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("klk"),
                          content: const Text("jjjjj"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("Cancelar")),
                            FilledButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("Aceptar")),
                          ],
                        );
                      });
                },
                child: const Text("Mostra")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final snack = SnackBar(
            content: const Text("LK"),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Deshacer', // Texto del botón de acción
              onPressed: () {
                // Acción a realizar cuando se presione el botón de acción.
                // Por ejemplo, puedes deshacer la acción anterior.
              },
            ),
          );
          ScaffoldMessenger.of(context)
              .clearSnackBars(); //limpiar cola de snackbar
          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        label: const Text("Mostrar snackbar"),
      ),
    );
  }
}
