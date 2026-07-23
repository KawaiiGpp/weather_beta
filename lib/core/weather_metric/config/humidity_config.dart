import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/weather_metric/config/weather_metric_config.dart';

class HumidityConfig implements WeatherMetricConfig {
  const HumidityConfig();

  @override
  String get name => "相对湿度";

  @override
  IconData get icon => Icons.water_drop;

  @override
  GradientMap get gradientMap => const GradientMap(
    stops: [0, 40, 60, 80, 100],
    colors: [
      Colors.deepOrange,
      Color(0xFFFBC02D),
      Colors.green,
      Colors.cyan,
      Colors.purple,
    ],
  );

  @override
  TierMap<String> get labelMap => const TierMap(
    baseOutput: "极度干燥，注意补水",
    thresholds: [30, 40, 50, 60, 75, 90],
    outputs: [
      "天干物燥，注意保湿",
      "秋高气爽，干爽宜人",
      "湿度适中，清爽宜人",
      "空气湿润，注意通风",
      "空气潮湿，小心霉变",
      "极度潮湿，防潮防霉",
    ],
  );

  @override
  String get unit => "%";

  @override
  String get shortUnit => "";

  @override
  String format(double value, bool short) {
    return "${value.round()}$unit";
  }
}
