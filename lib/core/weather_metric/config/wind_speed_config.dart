import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_metric/config/weather_metric_config.dart';

class WindSpeedConfig implements WeatherMetricConfig {
  const WindSpeedConfig();

  @override
  String get name => "风速";

  @override
  IconData get icon => Icons.air;

  @override
  GradientMap get gradientMap => const GradientMap(
    stops: [0, 20, 39, 75, 118, 202],
    colors: [
      Colors.cyan,
      Colors.green,
      Color(0xFFFBC02D),
      Colors.red,
      Colors.purple,
      Colors.black,
    ],
  );

  @override
  TierMap<String> get labelMap => const TierMap(
    baseOutput: "无风微风，静谧舒适",
    thresholds: [12, 24, 39, 50, 75, 118],
    outputs: [
      "清风拂面，舒适怡人",
      "风力清劲，树叶摇晃",
      "风力强劲，举伞困难",
      "烈风吹袭，减少外出",
      "暴风吹袭，避免外出",
      "飓风过境，极度危险",
    ],
  );

  @override
  String get unit => "km/h";

  @override
  String get shortUnit => "";

  @override
  String format(num value, bool short) {
    return value.round().let((it) => short ? "$it" : "$it $unit");
  }
}
