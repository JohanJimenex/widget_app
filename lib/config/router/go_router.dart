import 'package:go_router/go_router.dart';
import 'package:widget_app/presentations/screens/screens.dart';

GoRouter appRouter = GoRouter(
    // initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/buttons",
        builder: (context, state) => const ButtonsScreen(),
      ),
      GoRoute(
        path: "/cards",
        builder: (context, state) => const CardsScreen(),
      ),

      //ejem[plo con name
      GoRoute(
        path: "/cards",
        name:
            "CardsScreen", // o se obtiene desde una variable static desde el CardScreen.name
        builder: (context, state) => const CardsScreen(),
      ),
    ]);
