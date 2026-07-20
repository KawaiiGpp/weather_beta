import 'package:flutter/material.dart';

class BackgroundBar extends StatelessWidget {
  final double height;
  final Color? color;

  const BackgroundBar({super.key, required this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,

      decoration: BoxDecoration(
        color: color ?? Colors.grey.withAlpha(90),
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}
