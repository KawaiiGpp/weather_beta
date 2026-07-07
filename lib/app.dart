import 'package:flutter/material.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: AppStandard.theme,
    );
  }
}
