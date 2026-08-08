import 'package:flutter/material.dart';
import 'package:weather_beta/pages/weather/widgets/src/action_group/action_group_tile.dart';

class ActionGroup extends StatelessWidget {
  const ActionGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionGroupTile(
          name: "更多气象趋势",
          description: "气温 · 湿度 · 风速",
          icon: Icons.cloud,
          onTap: () {},
        ),

        const SizedBox(width: 12),

        ActionGroupTile(
          name: "更多天文趋势",
          description: "日出日落 · 太阳高度角",
          icon: Icons.auto_awesome,
          onTap: () {},
        ),
      ],
    );
  }
}
