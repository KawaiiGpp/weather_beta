import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class GradientMap {
  final List<double> stops;
  final List<Color> colors;

  const GradientMap({required this.stops, required this.colors});

  Color colorAt(double input) {
    _assert();

    if (input <= stops.first) return colors.first;
    if (input >= stops.last) return colors.last;

    final to = stops.indexWhere((each) => input < each);
    final from = to - 1;

    final total = stops[to] - stops[from];
    final actual = input - stops[from];
    final ratio = actual / total;

    return Color.lerp(colors[from], colors[to], ratio)!;
  }

  LinearGradient slice(
    Range range, {
    Color Function(Color)? transform,
    AlignmentGeometry begin = Alignment.bottomCenter,
    AlignmentGeometry end = Alignment.topCenter,
  }) {
    _assert();

    final Map<double, Color> map = range.min == range.max
        ? colorAt(range.min).let((it) => {0.0: it, 1.0: it})
        : _subMap(range);

    if (transform == null) return _gradient(map, begin: begin, end: end);

    final transformed = map.map((k, v) => MapEntry(k, transform(v)));
    return _gradient(transformed, begin: begin, end: end);
  }

  LinearGradient _gradient(
    Map<double, Color> map, {
    required AlignmentGeometry begin,
    required AlignmentGeometry end,
  }) {
    return LinearGradient(
      stops: map.keys.toList(),
      colors: map.values.toList(),
      begin: begin,
      end: end,
    );
  }

  Map<double, Color> _subMap(Range range) {
    final min = range.min;
    final max = range.max;
    final result = <double, Color>{};

    result[0] = colorAt(min);

    for (int i = 0; i < stops.length; i++) {
      final absStop = stops[i];
      if (absStop <= min || absStop >= max) continue;

      final actual = absStop - min;
      final ratio = actual / range.size;

      result[ratio] = colors[i];
    }

    result[1] = colorAt(max);
    return result;
  }

  void _assert() {
    assert(stops.isNotEmpty);
    assert(stops.length == colors.length);
  }
}
