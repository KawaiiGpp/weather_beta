import 'package:flutter/material.dart';
import 'package:weather_beta/pages/weather/widgets/common/weather_card.dart';
import 'package:weather_beta/pages/weather/widgets/src/astronomy_info/sun_metric_info/sun_metric_tile.dart';

class SunMetricInfo extends StatelessWidget {
  const SunMetricInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      padding: const EdgeInsets.all(4),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          SunMetricTile(
            icon: Icons.wb_twilight,
            name: "日出",
            supplier: (it) => it.sunrise,
          ),

          SunMetricTile(
            icon: Icons.sunny,
            name: "正午",
            supplier: (it) => it.transit,
          ),

          SunMetricTile(
            icon: Icons.wb_twighlight,
            name: "日落",
            supplier: (it) => it.sunset,
          ),
        ],
      ),
    );
  }
}
