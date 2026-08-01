import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/pages/weather/data/weather_data.dart';

class SunMetricTile extends StatelessWidget {
  static final _dateFormat = DateFormat("MM/dd");
  static final _timeFormat = DateFormat("HH:mm:ss");

  final IconData icon;
  final String name;
  final DateTime Function(SolarInfo) supplier;

  const SunMetricTile({
    super.key,
    required this.icon,
    required this.name,
    required this.supplier,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Container(
      width: 96,
      padding: const EdgeInsets.all(16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, color: scheme.primary),
          const SizedBox(height: 12),

          Text(_format(_dateTime(context))),
          const SizedBox(height: 2),

          Text(name, style: TextStyle(color: scheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  String _format(TZDateTime time) {
    return time.isToday ? _timeFormat.format(time) : _dateFormat.format(time);
  }

  TZDateTime _dateTime(BuildContext context) {
    final utcTime = supplier(context.read<SolarInfo>());
    final tz = context.read<WeatherData>().location.tz;

    return TZDateTime.from(utcTime, getLocation(tz));
  }
}

extension _Extension on TZDateTime {
  bool get isToday {
    final now = TZDateTime.now(location);
    return now.year == year && now.month == month && now.day == day;
  }
}
