import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';

abstract interface class WeatherTypeConfig {
  String get name;

  IconData get icon;

  GradientMap get gradientMap;

  TierMap<String> get labelMap;
}