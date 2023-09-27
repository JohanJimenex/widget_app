import 'package:flutter/material.dart';
import 'dart:async';

import 'package:widget_app/presentations/screens/johan_stream.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final johanStream = JohanStream();

    Timer.periodic(const Duration(seconds: 1), (value) {
      johanStream.generateCount(value);
    });

    return Scaffold(
      appBar: AppBar(title: const Text("data")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
            const SizedBox(height: 30),
            const CircularProgressIndicator(value: 0.4),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.amber,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            const SizedBox(child: LinearProgressIndicator()),
            const SizedBox(height: 30),
            StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 100),
                    (value) {
                  return value / 100;
                }).takeWhile((value) => value <= 1),
                // johanStream.streamController.stream,
                builder: (context, snapshot) {
                  final data = snapshot.data;

                  return Column(
                    children: [
                      CircularProgressIndicator(value: data),
                      LinearProgressIndicator(value: data),
                    ],
                  );
                }),
            IconButton(
                onPressed: () {
                  // johanStream.getName();
                },
                icon: const Icon(Icons.ads_click_outlined))
          ],
        ),
      ),
    );
  }
}
