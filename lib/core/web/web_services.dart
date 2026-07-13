import 'package:weather_beta/core/web/models/models.dart';
import 'package:weather_beta/core/web/services/location_search.dart';
import 'package:weather_beta/core/web/services/realtime_weather.dart';

abstract interface class WebService<T> {
  String get path;

  Future<T> fetch(String input);
}

class WebServices {
  WebServices._();

  static const WebService<LocationList> locationSearch = LocationSearch();
  static const WebService<RealtimeData> realtimeData = RealtimeWeather();
}
