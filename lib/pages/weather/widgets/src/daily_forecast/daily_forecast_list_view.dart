import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';
import 'package:weather_beta/pages/weather/widgets/src/daily_forecast/daily_forecast_tile.dart';

class DailyForecastListView extends StatelessWidget {
  const DailyForecastListView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<WeatherData>();
    final forecast = data.forecast.asDaily();
    final range = _globalRange(forecast);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: forecast.length,
      itemBuilder: (_, index) => DailyForecastTile(forecast[index], range),
      separatorBuilder: (_, _) => const _Divider(),
    );
  }

  Range _globalRange(List<DailyForecastList> forecast) {
    final temps = forecast
        .expand((it) => it.entries)
        .map((it) => it.temperature);

    return Range.fromInt(temps.min, temps.max);
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 1,
      color: Colors.grey.withAlpha(80),
      indent: 16,
      endIndent: 16,
    );
  }
}
