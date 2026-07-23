import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/weather_metric/config/dew_point_config.dart';
import 'package:weather_beta/core/weather_metric/config/humidity_config.dart';
import 'package:weather_beta/core/weather_metric/config/temperature_config.dart';
import 'package:weather_beta/core/weather_metric/config/weather_metric_config.dart';
import 'package:weather_beta/core/weather_metric/config/wind_speed_config.dart';

enum WeatherMetric {
  temperature(TemperatureConfig()),
  humidity(HumidityConfig()),
  windSpeed(WindSpeedConfig()),
  dewPoint(DewPointConfig());

  final WeatherMetricConfig _config;

  String get name => _config.name;
  IconData get icon => _config.icon;

  GradientMap get gradientMap => _config.gradientMap;
  TierMap<String> get labelMap => _config.labelMap;

  String get unit => _config.unit;
  String get shortUnit => _config.shortUnit;

  const WeatherMetric(this._config);

  String format(num value, {bool short = false}) {
    return _config.format(value, short);
  }
}
