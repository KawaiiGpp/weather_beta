import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/widgets/widgets.dart';

class SolarElevationBar extends StatelessWidget {
  static const _gradientMap = GradientMap(
    stops: [0, 30, 45, 60, 75, 90],
    colors: [
      Colors.cyan,
      Colors.lime,
      Colors.amber,
      Colors.deepOrange,
      Colors.pink,
      Colors.deepPurple,
    ],
  );

  final Range current;
  final Range noon;

  const SolarElevationBar({
    super.key,
    required this.current,
    required this.noon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RangeBar(
        height: 6,
        barRange: current,
        totalRange: noon,
        offset: 0,

        gradient: _gradientMap.slice(
          current,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
