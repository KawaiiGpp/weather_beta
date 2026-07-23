import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';

abstract interface class WeatherMetricConfig {
  String get name;

  IconData get icon;

  GradientMap get gradientMap;

  TierMap<String> get labelMap;

  String get unit;

  String get shortUnit;

  String format(num value, bool short);
}
