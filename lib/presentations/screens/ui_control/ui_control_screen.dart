import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _ListView(),
    );
  }
}

bool activarNotificaciones = true;

class _ListView extends StatefulWidget {
  @override
  State<_ListView> createState() => _ListViewState();
}

class _ListViewState extends State<_ListView> {
  String generoSeleccionado = "";
  bool quiereDesayuno = false;
  bool quiereCena = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const ClampingScrollPhysics(), //evita el efecto rebote al deslizar
      children: [
        SwitchListTile(
            title: const Text("Activar notificaciones"),
            subtitle: const Text("sub titulo"),
            value: activarNotificaciones,
            onChanged: (value) {
              activarNotificaciones = value;
              setState(() {});
            }),
        ExpansionTile(
          title: const Text("Genero:"),
          subtitle: Text(generoSeleccionado),
          children: <RadioListTile>[
            RadioListTile(
              title: const Text("Male"),
              subtitle: const Text("sub titulo"),
              value: "male",
              groupValue: generoSeleccionado,
              onChanged: (value) {
                generoSeleccionado = value ?? "";
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Female"),
              subtitle: const Text("sub titulo"),
              value: "female",
              groupValue: generoSeleccionado,
              onChanged: (value) {
                generoSeleccionado = value ?? "";
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Other"),
              subtitle: const Text("sub titulo"),
              value: "other",
              groupValue: generoSeleccionado,
              onChanged: (value) {
                generoSeleccionado = value ?? "";
                setState(() {});
              },
            )
          ],
        ),
        CheckboxListTile(
            title: const Text("Quiere  desayuno?"),
            value: quiereDesayuno,
            onChanged: (value) {
              quiereDesayuno = value!;
              setState(() {});
            }),
        CheckboxListTile(
            title: const Text("Quiere  cena?"),
            value: quiereCena,
            onChanged: (value) {
              quiereCena = value!;
              setState(() {});
            }),
      ],
    );
  }
}
