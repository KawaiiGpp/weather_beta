import 'package:weather_beta/core/web/web.dart';

class WeatherData {
  final Location location;
  final RealtimeData realtime;
  final ForecastList forecast;

  const WeatherData({
    required this.location,
    required this.realtime,
    required this.forecast,
  });
}
