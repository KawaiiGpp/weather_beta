import 'package:weather_beta/core/constants/weather_api.dart';
import 'package:weather_beta/core/web/models/wind_data.dart';

class RealtimeData {
  final DateTime time;
  final int temperature;
  final String icon;
  final String text;
  final WindData wind;
  final int humidity;
  final double precipitation;
  final int pressure;
  final int visibility;
  final int cloud;
  final int dew;

  RealtimeData.fromMap(Map<String, dynamic> map)
    : time = WeatherApi.dateFormat.parse(map["obsTime"]),
      temperature = int.parse(map["temp"]),
      icon = map["icon"],
      text = map["text"],
      wind = WindData(
        angle: int.parse(map["wind360"]),
        direction: map["windDir"],
        scale: map["windScale"],
        speed: int.parse(map["windSpeed"]),
      ),
      humidity = int.parse(map["humidity"]),
      precipitation = double.parse(map["precip"]),
      pressure = int.parse(map["pressure"]),
      visibility = int.parse(map["vis"]),
      cloud = int.parse(map["cloud"]),
      dew = int.parse(map["dew"]);
}
