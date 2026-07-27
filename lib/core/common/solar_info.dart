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
    final instant = Instant.fromDateTime(utcTime);
    final current = SolarCalculator(instant, lat, lon);

    final transit = current.sunTransitTime;
    final noon = SolarCalculator(transit, lat, lon);

    return SolarInfo(
      sunrise: current.sunriseTime.toUtcDateTime(),
      sunset: current.sunsetTime.toUtcDateTime(),
      transit: transit.toUtcDateTime(),
      elevationNoon: noon.sunHorizontalPosition.elevation,
      elevation: current.sunHorizontalPosition.elevation,
    );
  }
}
