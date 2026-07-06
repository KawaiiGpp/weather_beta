import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_beta/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupPreferredOrientations();

  runApp(const App());
}

void _setupPreferredOrientations() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
