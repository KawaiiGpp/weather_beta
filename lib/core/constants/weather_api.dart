import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class WeatherApi {
  WeatherApi._();

  static String get host => _env("API_HOST");
  static String get key => _env("API_KEY");
  
  static final dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm"); 

  static String _env(String path) {
    final result = dotenv.env[path];
    return result ?? (throw StateError("Environment '$path' not defined."));
  }
}

class WeatherApiPaths {
  WeatherApiPaths._();

  static const locationSearch = "/geo/v2/city/lookup";
  static const realtime = "/v7/weather/now";
  static const forecast = "/v7/weather/168h";
}
