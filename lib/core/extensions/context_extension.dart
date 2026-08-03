import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => TextTheme.of(this);

  ColorScheme get colorScheme => ColorScheme.of(this);

  IconThemeData get iconTheme => IconTheme.of(this);

  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
}
