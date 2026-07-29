import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_metric/weather_metric.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/core/widgets/widgets.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:weather_beta/pages/weather/widgets/common/weather_card.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WeatherData>();
    final entries = data.forecast.takeHours(24);

    return WeatherCard(
      height: 155,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(2),

        itemCount: entries.length,
        itemBuilder: (context, index) => _Tile(entries[index]),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  static final _format = DateFormat("HH:mm");
  final ForecastData data;

  const _Tile(this.data);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(_format.format(data.time)),
          const SizedBox(height: 12),

          WeatherSvg.textStyled(
            data.icon,
            style: context.textTheme.headlineMedium,
            filled: true,
            color: context.colorScheme.primary,
          ),

          const SizedBox(height: 12),
          Text(WeatherMetric.temperature(data.temperature)),

          const SizedBox(height: 2),
          FittedText(data.text),
        ],
      ),
    );
  }
}
