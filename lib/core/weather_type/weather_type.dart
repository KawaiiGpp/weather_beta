import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/weather_type/config/dew_point_config.dart';
import 'package:weather_beta/core/weather_type/config/humidity_config.dart';
import 'package:weather_beta/core/weather_type/config/temperature_config.dart';
import 'package:weather_beta/core/weather_type/config/weather_type_config.dart';
import 'package:weather_beta/core/weather_type/config/wind_speed_config.dart';

enum WeatherType {
  temperature(TemperatureConfig()),
  humidity(HumidityConfig()),
  windSpeed(WindSpeedConfig()),
  dewPoint(DewPointConfig());

  final WeatherTypeConfig _config;

  String get name => _config.name;
  IconData get icon => _config.icon;

  GradientMap get gradientMap => _config.gradientMap;
  TierMap<String> get labelMap => _config.labelMap;

  const WeatherType(this._config);
}
