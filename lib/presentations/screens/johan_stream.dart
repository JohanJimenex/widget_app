import 'dart:async';
// import 'dart:math';

class JohanStream {
  final streamController = StreamController<String>();

  void generateCount(dynamic value) {
    streamController.sink.add(value.toString());

    // streamController.close();
  }
}
