import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:collection/collection.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WeatherData>();
    final text = context.textTheme;

    final realtime = data.realtime;
    final forecast = data.forecast;
    final location = data.location;

    final name = "${location.country} - ${location.adm1} - ${location.adm2}";
    final temps = forecast.mapHours(24, (it) => it.temperature);

    return Column(
      children: [
        Text(location.name, style: text.headlineMedium),
        const SizedBox(height: 6),
        Text(name, style: text.titleMedium),
        const SizedBox(height: 24),

        Text(
          "${realtime.temperature}°C",
          style: text.displayLarge?.copyWith(
            fontSize: 72,
            fontWeight: FontWeight.w300,
          ),
        ),

        const SizedBox(height: 6),
        Text("${temps.min}°C ~ ${temps.max}°C", style: text.titleLarge),
        const SizedBox(height: 24),
        Text(realtime.text, style: text.titleLarge),
      ],
    );
  }
}
