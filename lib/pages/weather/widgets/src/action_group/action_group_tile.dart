import 'package:flutter/material.dart';
import 'package:weather_beta/core/extensions/extensions.dart';
import 'package:weather_beta/core/widgets/widgets.dart';
import 'package:weather_beta/pages/weather/widgets/common/weather_card.dart';

class ActionGroupTile extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const ActionGroupTile({
    super.key,
    required this.name,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WeatherCard(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(top: 0, right: 0, child: _icon(context)),
                _content(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return ThemedIcon(
      color: (it) => it.colorScheme.onSurfaceVariant,
      size: (it) => it.textTheme.bodySmall?.fontSize,
      iconData: Icons.open_in_new,
    );
  }

  Widget _content(BuildContext context) {
    final scheme = context.colorScheme;
    final text = context.textTheme;

    final title = text.titleMedium?.copyWith(fontWeight: FontWeight.normal);
    final subtitle = text.bodySmall?.copyWith(color: scheme.onSurfaceVariant);

    return Column(
      children: [
        Icon(icon, color: scheme.primary),
        const SizedBox(height: 8),

        Text(name, style: title),
        const SizedBox(height: 4),

        Text("数据可视化", style: subtitle),
        Text(description, style: subtitle),
      ],
    );
  }
}
