import 'package:solar_calculator/solar_calculator.dart';

class SolarInfo {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime transit;
  final double elevationNoon;
  final double elevation;

  const SolarInfo({
    required this.sunrise,
    required this.sunset,
    required this.transit,
    required this.elevationNoon,
    required this.elevation,
  });

  factory SolarInfo.calculate(
    DateTime utcTime, {
    required double lon,
    required double lat,
  }) {
    final current = utcTime.currentCalculator(lon, lat);
    final daily = utcTime.dailyCalculator(lon, lat);
    final noon = SolarCalculator(daily.sunTransitTime, lat, lon);

    return SolarInfo(
      sunrise: daily.sunriseTime.toUtcDateTime(),
      sunset: daily.sunsetTime.toUtcDateTime(),
      transit: daily.sunTransitTime.toUtcDateTime(),
      elevationNoon: noon.sunHorizontalPosition.elevation,
      elevation: current.sunHorizontalPosition.elevation,
    );
  }

  factory SolarInfo.now({required double lon, required double lat}) {
    return SolarInfo.calculate(DateTime.now().toUtc(), lon: lon, lat: lat);
  }
}

extension _DateTimeExtension on DateTime {
  SolarCalculator dailyCalculator(double lon, double lat) {
    assert(isUtc);

    final offset = Duration(seconds: (lon * 240).round());
    final local = add(offset);
    final midday = DateTime.utc(local.year, local.month, local.day, 12);
    final utc = midday.subtract(offset);

    return SolarCalculator(Instant.fromDateTime(utc), lat, lon);
  }

  SolarCalculator currentCalculator(double lon, double lat) {
    assert(isUtc);
    return SolarCalculator(Instant.fromDateTime(this), lat, lon);
  }
}
