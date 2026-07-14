import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FittedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double minSize;

  const FittedText(
    this.text, {
    super.key,
    this.style,
    this.overflow,
    this.minSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      maxLines: 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      minFontSize: minSize,
    );
  }
}
