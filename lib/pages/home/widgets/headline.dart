import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    final subtitle = text.titleMedium?.copyWith(fontWeight: FontWeight.w400);

    return Column(
      children: [
        Text("城市天气查询", style: text.displaySmall),
        const SizedBox(height: 12),
        Text("你若安好，便是晴天", style: subtitle),
      ],
    );
  }
}
