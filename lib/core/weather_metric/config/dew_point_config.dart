import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_metric/config/weather_metric_config.dart';

class DewPointConfig implements WeatherMetricConfig {
  const DewPointConfig();

  @override
  String get name => "露点温度";

  @override
  IconData get icon => Icons.dew_point;

  @override
  GradientMap get gradientMap => const GradientMap(
    stops: [0, 10, 15, 20, 26, 32],
    colors: [
      Colors.indigo,
      Colors.blue,
      Colors.lightGreen,
      Color(0xFFFBC02D),
      Colors.red,
      Colors.purple,
    ],
  );

  @override
  TierMap<String> get labelMap => const TierMap(
    baseOutput: "体感清透，干爽无汗",
    thresholds: [18, 20, 22, 24, 27],
    outputs: ["略有潮意，皮肤粘腻", "闷热渐显，出汗难干", "闷热明显，湿热难耐", "非常闷热，桑拿体感", "极度闷热，小心中暑"],
  );

  @override
  String get unit => "°C";

  @override
  String get shortUnit => "°";

  @override
  String format(num value, bool short) {
    return value.round().let((it) => short ? "$it$shortUnit" : "$it$unit");
  }
}
