import 'package:flutter/material.dart';
import 'package:weather_beta/pages/weather/widgets/src/metric_group/metric_group_tile.dart';

class CustomTiles {
  CustomTiles._();

  static Widget windScale(String value) {
    return MetricGroupTile(value, icon: Icons.air, name: "风级");
  }

  static Widget windDirection(String value) {
    return MetricGroupTile(value, icon: Icons.explore, name: "风向");
  }

  static Widget visibility(int value) {
    return MetricGroupTile(
      "$value km",
      icon: Icons.remove_red_eye,
      name: "能见度",
    );
  }

  static Widget pressure(int value) {
    return MetricGroupTile("$value hPa", icon: Icons.speed, name: "气压");
  }
}
