import 'package:flutter/material.dart';
import 'package:weather_beta/core/constants/app_standard.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class WeatherCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  const WeatherCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.alignment,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: Material(
        color: context.colorScheme.surfaceContainer,
        borderRadius: AppStandard.borderRadius,
        clipBehavior: Clip.antiAlias,

        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          
          child: child?.wrap(
            condition: alignment != null,
            builder: (it) => Align(alignment: alignment!, child: it),
          ),
        ),
      ),
    );
  }
}
