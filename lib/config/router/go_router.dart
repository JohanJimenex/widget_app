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
      GoRoute(
        path: "/app_tutorial",
        builder: (context, state) => const AppTutorialScreen(),
      ),
      GoRoute(
        path: "/animated",
        builder: (context, state) => const AnimatedScreen(),
      ),
      GoRoute(
        path: "/inifinite_scroll",
        builder: (context, state) => const InfiniteScrollScreen(),
      ),
      GoRoute(
        path: "/progress_indicator",
        builder: (context, state) => const ProgressScreen(),
      ),
      GoRoute(
        path: "/snackbar",
        builder: (context, state) => const SnackbarScreen(),
      ),
      GoRoute(
        path: "/ui_control",
        builder: (context, state) => const UiControlScreen(),
      ),
      GoRoute(
        path: "/cards",
        builder: (context, state) => const CardsScreen(),
      ),
      //ejem[plo con name
      // GoRoute(
      //   path: "/cards",
      //   name:
      //       "CardsScreen", // o se obtiene desde una variable static desde el CardScreen.name
      //   builder: (context, state) => const CardsScreen(),
      // ),
    ]);
