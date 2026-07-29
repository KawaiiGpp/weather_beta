import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget wrap({
    bool condition = true,
    required Widget Function(Widget child) builder,
  }) {
    return condition ? builder(this) : this;
  }
}
