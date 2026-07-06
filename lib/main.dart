import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_beta/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _setupNavigationBarStyle();
  _setupPreferredOrientations();

  runApp(const App());
}

void _setupPreferredOrientations() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future<void> _setupNavigationBarStyle() async {
  if (kIsWeb) return;
  if (defaultTargetPlatform != TargetPlatform.android) return;
  
  await WidgetsBinding.instance.endOfFrame;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
    ),
  );
}
