import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherSvg extends StatelessWidget {
  final String code;
  final bool filled;
  final double? width;
  final double? height;

  const WeatherSvg(
    this.code, {
    super.key,
    this.filled = false,
    this.width,
    this.height,
  });

  WeatherSvg.textStyled(
    this.code, {
    super.key,
    this.filled = false,
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
    );
  }
}
