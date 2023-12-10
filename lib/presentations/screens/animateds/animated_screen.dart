import 'package:flutter/material.dart';

bool change = false;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeInCirc,
          duration: const Duration(seconds: 1),
          width: change ? 200.0 : 100.0,
          height: change ? 200.0 : 300,
          color: change ? Colors.blue : Colors.yellow,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          change = !change;
          setState(() {});
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
