import 'package:flutter/material.dart';

class ForegroundBar extends StatelessWidget {
  final double height;
  final LinearGradient gradient;
  final double leftSpace;
  final double rightSpace;

  const ForegroundBar({
    super.key,
    required this.height,
    required this.gradient,
    required this.leftSpace,
    required this.rightSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftSpace,
      right: rightSpace,
      top: 0,
      bottom: 0,

      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}
