import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_metric/weather_metric.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:collection/collection.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WeatherData>();
    final text = context.textTheme;

    final location = data.location;
    final name = "${location.country} · ${location.adm1} · ${location.adm2}";

    final temps = data.forecast.mapHours(24, (it) => it.temperature);
    final tempNow = _format(data.realtime.temperature);
    final tempRange = "${_format(temps.min)} ~ ${_format(temps.max)}";

    return Column(
      children: [
        Text(location.name, style: text.headlineMedium),
        const SizedBox(height: 6),

        Text(name, style: text.titleMedium),
        const SizedBox(height: 24),

        Text(
          tempNow,
          style: text.displayLarge?.copyWith(
            fontSize: 72,
            fontWeight: FontWeight.w300,
          ),
        ),

        const SizedBox(height: 6),
        Text(tempRange, style: text.titleLarge),

        const SizedBox(height: 24),
        Text(data.realtime.text, style: text.titleLarge),
      ],
    );
  }

  String _format(int value) => WeatherMetric.temperature(value);
}
