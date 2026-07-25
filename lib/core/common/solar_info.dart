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

  factory SolarInfo.calculate(double lon, double lat, DateTime time) {
    final instant = Instant.fromDateTime(time);
    final current = SolarCalculator(instant, lat, lon);

    final transit = current.sunTransitTime;
    final noon = SolarCalculator(transit, lat, lon);

    return SolarInfo(
      sunrise: current.sunriseTime.toUtcDateTime().toLocal(),
      sunset: current.sunsetTime.toUtcDateTime().toLocal(),
      transit: transit.toUtcDateTime().toLocal(),
      elevationNoon: noon.sunHorizontalPosition.elevation,
      elevation: current.sunHorizontalPosition.elevation,
    );
  }
}
