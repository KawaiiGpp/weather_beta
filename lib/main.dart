import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart';
import 'package:weather_beta/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _setupNavigationBarStyle();
  _setupPreferredOrientations();
  
  initializeTimeZones();

  await _setupIntlLocale("zh_CN");
  await dotenv.load(fileName: ".env");

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

Future<void> _setupIntlLocale(String locale) async {
  await initializeDateFormatting(locale);
  Intl.defaultLocale = locale;
}
