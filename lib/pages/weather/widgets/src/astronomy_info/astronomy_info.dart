import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:weather_beta/pages/weather/widgets/src/astronomy_info/sun_metric_info/sun_metric_info.dart';

class AstronomyInfo extends StatelessWidget {
  const AstronomyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(create: _createSolarInfo, child: const SunMetricInfo());
  }

  SolarInfo _createSolarInfo(BuildContext context) {
    final data = context.read<WeatherData>();
    return SolarInfo.now(lon: data.location.lon, lat: data.location.lat);
  }
}
