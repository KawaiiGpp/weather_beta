import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/pages/weather/widgets/common/weather_card.dart';
import 'package:weather_beta/pages/weather/widgets/src/astronomy_info/solar_elevation_info/solar_elevation_bar.dart';

class SolarElevationInfo extends StatelessWidget {
  const SolarElevationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<SolarInfo>();
    final primary = context.colorScheme.primary;

    final current = data.elevation;
    final noon = data.elevationNoon;

    final currentRange = Range(0, max(0, current));
    final noonRange = Range(0, max(0, noon));
    final currentText = "${current.toStringAsFixed(2)}°";
    final noonText = "${noon.toStringAsFixed(2)}°";

    return WeatherCard(
      child: ListTile(
        leading: Icon(Icons.wb_sunny_outlined, color: primary),

        title: Row(
          children: [
            const Text("0°"),
            const SizedBox(width: 16),
            SolarElevationBar(current: currentRange, noon: noonRange),
            const SizedBox(width: 16),
            Text(noonText),
          ],
        ),

        subtitle: Text("当前高度角 $currentText，正午 $noonText"),
      ),
    );
  }
}
