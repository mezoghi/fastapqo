part of 'app.dart';

import 'features/home/presentation/splash_screen.dart';
// TODO: import HomeScreen when implemented

extension _Routes on _MyTemplateAppState {
  ///
  /// Declared Routes
  void _initRoutes() {
    usePathUrlStrategy();
    _router = GoRouter(
      initialLocation: AppRoute.splash.toPath,
      routes: <GoRoute>[
        GoRoute(
          path: AppRoute.splash.toPath,
          name: AppRoute.splash.toName,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: AppRoute.login.toPath,
          name: AppRoute.login.toName,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        // GoRoute(
        //   path: AppRoute.home.toPath,
        //   name: AppRoute.home.toName,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const HomeScreen();
        //   },
        // ),
      ],
    );
  }
}
