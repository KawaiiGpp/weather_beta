import 'package:flutter/material.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/widgets/fitted_text.dart';

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

    return Container(
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: AppStandard.borderRadius,
        color: scheme.surfaceContainer,
      ),

      child: ListTile(
        leading: Icon(icon, color: scheme.primary),
        subtitle: Text(name),
        title: FittedText(value),
      ),
    );
  }
}
