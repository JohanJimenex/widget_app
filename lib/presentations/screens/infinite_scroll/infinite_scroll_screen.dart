import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() =>
      _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> listImagesId = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool usuarioEstaEnPantalla = true;

  final listViewBController = ScrollController();

  // Es como el ngOnInit() de angular o Start() de Unity
  @override
  void initState() {
    //Listener es como un subscribe de Angular con los Observables
    listViewBController.addListener(() {
      //nos mantenemos monitoreando la posicion actual, y la posicion maxima final del scroll
      double actualPosition = listViewBController.position.pixels;
      double maxScroll = listViewBController.position.maxScrollExtent;
      if ((actualPosition - 300) >= maxScroll) {
        addFiveImages();
      }
    });

    super.initState();
  }

  Future addFiveImages() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    int lastIndexOfElement = listImagesId.last; //5
    // int length = listImagesId.length; //5

    List<int> tempList = [];
    for (var i = 1; i <= 5; i++) {
      tempList.add(lastIndexOfElement + i);
    }

    listImagesId.addAll(tempList);

    //Es para evitar que llame el SetState si se sale de la pantalla. ya que da une rror raro, lo ponemos en false con el dispose()
    if (usuarioEstaEnPantalla == false) return;

    setState(() {});
    // listViewBController.jumpTo(scro);
    isLoading = false;

    if (listViewBController.position.pixels + 500 >=
        listViewBController.position.maxScrollExtent) {
      listViewBController.animateTo(
          listViewBController.position.pixels + 200,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn);
    }
  }

  //Es como el NgOnDestroy() de Angular
  @override
  void dispose() {
    listViewBController.dispose();
    usuarioEstaEnPantalla = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5E92D6),
      //Para remover el safeArea de arriba y abajo y colocar un color de fondo
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(children: [
          RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              int lastIndex = listImagesId.last;
              listImagesId.clear();
              listImagesId.add(lastIndex + 1);
              addFiveImages();
              // setState(() {});
            },
            child: ListView.builder(
              controller: listViewBController,
              itemCount: listImagesId.length,
              itemBuilder: (BuildContext context, int i) {
                // print(listViewBController.keepScrollOffset);
                // Permite mostrar una imagen temporal mientras carga la original, por ejemplo de internet o base de datos
                return FadeInImage(
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  placeholder:
                      const AssetImage("assets/images/jar-loading.gif"),
                  image: NetworkImage(
                      "https://picsum.photos/id/${listImagesId[i]}/300/300"),
                );
              },
            ),
          ),
          isLoading
              ? const Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 10,
                  )))
              : const SizedBox()
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
