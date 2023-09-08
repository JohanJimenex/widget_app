import 'dart:math';

import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _CustomCard(),
          _CustomCard(),
          _CustomCard(),
          _ImageCard(),
          _ImageCard(),
          _ImageCard(),
          _ImageCard(),
          _ImageCard(),
          _ImageCard(),
        ],
      )),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('BUY TICKETS'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
            TextButton(
              child: const Text('LISTEN'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ));
  }
}

class _ImageCard extends StatelessWidget {
  _ImageCard();

  final int randomId = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/id/$randomId/1000/${randomId}50",
            // height: 200,
            // width: double.infinity,
            //con esto le decimo que se ajuste a las medidas que tiene en el heigh y widht
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20))),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.save)),
                )),
          )
        ],
      ),
    );
  }
}
