import 'dart:math';

import 'package:weather_beta/core/extensions/extensions.dart';

class PlateauBreaker {
  final List<_Group> _groups;

  final double strength;
  final List<double> source;

  PlateauBreaker.from(this.source, {double strength = 0.35})
    : _groups = _Group.listFrom(source), // Groups of consecutive equal numbers
      strength = strength.clamp(0.2, 0.5);

  List<double> process() {
    return source.length <= 2
        ? List.from(source) // Too short to lerp
        : _groups.asMap().entries.expandToList(_processGroup);
  }

  Iterable<double> _processGroup(MapEntry<int, _Group> entry) {
    final index = entry.key;
    final group = entry.value;
    if (group.length == 1) return [group.value]; // Not a plateau

    final leftBoundary = group.start == 0;
    final rightBoundary = group.end == source.length - 1;

    if (leftBoundary && rightBoundary) {
      // All numbers equal, no neighbors, keeps as-is.
      return List.filled(group.length, group.value);
    }

    // Get neighbor values
    // Note: 0.0 will not be used (just a placeholder in that branch)
    final left = leftBoundary ? 0.0 : _groups[index - 1].value;
    final right = rightBoundary ? 0.0 : _groups[index + 1].value;

    // Internal plateau having both neighbors
    if (!leftBoundary && !rightBoundary) {
      if ((left < group.value && right < group.value) ||
          (left > group.value && right > group.value)) {
        // Keep flat if it's peak or valley
        return List.filled(group.length, group.value);
      } else {
        // Interpolate it into a ramp if on a slope
        return _internalLerp(group.length, group.value, left, right);
      }
    }

    // Boundary plateau (endpoint must stay)
    return _boundaryLerp(group.length, group.value, left, right, leftBoundary);
  }

  List<double> _internalLerp(
    int length,
    double value,
    double left,
    double right,
  ) {
    final double spread, start, end;

    if (left < value && right > value) {
      // Upward: start below value, end above value
      spread = min(value - left, right - value) * strength;
      start = value - spread;
      end = value + spread;
    } else {
      // Downward (assume left > value && right < value)
      spread = min(left - value, value - right) * strength;
      start = value + spread;
      end = value - spread;
    }

    // Evenly spaced linear points
    return List.generate(
      length,
      (index) => start + (end - start) * (index / (length - 1)),
    );
  }

  List<double> _boundaryLerp(
    int length,
    double value,
    double left,
    double right,
    bool isLeftBoundary,
  ) {
    final double start, end;

    if (isLeftBoundary) {
      if (right > value) {
        // Start: first fixed, last moves toward right
        start = value;
        end = value + (right - value) * strength;
      } else {
        start = value;
        end = value - (value - right) * strength;
      }
    } else {
      // End: last fixed, first moves toward left
      if (left < value) {
        start = value - (value - left) * strength;
        end = value;
      } else {
        start = value + (left - value) * strength;
        end = value;
      }
    }

    // Evenly spaced linear points
    return List.generate(
      length,
      (index) => start + (end - start) * (index / (length - 1)),
    );
  }
}

class _Group {
  final double value;

  int length;
  int start = 0;
  int end = 0;

  _Group(this.value, this.length);

  static List<_Group> listFrom(List<double> source) {
    final groups = <_Group>[];

    // Increases the counter if equal to previous one,
    // or else starts a new group for it.
    for (final it in source) {
      if (groups.isNotEmpty && groups.last.value == it) {
        groups.last.length++;
      } else {
        groups.add(_Group(it, 1));
      }
    }

    int cumulative = 0;

    // Initializes properties 'start' and 'end'
    for (final it in groups) {
      it.start = cumulative;
      it.end = it.start + it.length - 1;
      cumulative += it.length;
    }

    return groups;
  }
}
