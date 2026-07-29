import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/widgets/fitted_text.dart';
import 'package:weather_beta/pages/weather/widgets/common/weather_card.dart';

class MetricGroupTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;

  const MetricGroupTile(
    this.value, {
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return WeatherCard(
      alignment: Alignment.center,

      child: ListTile(
        leading: Icon(icon, color: scheme.primary),
        subtitle: Text(name),
        title: FittedText(value),
      ),
    );
  }
}
