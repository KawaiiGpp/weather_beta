import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color darker([double amount = 0.1]) => withLightness(-amount);

  Color lighter([double amount = 0.1]) => withLightness(amount);

  Color withLightness(double amount) {
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);

    return hsl.withLightness(lightness).toColor();
  }
}
