import 'package:flutter/material.dart';
import 'package:weather_beta/pages/weather/widgets/src/astronomy_info/astronomy_info.dart';
import 'package:weather_beta/pages/weather/widgets/src/daily_forecast/daily_forecast.dart';
import 'package:weather_beta/pages/weather/widgets/src/headline.dart';
import 'package:weather_beta/pages/weather/widgets/src/hourly_forecast.dart';
import 'package:weather_beta/pages/weather/widgets/src/metric_group/metric_group.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16),

            child: Column(
              children: [
                Headline(),
                SizedBox(height: 64),
                HourlyForecast(),
                SizedBox(height: 12),
                DailyForecast(),
                SizedBox(height: 12),
                MetricGroup(),
                SizedBox(height: 12),
                AstronomyInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
