import 'package:flutter/material.dart';
import 'package:weather_beta/core/common/common.dart';
import 'package:weather_beta/core/widgets/range_bar/background_bar.dart';
import 'package:weather_beta/core/widgets/range_bar/foreground_bar.dart';

class RangeBar extends StatelessWidget {
  final Range barRange;
  final Range totalRange;
  final double height;
  final LinearGradient gradient;
  final double offset;
  final Color? backgroundColor;

  const RangeBar({
    super.key,
    required this.barRange,
    required this.totalRange,
    required this.height,
    required this.gradient,
    this.offset = 0.04,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final total = totalRange.size;

        final beginPos = _pos(barRange.min - totalRange.min, total, -offset);
        final endPos = _pos(barRange.max - totalRange.min, total, offset);

        return Stack(
          children: [
            BackgroundBar(height: height, color: backgroundColor),

            ForegroundBar(
              height: height,
              leftSpace: beginPos * width,
              rightSpace: (1 - endPos) * width,
              gradient: gradient,
            ),
          ],
        );
      },
    );
  }

  double _pos(double length, double total, double offset) {
    if (total == 0) return 0.0;

    final ratio = (length / total) + offset;
    return ratio.clamp(0, 1);
  }
}
