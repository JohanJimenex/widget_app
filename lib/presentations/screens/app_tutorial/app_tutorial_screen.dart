import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipsTutotial {
  String title;
  String description;
  String urlImgae;
  TipsTutotial(this.title, this.description, this.urlImgae);
}

final tipsTutotial = [
  TipsTutotial("title", "lorem ipsup", "assets/images/1.png"),
  TipsTutotial("tip 2", "lorem ipsup", "assets/images/2.png"),
  TipsTutotial("tip 3", "lorem ipsup", "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();

  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              onPageChanged: (value) {
                // ignore: avoid_print
                pageNumber = value;
                setState(() {});
              },
              children:
                  tipsTutotial.map((e) => _TutorialView(e)).toList()),
          Positioned(
              right: 20,
              top: 100,
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("Omitir"))),
          Positioned(
              bottom: 100,
              right: 50,
              child: (pageNumber == tipsTutotial.length - 1)
                  ? FadeInRight(
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text("Comenzar"),
                      ),
                    )
                  : const Text("Deslizar >"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    //esto destruye los listener , (como las subscriptiones de angular) cuando se sale de la pantalla
    //aunque no estoy usando listener coomo Fernando en el vdieo 13, seccion 10
    pageViewController.dispose();
    super.dispose();
  }
}

class _TutorialView extends StatelessWidget {
  final TipsTutotial tipsTutotial;

  const _TutorialView(this.tipsTutotial);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(image: AssetImage(tipsTutotial.urlImgae)), //otra forma
          Image.asset(tipsTutotial.urlImgae),
          const SizedBox(height: 5),
          Text(
            tipsTutotial.title,
            style: titleStyle,
          ),
          const SizedBox(height: 1),
          Text(
            tipsTutotial.description,
            style: descriptionStyle,
          ),
        ],
      ),
    );
  }
}
