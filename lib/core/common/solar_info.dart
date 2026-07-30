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
    final current = utcTime.createCalculator(lon, lat);
    final noon = SolarCalculator(current.sunTransitTime, lat, lon);

    return SolarInfo(
      sunrise: current.sunriseTime.toUtcDateTime(),
      sunset: current.sunsetTime.toUtcDateTime(),
      transit: noon.sunTransitTime.toUtcDateTime(),
      elevationNoon: noon.sunHorizontalPosition.elevation,
      elevation: current.sunHorizontalPosition.elevation,
    );
  }
}

extension _DateTimeExtension on DateTime {
  SolarCalculator createCalculator(double lon, double lat) {
    assert(isUtc);

    final base = DateTime.utc(year, month, day, 12);
    final utc = base.subtract(Duration(seconds: (lon * 240).round()));

    return SolarCalculator(Instant.fromDateTime(utc), lat, lon);
  }
}
