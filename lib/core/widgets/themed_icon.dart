import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class ThemedIcon extends StatelessWidget {
  final double? Function(BuildContext) size;
  final Color? Function(BuildContext) color;
  final IconData iconData;

  const ThemedIcon({
    super.key,
    required this.size,
    required this.color,
    required this.iconData,
  });

  ThemedIcon.error({super.key, required this.size})
    : iconData = Icons.error,
      color = ((ctx) => ctx.colorScheme.error);

  ThemedIcon.info({super.key, required this.size})
    : iconData = Icons.info,
      color = ((ctx) => ctx.colorScheme.primary);

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, size: size(context), color: color(context));
  }
}
