import 'package:go_router/go_router.dart';
import 'package:weather_beta/core/router/app_routes.dart';
import 'package:weather_beta/pages/home/home_page.dart';
import 'package:weather_beta/pages/redirect/redirect_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.home,

    routes: [
      AppRoute.open(AppRoutes.home, builder: () => const HomePage()),
      AppRoute.open(AppRoutes.redirect, builder: () => const RedirectPage()),
    ],
  );
}
