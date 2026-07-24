import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/weather_metric/weather_metric.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:weather_beta/pages/weather/widgets/src/metric_group/custom_tiles.dart';
import 'package:weather_beta/pages/weather/widgets/src/metric_group/metric_group_tile.dart';

class MetricGroup extends StatelessWidget {
  const MetricGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WeatherData>();
    final realtime = data.realtime;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,

      crossAxisSpacing: 12,
      mainAxisSpacing: 12,

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        WeatherMetric.humidity.tile(realtime.humidity),
        WeatherMetric.dewPoint.tile(realtime.dew),

        CustomTiles.windDirection(realtime.wind.direction),
        CustomTiles.windScale(realtime.wind.scale),
        CustomTiles.visibility(realtime.visibility),
        CustomTiles.pressure(realtime.pressure),
      ],
    );
  }
}

extension _WeatherMetricExtension on WeatherMetric {
  Widget tile(num value) {
    return MetricGroupTile(this(value), icon: icon, name: name);
  }
}
