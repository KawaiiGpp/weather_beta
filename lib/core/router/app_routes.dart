import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/pages/redirect/redirect_page.dart';

class AppRoute {
  AppRoute._();

  static GoRoute typed<T extends Object>(
    String path, {
    required Widget Function(T value) builder,
  }) {
    return GoRoute(
      path: path,
      redirect: (_, state) => state.extra is T ? null : AppRoutes.redirect,

      builder: (_, state) => state.extra.let(
        (value) => value is T ? builder(value) : const RedirectPage(),
      ),
    );
  }

  static GoRoute open(String path, {required Widget Function() builder}) {
    return GoRoute(path: path, builder: (_, _) => builder());
  }
}

class AppRoutes {
  AppRoutes._();

  static const home = "/";
  static const redirect = "/redirect";
  static const locationSearch = "/location_search";
}
