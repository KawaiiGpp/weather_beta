import 'package:flutter/material.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/pages/weather/widgets/src/daily_forecast/daily_forecast_list_view.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainer,
      borderRadius: AppStandard.borderRadius,
      clipBehavior: Clip.antiAlias,

      child: const DailyForecastListView(),
    );
  }
}
