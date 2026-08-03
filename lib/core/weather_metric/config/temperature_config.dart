import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_metric/config/weather_metric_config.dart';

class TemperatureConfig implements WeatherMetricConfig {
  const TemperatureConfig();

  @override
  String get name => "气温";

  @override
  IconData get icon => Icons.thermostat;

  @override
  GradientMap get gradientMap => const GradientMap(
    stops: [-45, -20, 0, 12, 18, 24, 34, 55],
    colors: [
      Colors.purple,
      Colors.indigo,
      Colors.blue,
      Colors.cyan,
      Colors.lightGreen,
      Color(0xFFFBC02D),
      Colors.red,
      Colors.black,
    ],
  );

  @override
  TierMap<String> get labelMap => const TierMap(
    baseOutput: "极寒天气，注意安全",
    thresholds: [-20, -10, 0, 10, 16, 22, 26, 30, 34, 40],
    outputs: [
      "严寒天气，注意御寒",
      "冰天雪地，注意保暖",
      "天寒地冻，注意保暖",
      "天气寒凉，适当添衣",
      "天气凉爽，适宜户外",
      "温暖如春，万事皆宜",
      "绿树成荫，注意防晒",
      "天气闷热，注意补水",
      "炎热高温，小心中暑",
      "酷暑天气，避免外出",
    ],
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
