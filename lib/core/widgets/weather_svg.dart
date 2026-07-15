import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class WeatherSvg extends StatelessWidget {
  final String code;
  final bool filled;
  final Color? color;
  final double? width;
  final double? height;

  const WeatherSvg(
    this.code, {
    super.key,
    this.filled = false,
    this.color,
    this.width,
    this.height,
  });

  WeatherSvg.textStyled(
    this.code, {
    super.key,
    this.filled = false,
    this.color,
    TextStyle? style,
  }) : width = style?.fontSize,
       height = style?.fontSize;

  @override
  Widget build(BuildContext context) {
    final name = filled ? "$code-fill" : code;

    return SvgPicture.asset(
      "assets/weather_icons/$name.svg",
      width: width,
      height: height,
      colorFilter: color?.let((it) => ColorFilter.mode(it, BlendMode.srcIn)),
    );
  }
}
