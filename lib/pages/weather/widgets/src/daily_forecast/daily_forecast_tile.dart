import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/weather_type/weather_type.dart';
import 'package:weather_beta/core/web/web.dart';
import 'package:weather_beta/core/widgets/widgets.dart';

class DailyForecastTile extends StatelessWidget {
  static final _format = DateFormat("MM/dd E");

  final DailyForecastList daily;
  final Range globalRange;

  const DailyForecastTile(this.daily, this.globalRange, {super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    final textStyle = text.titleSmall?.copyWith(fontWeight: FontWeight.normal);

    final temps = daily.entries.mapToList((it) => it.temperature);
    final min = temps.min;
    final max = temps.max;
    final range = Range.fromInt(min, max);

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(_format.format(daily.entries[0].time), style: textStyle),
          const SizedBox(width: 16),

          WeatherSvg.textStyled(
            daily.entries[14].icon,
            filled: true,
            style: text.titleLarge,
            color: context.colorScheme.primary,
          ),

          const SizedBox(width: 16),

          SizedBox(
            width: 30,
            child: Text("$min°", style: textStyle, textAlign: TextAlign.left),
          ),

          _ExpandedDailyBar(range: range, global: globalRange),

          SizedBox(
            width: 30,
            child: Text("$max°", style: textStyle, textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }
}

class _ExpandedDailyBar extends StatelessWidget {
  final Range range;
  final Range global;

  const _ExpandedDailyBar({required this.range, required this.global});

  @override
  Widget build(BuildContext context) {
    final gradientMap = WeatherType.temperature.gradientMap;

    return Expanded(
      child: RangeBar(
        barRange: range,
        totalRange: global,
        height: 6,

        gradient: gradientMap.slice(
          range,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
