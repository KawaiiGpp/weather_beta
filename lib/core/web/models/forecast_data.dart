import 'package:collection/collection.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/web/models/wind_data.dart';

class ForecastData {
  final DateTime time;
  final int temperature;
  final String icon;
  final String text;
  final WindData wind;
  final int humidity;
  final int? pop;
  final double precipitation;
  final int pressure;
  final int cloud;
  final int dew;

  ForecastData.fromMap(Map<String, dynamic> map)
    : time = DateTime.parse(map["fxTime"]).toLocal(),
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
      pop = (map["pop"] as String?)?.let(int.parse),
      precipitation = double.parse(map["precip"]),
      pressure = int.parse(map["pressure"]),
      cloud = int.parse(map["cloud"]),
      dew = int.parse(map["dew"]);
}

class ForecastList {
  final List<ForecastData> entries;

  ForecastList.create(List raw)
    : entries = raw.mapToList((it) => ForecastData.fromMap(it));

  List<DailyForecastList> asDaily() {
    final grouped = entries.groupListsBy(
      (it) => DateTime(it.time.year, it.time.month, it.time.day),
    );

    return grouped.values
        .where(
          (it) =>
              it.isNotEmpty &&
              it.first.time.hour == 0 &&
              it.last.time.hour == 23,
        )
        .map(DailyForecastList.new)
        .toList();
  }

  List<ForecastData> takeHours(int amount) {
    return entries.take(amount).toList();
  }

  List<R> mapHours<R>(int amount, R Function(ForecastData) transform) {
    return entries.take(amount).mapToList(transform);
  }
}

class DailyForecastList {
  final List<ForecastData> entries;

  DailyForecastList(this.entries);
}
